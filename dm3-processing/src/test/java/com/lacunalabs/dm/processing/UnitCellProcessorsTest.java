package com.lacunalabs.dm.processing;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.commons.math3.geometry.euclidean.threed.Vector3D;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class UnitCellProcessorsTest {

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
	public void testCalculateSVals() {
		UnitCellParameters uc = new UnitCellParameters();
		double[] svals = UnitCellProcessors.calculateSVals(uc);
		assertTrue(svals.length == 6);
	}

	@Test
	public void testCalculateCellVolume() {
		UnitCellParameters uc = new UnitCellParameters();
		double volume = UnitCellProcessors.calculateCellVolume(uc);
		assertTrue(volume > 0);
	}

	@Test
	public void testCalculatePlaneToDir() {
		UnitCellParameters uc = new UnitCellParameters();
		Vector3D v = UnitCellProcessors.calculatePlaneToDir(uc, 1, 4, 3);
		assertTrue(v.getX() == 1 && v.getY() == 4 && v.getZ() == 3);
	}

	@Test
	public void testCalculateGet001XForm() {
		UnitCellParameters uc = new UnitCellParameters();
		double[][] xForm = UnitCellProcessors.calculateGet001XForm(uc);
		assertTrue(xForm.length == 6);
	}

	@Test
	public void testCalculateDspacing() {
		UnitCellParameters uc = new UnitCellParameters();
		double dspacing = UnitCellProcessors.calculateDspacing(uc, 3, 3, 3);
		assertTrue(dspacing > 0);
	}

	@Test
	public void testCalculateDSpacings() {
		UnitCell uc = new UnitCell();
		ParticleBeam beam = new ParticleBeam();
		Collection<Dspace> dspacings = UnitCellProcessors.calculateDSpacings(uc, 3, 3, 3, beam);
		assertTrue(dspacings.size() == 6);
	}

	@Test
	public void testEliminateHKLRedundancy() {
		UnitCell uc = new UnitCell();
		ParticleBeam beam = new ParticleBeam();
		ArrayList<Dspace> dspacings = UnitCellProcessors.calculateDSpacings(uc, 3, 3, 3, beam);
		ArrayList<Dspace> dspacings_clean = UnitCellProcessors.eliminateHKLRedundancy(dspacings);
		assertTrue(dspacings.size() > dspacings_clean.size());
	}

	@Test
	public void testSetIntensities() {
		UnitCell uc = new UnitCell();
		ParticleBeam beam = new ParticleBeam();
		ArrayList<Dspace> dspacings = UnitCellProcessors.calculateDSpacings(uc, 3, 3, 3, beam);
		dspacings = UnitCellProcessors.setIntensities(dspacings, uc, beam);
		assertTrue(dspacings.size() > 0);
	}

	@Test
	public void testSetScatteringPositionAandIntensity() {
		UnitCell uc = new UnitCell();
		ScatteringSet[] set = UnitCellProcessors.setScatteringPositionAandIntensity(uc, .0001, 12);
		assertTrue(set.length > 0);
	}

	@Test
	public void testAtomicScatteringsByAngle() {
		UnitCell uc = new UnitCell();
		ScatteringSet zs[] = UnitCellProcessors.setScatteringPositionAandIntensity(uc, .0001, 12);
		ScatteringSet[] set = UnitCellProcessors.atomicScatteringsByAngle(1.0, 1.0, zs, uc.getAtoms().toArray(new ScatteringAtom[uc.getAtoms().size()]));
		assertTrue(set.length > 0);
	}

	@Test
	public void testStructureFactor() {
		UnitCell uc = new UnitCell();
		double dspace = UnitCellProcessors.calculateDspacing(uc.getParameters(), 1, 1, 1);
		ScatteringSet zs[] = UnitCellProcessors.setScatteringPositionAandIntensity(uc, .0001, 12);
		ScatteringSet[] ss = UnitCellProcessors.atomicScatteringsByAngle(dspace, 1.0, zs, uc.getAtoms().toArray(new ScatteringAtom[uc.getAtoms().size()]));
		double volume = UnitCellProcessors.calculateCellVolume(uc.getParameters());
		ParticleBeam beam = new ParticleBeam();
		UnitCellProcessors.structureFactor(1, 1, 1, ss, volume, dspace, beam.getSFRatio());
	}

}
