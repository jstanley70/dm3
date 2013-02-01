package com.lacunalabs.dm.processing;

import java.math.BigDecimal;

import com.lacunalabs.dm.shared.math.geometry.VectorType;


public class Orientation {
	private double[] zAspect;

    private double[] yAspect;

    private BigDecimal rotationAboutZ;

    private BigDecimal rotationAboutAspectY;
    
    
    private VectorType zVectorType; 
    private VectorType yVectorType;  

	public double[] getzAspect() {
		return zAspect;
	}

	public void setzAspect(double[] zAspect) {
		this.zAspect = zAspect;
	}

	public double[] getyAspect() {
		return yAspect;
	}

	public void setyAspect(double[] yAspect) {
		this.yAspect = yAspect;
	}

	public BigDecimal getRotationAboutZ() {
		return rotationAboutZ;
	}

	public void setRotationAboutZ(BigDecimal rotationAboutZ) {
		this.rotationAboutZ = rotationAboutZ;
	}

	public BigDecimal getRotationAboutAspectY() {
		return rotationAboutAspectY;
	}

	public void setRotationAboutAspectY(BigDecimal rotationAboutAspectY) {
		this.rotationAboutAspectY = rotationAboutAspectY;
	}

	public VectorType getzVectorType() {
		return zVectorType;
	}

	public void setzVectorType(VectorType zVectorType) {
		this.zVectorType = zVectorType;
	}

	public VectorType getyVectorType() {
		return yVectorType;
	}

	public void setyVectorType(VectorType yVectorType) {
		this.yVectorType = yVectorType;
	}

}
