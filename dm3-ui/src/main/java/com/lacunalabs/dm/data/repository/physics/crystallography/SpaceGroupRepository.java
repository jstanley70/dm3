package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.SpaceGroup;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = SpaceGroup.class)
public interface SpaceGroupRepository {

    List<com.lacunalabs.dm.data.physics.crystallography.SpaceGroup> findAll();
}
