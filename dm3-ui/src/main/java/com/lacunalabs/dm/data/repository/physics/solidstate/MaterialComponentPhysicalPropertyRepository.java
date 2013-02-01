package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.MaterialComponentPhysicalProperty;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = MaterialComponentPhysicalProperty.class)
public interface MaterialComponentPhysicalPropertyRepository {

    List<com.lacunalabs.dm.data.physics.solidstate.MaterialComponentPhysicalProperty> findAll();
}
