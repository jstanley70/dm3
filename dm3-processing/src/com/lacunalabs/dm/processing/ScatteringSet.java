package com.lacunalabs.dm.processing;

public class ScatteringSet {

	private double u;
	private double v;
	private double w;
	private double z;
	private double bi;
	
	public ScatteringSet(double u, double v, double w, double z,
		double bi) {
		super();
		this.u = u;
		this.v = v;
		this.w = w;
		this.z = z;
		this.bi = bi;
	}
	
	
	public double getU() {
		return u;
	}
	public void setU(double u) {
		this.u = u;
	}
	public double getV() {
		return v;
	}
	public void setV(double v) {
		this.v = v;
	}
	public double getW() {
		return w;
	}
	public void setW(double w) {
		this.w = w;
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
}
