package com.lacunalabs.dm.processing;

public class Microscope {

		double cameraLength = 0.0;
		ParticleBeam beam;
		Detector detector;
		
		public double calcCameraConstant() {
				
			return this.cameraLength * this.beam.getWavelength();
		}
		
		public double calcSetCameraLengthFromCameraConstant(double cameraConstant)
		{
			if(this.beam != null && cameraConstant > 0.0)
				this.cameraLength = cameraConstant / this.beam.getWavelength();
			return this.cameraLength;
		}
	
		public double getCameraLength() {
			return cameraLength;
		}
		public void setCameraLength(double cameraLength) {
			this.cameraLength = cameraLength;
		}
		
		public ParticleBeam getBeam() {
			return beam;
		}
		
		public void setBeam(ParticleBeam beam) {
			this.beam = beam;
		}
		
		public Detector getDetector() {
			return detector;
		}
		
		public void setDetector(Detector detector) {
			this.detector = detector;
		}
		
		
}
