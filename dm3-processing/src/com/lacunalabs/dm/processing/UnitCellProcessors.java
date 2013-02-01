package com.lacunalabs.dm.processing;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Hashtable;

import org.apache.commons.math3.complex.Complex;
import org.apache.commons.math3.geometry.euclidean.threed.Vector3D;

import com.lacunalabs.dm.shared.math.geometry.VectorType;


public class UnitCellProcessors {
	
	public static double[] calculateSVals(UnitCellParameters uc)
	{
		double[] sVals = new double[6];
		double alpha = uc.getAlpha();
		double beta = uc.getBeta();
		double gamma = uc.getGamma();

		sVals[0] = (uc.getB() * uc.getB() * 
				uc.getC() * uc.getC() * 
				Math.sin(alpha) * Math.sin(alpha));
						
		sVals[1] 	= uc.getA() * uc.getA()
						* uc.getC()  * uc.getC() 
						* Math.sin(beta) * Math.sin(beta);
						
		sVals[2] 	= uc.getA() * uc.getA()
						* uc.getB()  * uc.getB() 
						* Math.sin(gamma) * Math.sin(gamma);
						
		sVals[3] 	= uc.getA() * uc.getB() 
						* uc.getC()  * uc.getC() 
						* (Math.cos(alpha) * Math.cos(beta) - Math.cos(gamma));
				
		sVals[4] 	= uc.getB()  * uc.getC() 
						* uc.getA() * uc.getA()
						* (Math.cos(beta) * Math.cos(gamma) - Math.cos(alpha));
						
		sVals[5] 	= uc.getC()  * uc.getA()
						* uc.getB()  * uc.getB() 
						* (Math.cos(gamma) * Math.cos(alpha) - Math.cos(beta));
		
		return sVals;
	}
	
	public static double calculateCellVolume(UnitCellParameters uc)
	{
		double cosA,cosB,cosC;
		cosA 	= Math.cos(uc.getAlpha());
		cosB	= Math.cos(uc.getBeta());
		cosC 	= Math.cos(uc.getGamma());
		
		return	uc.getA() * uc.getB() * uc.getC() *
					Math.sqrt(	1.0 - cosA * cosA - 
							cosB * cosB - cosC * cosC + 
							2.0 * cosA * cosB * cosC);
	
	}
	
	public static Vector3D calculatePlaneToDir(UnitCellParameters uc, double H,double K,double L)
	{
		double	u,v,w;
		
		double[] sVals = calculateSVals(uc);
		u = sVals[0] * H + sVals[3] *  K + sVals[5] *  L;
		v = sVals[3] * H + sVals[1] *  K + sVals[4] *  L; 
		w = sVals[5] * H + sVals[4] *  K + sVals[2] *  L;

		return new Vector3D(u, v, w);
	}
	
	public static double[][] calculateGet001XForm(UnitCellParameters uc)

	{ /*Unfortunately, This Function Returns a column Matrix, not a Row Matrix*/
		double angleA,angleB,angleC,cosGammaPrime,sinGammaPrime;

		angleA = (double)uc.getAlpha();
		angleB = (double)uc.getBeta();
		angleC = (double)uc.getGamma();
		cosGammaPrime = (Math.cos(angleA) * Math.cos(angleB) - Math.cos(angleC))/ (Math.sin(angleA) * Math.sin(angleB));
		if(Math.abs(cosGammaPrime) < 1e-12)cosGammaPrime = 0;
		sinGammaPrime = Math.sqrt(1 - (cosGammaPrime * cosGammaPrime));
		
		double[][] xForm = new double[3][3];
		xForm[0][0] = uc.getA() * Math.sin(angleB) * sinGammaPrime;
		xForm[1][0] = -uc.getA() * Math.sin(angleB) * cosGammaPrime;
		xForm[2][0] = uc.getA() * Math.cos(angleB);
		
		xForm[0][1] = 0.0;
		xForm[1][1] = uc.getB() * Math.sin(angleA);
		xForm[2][1] = uc.getB() * Math.cos(angleA);
		
		xForm[0][2] = 0.0;
		xForm[1][2] = 0.0;
		xForm[2][2] = (double)uc.getC();
		return xForm;
	}

	
	public static double calculateDspacing(UnitCellParameters uc, int h,float k,float l)
	{
		double D,H,K,L;
		double[] sVals = calculateSVals(uc);
		double volume = calculateCellVolume(uc);
		if(volume < 5e-31 || h == 0 && k == 0 && l == 0) return 0;
		H = (double)h;
		K = (double)k;
		L = (double)l;
		D = volume /
				Math.sqrt(
					H * (sVals[0] * H + 2. * sVals[3] * K) +
					K * (sVals[1] * K + 2. * sVals[4] * L) +
					L * (sVals[2] * L + 2. * sVals[5] * H ));
		return (D);
	}
	
	public static ArrayList<Dspace> calculateDSpacings(UnitCell uc, int h, int k, int l, ParticleBeam beam)
	{
		ArrayList<Dspace> dspacing = new ArrayList<Dspace>();
		short 		maxH,minH,maxK,minK,maxL,minL;		
		double sh2 , sk2 , sl2 , skl , shl , shk;
		double sV0,sV1,sV2,sV3,sV4,sV5;
		
		double volumeSqr = calculateCellVolume(uc.getParameters()) * calculateCellVolume(uc.getParameters());

		
		maxH = (short) Math.abs(h);
		minH = (short) -maxH;
		maxK = (short)Math.abs(k);
		minK = (short) -maxK;
		maxL = (short) Math.abs(l);
		minL = (short) -maxL;

		double[] sVals = calculateSVals(uc.getParameters());
		sV0	= sVals[0];
		sV1	= sVals[1];
		sV2	= sVals[2];
		sV3	= sVals[3];
		sV4	= sVals[4];
		sV5	= sVals[5];
		
		for(h = maxH; h >= minH; h--){
			sh2 = h *  h * sV0;
			for(k = maxK ;k >= minK;k--){
				sk2 = k * k * sV1;
				shk = 2 * k * h * sV3;
				for(l = maxL ;l >= minL;l--){
					
					if(l == 0 && k == 0 &&  h == 0)
						continue;
					
					skl = 2 * k * l * sV4;
					shl = 2 * h * l * sV5;
					sl2 = l  * l * sV2;
					double dspace = Math.sqrt(volumeSqr / (sh2 + sk2 + sl2 + skl + shl + shk));
					double inverse = Math.abs(dspace) < 0.0001 ? 10000:Math.abs(dspace);
					dspacing.add(new Dspace(h, k, l, dspace, inverse, new Complex(1,0)));
				}
			}
		}	
		dspacing = eliminateHKLRedundancy(dspacing);
		return setIntensities(dspacing, uc, beam);
	}
	
	public static ArrayList<Dspace> eliminateHKLRedundancy(ArrayList<Dspace> dspacings)
	{
		ArrayList<Dspace> unique = new ArrayList<Dspace>();
		short j;		
		if(dspacings.size() < 2)
			return dspacings;		

		Collections.sort(dspacings, new DspaceComparator());		
				
		j = 0;
		unique.add(dspacings.get(0));
		for(Dspace dspace : dspacings){
			if(dspace.compareTo(unique.get(j), .001, .01) == 0)
				continue;
			j++;
			unique.add(dspace);
		}
		return unique;
	}

	public static ArrayList<Dspace> setIntensities(ArrayList<Dspace> dspacings, UnitCell uc, ParticleBeam beam)
	{
		double electronMassRatio = beam.calculateElectronMassRatio();
		double volume = calculateCellVolume(uc.getParameters());

		ScatteringSet[] ss = setScatteringPositionAandIntensity(uc, 0.0, electronMassRatio);
		Complex sF	= structureFactor(0,0,0, ss, volume, 10000, beam.getSFRatio());
		
		for(Dspace d : dspacings){
			ss = setScatteringPositionAandIntensity(uc, d.getDspace(), electronMassRatio);
			sF	= structureFactor(d.getH(), d.getK(), d.getL(), ss,volume, d.getDspace(), beam.getSFRatio());
			d.setScatteringIntensty(sF);
		}
		
		return dspacings;
	}

	public static ScatteringSet[] setScatteringPositionAandIntensity(UnitCell uc, double scatteringAngle, double electronMassRation)
	{ 
		int	n = 0;
		ScatteringSet[] ss = new ScatteringSet[uc.getAtoms().size()];
		Hashtable<Integer,Double>	elements = new Hashtable<Integer,Double>();
		double		atomicScatterNum;
		
		for(ScatteringAtom atom : uc.getAtoms()){
			if(elements.contains(atom.getAtomicNumber())) {
				atomicScatterNum = elements.get(atom.getAtomicNumber());
			}else {
				atomicScatterNum = atom.calculateScatteringFactorFromAngle(scatteringAngle);
				elements.put(atom.getAtomicNumber(), atomicScatterNum);
			}
			ss[n++] = new ScatteringSet(atom.getX() ,  atom.getY(), atom.getZ(), atomicScatterNum   *  electronMassRation, atom.getBi());
		}
		return ss;
	}
	
	public static ScatteringSet[]	atomicScatteringsByAngle(double d, double electronMassRation, ScatteringSet zs[], ScatteringAtom[] atoms)
	{
		Hashtable<Integer,Double>	elements = new Hashtable<Integer,Double>();
		double		atomicScatterNum;
		int i = 0;
		for(ScatteringAtom atom : atoms){
			if(elements.contains(atom.getAtomicNumber())) {
				atomicScatterNum = elements.get(atom.getAtomicNumber());
			}else {
				atomicScatterNum = atom.calculateScatteringFactorFromAngle(d);
				elements.put(atom.getAtomicNumber(), atomicScatterNum);
			}
			zs[i++].setZ(atomicScatterNum   *  electronMassRation);
		}
		return zs;
	}

	public static Complex structureFactor(long h,long k, long l, ScatteringSet[] ss,double volume, double dspace, double ratio)
	{
		double 	imaginary = 0;
		double 	real = 0;
		double	angle;
		Complex complexV;		
	    for(ScatteringSet s: ss)
		{
		
			angle = 6.28318530717958648 * ((s.getU() * h + s.getV() * k + s.getW() * l) %  1.0);
			real += s.getZ() * Math.cos(angle);
			imaginary += s.getZ() * Math.sin(angle);
		}
		complexV 	= new Complex(real, imaginary) ;
		
		return complexV.multiply( ratio/ volume);
	
	}
	
	public static double[][] calculateCrystalXFormOrientedToBeam(UnitCellParameters uc, double beamrotation[][] )
	{
			
		double[][] xForm = calculateGet001XForm(uc);
		//MatrixMultiply(xForm, beamrotation, xForm); 
		return calculateReciprocalXForm(xForm, calculateCellVolume(uc),true);
	}
	
	public static double[][] calculateReciprocalXForm(double[][] crystalvector,double volume, Boolean leftHanded)
	{
		Vector3D crystalvector1;
		Vector3D crystalvector2;
		Vector3D crystalvector3;
		double[][] reciprocalMatrix = new double[3][3];
		double A;
		
		Vector3D vector0 = new Vector3D(crystalvector[0][0], crystalvector[0][1], crystalvector[0][2]);
		Vector3D vector1 = new Vector3D(crystalvector[1][0], crystalvector[1][1], crystalvector[1][2]); 
		Vector3D vector2 = new Vector3D(crystalvector[2][0], crystalvector[2][1], crystalvector[2][2]);
		
		crystalvector1 = vector1.crossProduct(vector2);
		crystalvector2 = vector2.crossProduct(vector0);
			
		if(leftHanded){
			crystalvector3 = vector1.crossProduct(vector0);
		}else{
			crystalvector3 = vector0.crossProduct(vector1);
		}
		A = 1. /  volume;
		crystalvector1 = crystalvector1.scalarMultiply(A);
		crystalvector2 = crystalvector2.scalarMultiply(A);
		crystalvector3 = crystalvector3.scalarMultiply(A);
		
		reciprocalMatrix[0][0] = crystalvector1.getX() ;
		reciprocalMatrix[0][1] = crystalvector1.getY() ;
		reciprocalMatrix[0][2] = crystalvector1.getZ() ;
		reciprocalMatrix[1][0] = crystalvector1.getX() ;
		reciprocalMatrix[1][1] = crystalvector1.getY() ;
		reciprocalMatrix[1][2] = crystalvector1.getZ() ;
		reciprocalMatrix[2][0] = crystalvector1.getX() ;
		reciprocalMatrix[2][1] = crystalvector1.getY() ;
		reciprocalMatrix[2][2] = crystalvector1.getZ() ;
		return reciprocalMatrix;
	}
	
	public static double[] calculateDirectionOfPlaneNormal(UnitCellParameters uc, double[] uvw, VectorType vectorType){
		if(VectorType == VectorType.DIRECTION)
			return uvw;
		
		double[] sVals = calculateSVals(uc);
		double h = uvw[0];
		double k = uvw[1];
		double l = uvw[2];
		
		uvw[0] = h * sVals[0] + k * sVals[3] + l * sVals[5];
		uvw[1] = h * sVals[3] + k * sVals[1] + l * sVals[4];
		uvw[2] = h * sVals[5] + k * sVals[4] + l * sVals[2];
		
		uvw[0] /= calculateCellVolume(uc);
		uvw[1] /= calculateCellVolume(uc);
		uvw[2 ]/= calculateCellVolume(uc);
		return uvw;
	}
	
}
