package com.lacunalabs.dm.data.repository.physics.instruments;

import com.lacunalabs.dm.data.physics.instruments.TemObjectiveLens;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = TemObjectiveLens.class)
public interface TemObjectiveLensRepository {

    List<com.lacunalabs.dm.data.physics.instruments.TemObjectiveLens> findAll();
}
