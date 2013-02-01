package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.MaterialComponent;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = MaterialComponent.class)
public interface MaterialComponentRepository {

    List<com.lacunalabs.dm.data.physics.solidstate.MaterialComponent> findAll();
}
