package com.lacunalabs.dm.data.physics.experiment;

public class DiffractionSpot {
	
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
	public float getX() {
		return x;
	}
	public void setX(float x) {
		this.x = x;
	}
	public float getY() {
		return y;
	}
	public void setY(float y) {
		this.y = y;
	}
	public float getZ() {
		return z;
	}
	public void setZ(float z) {
		this.z = z;
	}
	public float getIntensity() {
		return intensity;
	}
	public void setIntensity(float intensity) {
		this.intensity = intensity;
	}
	
	public DiffractionSpot()
	{
		super();
		this.h = 0;
		this.k = 0;
		this.l = 0;
		this.x = 0;
		this.y = 0;
		this.z = 0;
		this.intensity = 1;
	}
	
	public DiffractionSpot(int h, int k, int l, float x, float y, float z, float intensity) {
		super();
		this.h = h;
		this.k = k;
		this.l = l;
		this.x = x;
		this.y = y;
		this.z = z;
		this.intensity = intensity;
	}
	private int h;
	private int k;
	private int l;
	private float x;
	private float y;
	private float z;
	private float intensity;
}
