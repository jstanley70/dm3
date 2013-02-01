package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.Unit;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Unit.class)
public interface UnitRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.Unit> findAll();
}
