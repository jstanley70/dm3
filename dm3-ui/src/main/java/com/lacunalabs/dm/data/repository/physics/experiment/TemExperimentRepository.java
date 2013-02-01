package com.lacunalabs.dm.data.repository.physics.experiment;

import com.lacunalabs.dm.data.physics.experiment.TemExperiment;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = TemExperiment.class)
public interface TemExperimentRepository {

    List<com.lacunalabs.dm.data.physics.experiment.TemExperiment> findAll();
}
