package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.PointGroup;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = PointGroup.class)
public interface PointGroupRepository {

    List<com.lacunalabs.dm.data.physics.crystallography.PointGroup> findAll();
}
