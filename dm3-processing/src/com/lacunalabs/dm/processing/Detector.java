package com.lacunalabs.dm.processing;

public class Detector {
	
	double horizontalSide;
	double verticalSide;
	
	public Detector()
	{
		super();
		horizontalSide = .04;
		verticalSide = .04;
	}
	
	
	
	public Detector(double horizontalSide, double verticalSide) {
		super();
		this.horizontalSide = horizontalSide;
		this.verticalSide = verticalSide;
	}



	double calculateReciprocalXLimit(Microscope scope)
	{
		return horizontalSide * .5 /scope.calcCameraConstant();
	}
	
	double calculateReciprocalYLimit(Microscope scope)
	{
		return verticalSide * .5 /scope.calcCameraConstant();
	}
	
	double calculateZLimit(Microscope scope, ParticleBeam beam)
	{
		double ewaldRadius = beam.calculateEwaldSphereRadius();
		double zLimit = ewaldRadius * (1 - Math.cos(Math.atan(calculateReciprocalYLimit(scope) / ewaldRadius))) + .3;
		zLimit -= ewaldRadius;
		return zLimit;
	}

}
