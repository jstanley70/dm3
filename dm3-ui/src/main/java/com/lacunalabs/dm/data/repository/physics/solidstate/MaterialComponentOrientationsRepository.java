package com.lacunalabs.dm.data.repository.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.MaterialComponentOrientations;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = MaterialComponentOrientations.class)
public interface MaterialComponentOrientationsRepository {

    List<com.lacunalabs.dm.data.physics.solidstate.MaterialComponentOrientations> findAll();
}
