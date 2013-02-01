package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.ParticlePhysicalProperty;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = ParticlePhysicalProperty.class)
public interface ParticlePhysicalPropertyRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.ParticlePhysicalProperty> findAll();
}
