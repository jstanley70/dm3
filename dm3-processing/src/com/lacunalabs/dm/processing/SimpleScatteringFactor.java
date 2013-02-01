package com.lacunalabs.dm.processing;

public class SimpleScatteringFactor implements IScatteringFactor {

	int atomicNumber;
	public SimpleScatteringFactor() {
		
	}

	public SimpleScatteringFactor(int atomicNumber) {
		super();
		this.atomicNumber = atomicNumber;
	}

	@Override
	public double getScatteringFactorFromAngle(double d) {
		return atomicNumber/d;
	}

}
