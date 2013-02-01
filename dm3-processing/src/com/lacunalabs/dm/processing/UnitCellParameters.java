package com.lacunalabs.dm.processing;

public class UnitCellParameters {
	
	private double a;
	private double b;
	private double c;
	private double alpha;
	private double beta;
	private double gamma;
	
	public UnitCellParameters(){
		super();
		a = 4e-10;
		b = 4e-10;
		c = 4e-10;
		alpha = Math.PI/2;
		beta = Math.PI/2;
		gamma = Math.PI/2;
	}
	
	public UnitCellParameters(double a, double b, double c, double alpha,
			double beta, double gamma) {
		super();
		this.a = a;
		this.b = b;
		this.c = c;
		this.alpha = alpha;
		this.beta = beta;
		this.gamma = gamma;
	}

	public double getA() {
		return a;
	}
	public void setA(double a) {
		this.a = a;
	}
	public double getB() {
		return b;
	}
	public void setB(double b) {
		this.b = b;
	}
	public double getC() {
		return c;
	}
	public void setC(double c) {
		this.c = c;
	}
	public double getAlpha() {
		return alpha;
	}
	public void setAlpha(double alpha) {
		this.alpha = alpha;
	}
	public double getBeta() {
		return beta;
	}
	public void setBeta(double beta) {
		this.beta = beta;
	}
	public double getGamma() {
		return gamma;
	}
	public void setGamma(double gamma) {
		this.gamma = gamma;
	}
}
