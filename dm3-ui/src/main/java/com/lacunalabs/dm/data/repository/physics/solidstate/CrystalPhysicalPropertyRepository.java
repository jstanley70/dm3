package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.CrystalPhysicalProperty;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = CrystalPhysicalProperty.class)
public interface CrystalPhysicalPropertyRepository {

    List<com.lacunalabs.dm.data.physics.solidstate.CrystalPhysicalProperty> findAll();
}
