package com.lacunalabs.dm.processing;

public class MaxLatticeDimension {

	long maxH;
	long maxK;
	long maxL;
	long minH;
	long minK;
	long minL;
	public long getMaxH() {
		return maxH;
	}
	public void setMaxH(long maxH) {
		this.maxH = maxH;
	}
	public long getMaxK() {
		return maxK;
	}
	public void setMaxK(long maxK) {
		this.maxK = maxK;
	}
	public long getMaxL() {
		return maxL;
	}
	public void setMaxL(long maxL) {
		this.maxL = maxL;
	}
	public long getMinH() {
		return minH;
	}
	public void setMinH(long minH) {
		this.minH = minH;
	}
	public long getMinK() {
		return minK;
	}
	public void setMinK(long minK) {
		this.minK = minK;
	}
	public long getMinL() {
		return minL;
	}
	public void setMinL(long minL) {
		this.minL = minL;
	}
	public MaxLatticeDimension(long maxH, long maxK, long maxL, long minH,
			long minK, long minL) {
		super();
		this.maxH = maxH;
		this.maxK = maxK;
		this.maxL = maxL;
		this.minH = minH;
		this.minK = minK;
		this.minL = minL;
	}
	
	
	
}
