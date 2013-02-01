package com.lacunalabs.dm.processing;

import org.apache.commons.math3.complex.Complex;

public class Dspace {
	
	private Double dspace;
	private Double inverse;
	private Complex scatteringIntensity;
	private int h;
	private int k;
	private int l;
	
	public Dspace()
	{
		this.dspace = 0.0;
		this.inverse = 0.0;
		this.scatteringIntensity = new Complex(0,0);
		this.h = 0;
		this.k = 0;
		this.l = 0;
	}
	
	public Dspace(int h,
			int k, int l, double dspace, double inverse, Complex intensity) {
		super();
		this.dspace = dspace;
		this.inverse = inverse;
		this.scatteringIntensity = intensity;
		this.h = h;
		this.k = k;
		this.l = l;
	}

	public Double getDspace() {
		return dspace;
	}
	public void setDspace(double dspace) {
		this.dspace = dspace;
	}
	public Double getInverse() {
		return inverse;
	}
	public void setInverse(double inverse) {
		this.inverse = inverse;
	}
	public double getIntensity() {
		return scatteringIntensity.abs();
	}
	
	public void setScatteringIntensty(Complex scatteringIntensity)
	{
		this.scatteringIntensity = scatteringIntensity;
	}

	public int getH() {
		return h;
	}
	public void setH(int h) {
		this.h = h;
	}
	public int getK() {
		return k;
	}
	public void setK(int k) {
		this.k = k;
	}
	public int getL() {
		return l;
	}
	public void setL(int l) {
		this.l = l;
	}
	
	public int compareTo(Dspace dspace, double dspaceErr, double intensityErr)
	{
		if(Math.abs(dspace.getIntensity() - getIntensity()) < intensityErr && 
				Math.abs(dspace.getDspace() - getDspace()) < dspaceErr/10){				
				if(Math.abs(dspace.getH()) == Math.abs(getH()) &&
						Math.abs(dspace.getK()) == Math.abs(getK()) &&	
								Math.abs(dspace.getL()) == Math.abs(getL()))
								return 0;
			}

		if(dspace.getDspace() < getDspace())
			return -1;
		return 1;
	}
	

}
