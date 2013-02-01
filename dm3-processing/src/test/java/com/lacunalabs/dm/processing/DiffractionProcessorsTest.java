package com.lacunalabs.dm.processing;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.apache.commons.math3.complex.Complex;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import com.lacunalabs.dm.processing.DiffractionProcessors;

import flexjson.JSONSerializer;

public class DiffractionProcessorsTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testLatticeDimensions() {
		
		
	}

	@Test
	public void testcalculateDiffractionPattern() {
		UnitCell uc = new UnitCell();
		Microscope scope = new Microscope();

		double crystalThicknessToBeam = 200e-9;
		
		scope.setDetector(new Detector());
		
		scope.setBeam(new ParticleBeam());
		scope.setCameraLength(.4);
		double[][] xForm001 = UnitCellProcessors.calculateCrystalXFormOrientedToBeam(uc.getParameters(), new double[3][3]);
		
		ArrayList<DiffractionSpot> spots = DiffractionProcessors.calculateDiffractionPattern(uc, xForm001, scope, crystalThicknessToBeam);
		assertTrue(spots.size() == 20);
	}

	@Test
	public void testOutsideCollectionDevice() {
		boolean isOutside = DiffractionProcessors.outsideCollectionDevice(0, 0, 1, 0, 0, 4, 400, 400, 3, 2, 4000, .02);
		assertTrue(isOutside);
	}

	@Test
	public void testCalcExtinctionDistance() {
		DiffractionSpot pole = new DiffractionSpot(0,0,1,0,0, 4e-10, new Complex(1,0));
		double radiusEwaldSpehere = .003;
		
		double extinctDistance = DiffractionProcessors.calcExtinctionDistance(pole, radiusEwaldSpehere);
		assertTrue(0.009424777960769359 == extinctDistance);
	}

	@Test
	public void testGetSpikingFactor() {
		fail("Not yet implemented");
	}

}
