package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.Material;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Material.class)
public interface MaterialRepository {

    List<com.lacunalabs.dm.data.physics.solidstate.Material> findAll();
}
