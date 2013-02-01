package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.AtomicPosition;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = AtomicPosition.class)
public interface AtomicPositionRepository {

    List<com.lacunalabs.dm.data.physics.crystallography.AtomicPosition> findAll();
}
