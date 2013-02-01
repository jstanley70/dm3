package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.Particle;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Particle.class)
public interface ParticleRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.Particle> findAll();
}
