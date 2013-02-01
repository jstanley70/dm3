package com.lacunalabs.dm.data.repository.physics.instruments;

import com.lacunalabs.dm.data.physics.instruments.LensPhysicalProperty;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = LensPhysicalProperty.class)
public interface LensPhysicalPropertyRepository {

    List<com.lacunalabs.dm.data.physics.instruments.LensPhysicalProperty> findAll();
}
