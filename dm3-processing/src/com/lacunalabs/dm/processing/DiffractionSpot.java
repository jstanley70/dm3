package com.lacunalabs.dm.processing;

import org.apache.commons.math3.complex.Complex;

public class DiffractionSpot {
	int h;
	int k;
	int l;
	double x;
	double y;
	double z;
	Complex intensity;
	
	public DiffractionSpot()
	{
		super();
		h = 1;
		k = 0;
		l = 0;
		x = 1;
		y = 0;
		l = 0;
		intensity = new Complex(1,0);
	}
	
	public DiffractionSpot(int h, int k, int l, double x, double y, double z,
			Complex intensity) {
		super();
		this.h = h;
		this.k = k;
		this.l = l;
		this.x = x;
		this.y = y;
		this.z = z;
		this.intensity = intensity;
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
	public Complex getIntensity() {
		return intensity;
	}
	public void setIntensity(Complex intensity) {
		this.intensity = intensity;
	}

}
