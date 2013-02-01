package com.lacunalabs.dm.processing.diffraction;

import com.lacunalabs.dm.data.physics.experiment.DiffractionPattern;
import com.lacunalabs.dm.processing.IProcessor;

public class SadDiffraction implements IProcessor {
	
	public SadDiffraction()
	{
		super();
	}

	@Override
	public Object process(Object data) {
		SadData sadData = (SadData)data;
		return DiffractionPattern.getSimplePattern();
	}

}
