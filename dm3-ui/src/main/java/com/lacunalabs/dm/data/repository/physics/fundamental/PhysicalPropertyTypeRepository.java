package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyType;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = PhysicalPropertyType.class)
public interface PhysicalPropertyTypeRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyType> findAll();
}
