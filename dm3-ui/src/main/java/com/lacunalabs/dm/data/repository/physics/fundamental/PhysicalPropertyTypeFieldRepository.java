package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyTypeField;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = PhysicalPropertyTypeField.class)
public interface PhysicalPropertyTypeFieldRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyTypeField> findAll();
}
