package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.ScienceUnit;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = ScienceUnit.class)
public interface ScienceUnitRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.ScienceUnit> findAll();
}
