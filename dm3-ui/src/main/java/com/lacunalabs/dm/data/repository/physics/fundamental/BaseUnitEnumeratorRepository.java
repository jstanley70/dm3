package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.BaseUnitEnumerator;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = BaseUnitEnumerator.class)
public interface BaseUnitEnumeratorRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.BaseUnitEnumerator> findAll();
}
