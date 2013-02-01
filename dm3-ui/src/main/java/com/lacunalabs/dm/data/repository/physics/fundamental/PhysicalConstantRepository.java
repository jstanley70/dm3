package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalConstant;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = PhysicalConstant.class)
public interface PhysicalConstantRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.PhysicalConstant> findAll();
}
