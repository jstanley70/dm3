package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.MaterialPhysicalProperty;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = MaterialPhysicalProperty.class)
public interface MaterialPhysicalPropertyRepository {

    List<com.lacunalabs.dm.data.physics.solidstate.MaterialPhysicalProperty> findAll();
}
