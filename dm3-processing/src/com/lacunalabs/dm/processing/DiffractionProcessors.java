package com.lacunalabs.dm.processing;

import java.util.ArrayList;

import org.apache.commons.math3.complex.Complex;
import org.apache.commons.math3.geometry.euclidean.threed.Vector3D;

public class DiffractionProcessors {

	public static MaxLatticeDimension latticeDimensions(UnitCell uc,
			double width) {

		
		if (UnitCellProcessors.calculateDspacing(uc.getParameters(), 1, 0, 0) > 0) {
			Long maxH = Math.round(width * (UnitCellProcessors.calculateDspacing(uc.getParameters(),
					1, 0, 0) * 2) );
			Long maxK = Math.round(width * (UnitCellProcessors.calculateDspacing(uc.getParameters(),
					0, 1, 0) * 2) );
			Long maxL = Math.round(width * (UnitCellProcessors.calculateDspacing(uc.getParameters(),
							0, 0, 1) * 2));

			return new MaxLatticeDimension(maxH, maxK, maxL, -maxH, -maxK,
					-maxL);
		}

		return null;
	}

	public static ArrayList<DiffractionSpot> calculateDiffractionPattern(UnitCell uc,
			double[][] xForm, Microscope scope, double crystalThicknessToBeam) {

		ArrayList<DiffractionSpot> poles = new ArrayList<DiffractionSpot>();
		double reciprocalLimit = (scope.detector.calculateReciprocalXLimit(scope) + scope.detector.calculateReciprocalYLimit(scope)) / 2;
		MaxLatticeDimension lds = latticeDimensions(uc,  reciprocalLimit);
		double RofEwaldSph = scope.beam.calculateEwaldSphereRadius();
		double electronMassRation = scope.beam.calculateElectronMassRatio();
		DiffractionSpot pole = new DiffractionSpot();
		double centralDistance = calcExtinctionDistance(pole, RofEwaldSph);
		double xLimit = scope.detector.calculateReciprocalXLimit(scope);
		double yLimit = scope.detector.calculateReciprocalYLimit(scope);
		double zLimit = scope.detector.calculateZLimit(scope, scope.beam);
		double chx = xForm[0][0];
		double chy = xForm[1][0];
		double chz = xForm[2][0];
		double ckx = xForm[0][1];
		double cky = xForm[1][1];
		double ckz = xForm[2][1];
		double clx = xForm[0][2];
		double cly = xForm[1][2];
		double clz = xForm[2][2];
		double sfRatio = scope.getBeam().getSFRatio();

		double spikingFactor = getSpikingFactor(uc, crystalThicknessToBeam);

		if (spikingFactor < .006e-9)
			spikingFactor = .006e-9;
		double volume = UnitCellProcessors.calculateCellVolume(uc.getParameters());
		ScatteringSet[] ss = UnitCellProcessors.setScatteringPositionAandIntensity(uc, 10000, electronMassRation);
		Complex sF = UnitCellProcessors.structureFactor(0, 0, 0, ss, volume, 10000, sfRatio);
		double cutOff = sF.abs() * .0005;

		double spikingFactorSqr = spikingFactor * spikingFactor /*
																 * 100. * z1 *
																 * z1 /
																 * ((double)
																 * theFoilThickness
																 * *
																 * theFoilThickness
																 * )
																 */;

		double zLow = -spikingFactor - RofEwaldSph;
		double x = lds.minH * chx;
		double y = lds.minH * chy;
		double z = lds.minH * chz;
		for (long H = lds.minH; H <= lds.maxH; H += 1) {
			double x1 = x + lds.minK * ckx;
			double y1 = y + lds.minK * cky;
			double z1 = z + lds.minK * ckz;
			for (long K = lds.minK; K <= lds.maxK; K += 1) {
				double x2 = x1 + lds.minL * clx;
				double y2 = y1 + lds.minL * cly;
				double z2 = z1 + (lds.minL * clz) - RofEwaldSph;//
				for (long L = lds.minL; L <= lds.maxL; L += 1) {
					if (!outsideCollectionDevice(H, K, L, x2, y2, z2, xLimit,
							yLimit, zLimit, zLow, RofEwaldSph, spikingFactor)) {

						double theD = x2 * x2 + y2 * y2;
						double theDist = Math.abs((RofEwaldSph - Math.sqrt(theD
								+ (z2 * z2))));
						if (spikingFactorSqr - theDist * theDist > 0) {
							ss = UnitCellProcessors
									.setScatteringPositionAandIntensity(uc,
											theD, electronMassRation);
							sF = UnitCellProcessors.structureFactor(H, K, L,
									ss, volume, theD, sfRatio);
							double intens = (double) (sF.abs() * Math
									.sqrt(Math.abs((spikingFactorSqr - theDist
											* theDist))
											/ spikingFactorSqr));
							if (intens >= cutOff) {

								double distance, testD;
								pole = new DiffractionSpot();
								pole.x = x2;
								pole.y = y2;
								pole.z = (z2 + RofEwaldSph);
								pole.intensity = sF;
								distance = calcExtinctionDistance(pole,
										RofEwaldSph);
								testD = spikingFactor
										* (1.23 - Math.exp(-1.5
												* centralDistance / distance));
								if (theDist < testD) {
									pole.h = (int) H;
									pole.k = (int) K;
									pole.l = (int) L;
									poles.add(pole);
								}

							}
						}
					}
					x2 += clx;
					y2 += cly;
					z2 += clz;
				}
				x1 += ckx;
				y1 += cky;
				z1 += ckz;
			}
			x += chx;
			y += chy;
			z += chz;
		}
		return poles;
	}

	public static Boolean outsideCollectionDevice(double h, double k, double l,
			double x2, double y2, double z2, double xLimit, double yLimit,
			double zLimit, double zLow, double RofEwaldSph, double spikingFactor) {
		if (h == 0 && k == 0 && l == 0)
			return true;
		if (z2 < zLow || z2 > zLimit || Math.abs(x2) > xLimit
				|| Math.abs(y2) > yLimit)
			return true;
		double d = x2 * x2 + y2 * y2;
		double delZ = Math.abs((RofEwaldSph - Math.sqrt(d + (z2 * z2))));
		if (delZ > spikingFactor)
			return true;
		return false;
	}

	public static double calcExtinctionDistance(DiffractionSpot pole,
			double radiusEwaldSphere) {
		double testDspace, theValue, braggSine, braggCosine;
		testDspace = new Vector3D(pole.x, pole.y, pole.z).getNorm();
		theValue = pole.intensity.abs();
		if (theValue < .0000001)
			return 100000;
		braggSine = .5 * testDspace / (radiusEwaldSphere);
		braggCosine = Math.sqrt(1 - (braggSine * braggSine));

		return (Math.PI * braggCosine * radiusEwaldSphere) / theValue;
	}

	public static double getSpikingFactor(UnitCell uc, double thickness) {
		double spikingFactor = 1 / thickness;
		if (spikingFactor < 3E-9)
			return 3E-9;
		return spikingFactor;
	}
}
