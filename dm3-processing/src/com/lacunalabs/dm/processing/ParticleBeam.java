package com.lacunalabs.dm.processing;

public class ParticleBeam {

		double mass;
		double spin;
		double charge;
		double energy;
		double wavelength;
		int beamType;
		
		public ParticleBeam()
		{
			super();
			mass = 1e-31;
			spin = -.5;
			charge = -1;
			energy = 100e6;
			wavelength = 2e-11;
			beamType = 1;
		}
		
		
		public ParticleBeam(double mass, double spin, double charge,
				double energy, int beamType) {
			super();
			this.mass = mass;
			this.spin = spin;
			this.charge = charge;
			this.energy = energy;
			this.wavelength = calcWavelength();
		}


		private double calcWavelength() {
			return mass/energy;
		}

		public double getMass() {
			return mass;
		}
		public void setMass(double mass) {
			this.mass = mass;
		}
		public double getSpin() {
			return spin;
		}
		public void setSpin(double spin) {
			this.spin = spin;
		}
		public double getCharge() {
			return charge;
		}
		public void setCharge(double charge) {
			this.charge = charge;
		}
		public double getEnergy() {
			return energy;
		}
		public void setEnergy(double energy) {
			this.energy = energy;
		}
		public double getWavelength() {
			return wavelength;
		}
		public void setWavelength(double wavelength) {
			this.wavelength = wavelength;
		}
		
		public double calculateElectronMassRatio()
		{
			return   1. + (energy / 511.);
		}
		
		public double calculateEwaldSphereRadius()
		{
				return 1/getWavelength();
		}
		
		public double getSFRatio()
		{
					double ratio;
				switch(beamType){
					case 1:
					default:
						ratio 	= .318309856;//(47.878009) * (.006648352);
					break;
					case 2:
						ratio 	= 2.818e-5 * wavelength *  wavelength;
					break;
				}
				return ratio;
		}
	/* This is the old methodology
	if(g_StructureEV){
	if(g_StructureEV == 2){
		double ratio;
		switch(gCurrentObj->theBeamFlag){
			case 1:
			default:
			ratio 	= (47.878009) * (.006648352);
			break;
			case 2:
				ratio 	= 2.818e-5 * ( gCurrentObj->wavelength *  gCurrentObj->wavelength);
			break;
		}
		return RCmul( ratio/ volume,value);
	}
	return RCmul((47.878009) / volume,value),structureFlag,t
	lse return complexV;*/
		
}
