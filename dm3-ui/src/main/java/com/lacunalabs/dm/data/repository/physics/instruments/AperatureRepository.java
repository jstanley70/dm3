package com.lacunalabs.dm.data.repository.physics.instruments;

import com.lacunalabs.dm.data.physics.instruments.Aperature;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Aperature.class)
public interface AperatureRepository {

    List<com.lacunalabs.dm.data.physics.instruments.Aperature> findAll();
}
