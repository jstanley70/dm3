package com.lacunalabs.dm.processing;

public class ParticleProcessor {

	static public double AtomicScatterEl(double dInverse,double atomicNumber, double[] scatteringFactors)
	{
		double ratio,base,interval;
		int n = 1;
		
		dInverse /= 2.;
		dInverse	*= 100;
		dInverse = Math.round(dInverse);
		dInverse	/= 100;
		if(dInverse <= .50){
			n = (short)(dInverse / .05);
			base = (double)n * .05;
			interval = .05;
		} else if(dInverse <= 1.0){
			n = 5 + (short)(dInverse / .1);
			base = .5 + (double)(n - 10) * .1;
			interval = .1;
		} else if(dInverse <= 2.0){
			n = 10 + (short)(dInverse / .2);
			base = 1.0 + (double)(n - 15) * .2;
			interval = .2;
		} else if(dInverse <= 3.0){
			n = 16 + (short)(dInverse / .5);
			base = 2.0 + (double)(n - 20) * .5;
			interval = .5;
		} else {
			n = 22;
			base = 3.;
			interval = .5;
		}
		 ratio = (dInverse - base) / interval;
		 
		 interval = (double)(scatteringFactors[n + 1] - scatteringFactors[n]) / 100.0;
		 base = scatteringFactors[n] / 100.;
		 base = (double)(base + ratio * interval);
		 return base;
	}
}
