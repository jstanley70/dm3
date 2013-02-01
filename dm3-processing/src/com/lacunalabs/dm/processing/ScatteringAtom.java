package com.lacunalabs.dm.processing;

public class ScatteringAtom {
	private int atomicNumber;
	private IScatteringFactor scatteringFactors;
	private double x;
	private double y;
	private double z;
	private double bi;
	
	public int getAtomicNumber() {
		return atomicNumber;
	}
	public void setAtomicNumber(int atomicNumber) {
		this.atomicNumber = atomicNumber;
	}
	public IScatteringFactor getScatteringFactors() {
		return scatteringFactors;
	}
	public void setScatteringFactors(IScatteringFactor scatteringFactors) {
		this.scatteringFactors = scatteringFactors;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public double getZ() {
		return z;
	}
	public void setZ(double z) {
		this.z = z;
	}
	public double getBi() {
		return bi;
	}
	public void setBi(double bi) {
		this.bi = bi;
	}
	
	public double calculateScatteringFactorFromAngle(double d)
	{
		return scatteringFactors.getScatteringFactorFromAngle(d);
	}
}
