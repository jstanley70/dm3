package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.ReflectionCondition;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = ReflectionCondition.class)
public interface ReflectionConditionRepository {

    List<com.lacunalabs.dm.data.physics.crystallography.ReflectionCondition> findAll();
}
