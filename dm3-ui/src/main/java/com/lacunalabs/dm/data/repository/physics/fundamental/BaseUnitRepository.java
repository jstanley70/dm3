package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.BaseUnit;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = BaseUnit.class)
public interface BaseUnitRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.BaseUnit> findAll();
}
