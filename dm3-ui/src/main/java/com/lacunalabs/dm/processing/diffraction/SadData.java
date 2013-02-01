package com.lacunalabs.dm.processing.diffraction;

public class SadData {
	private double[][]  lattice;
	private double[] 	beam;
	private double[][]  atoms;
	private int[] indexRanges;
	public double[][] getLattice() {
		return lattice;
	}
	public void setLattice(double[][] lattice) {
		this.lattice = lattice;
	}
	public double[] getBeam() {
		return beam;
	}
	public void setBeam(double[] beam) {
		this.beam = beam;
	}
	public double[][] getAtoms() {
		return atoms;
	}
	public void setAtoms(double[][] atoms) {
		this.atoms = atoms;
	}
	public int[] getIndexRanges() {
		return indexRanges;
	}
	public void setIndexRanges(int[] indexRanges) {
		this.indexRanges = indexRanges;
	}
}
