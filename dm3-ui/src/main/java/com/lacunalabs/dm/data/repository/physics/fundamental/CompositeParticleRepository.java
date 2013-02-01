package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.CompositeParticle;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = CompositeParticle.class)
public interface CompositeParticleRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.CompositeParticle> findAll();
}
