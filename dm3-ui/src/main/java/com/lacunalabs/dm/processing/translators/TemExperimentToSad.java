package com.lacunalabs.dm.processing.translators;

import com.lacunalabs.dm.data.physics.experiment.TemExperiment;
import com.lacunalabs.dm.processing.diffraction.SadData;

public class TemExperimentToSad implements ITranslator {

	@Override
	public Object translate(Object data) {
		TemExperiment experiment = (TemExperiment)data;
		return new SadData();
	}

}
