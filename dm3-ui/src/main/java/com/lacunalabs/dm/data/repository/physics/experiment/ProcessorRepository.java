package com.lacunalabs.dm.data.repository.physics.experiment;

import com.lacunalabs.dm.data.physics.experiment.Processor;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Processor.class)
public interface ProcessorRepository {

    List<com.lacunalabs.dm.data.physics.experiment.Processor> findAll();
}
