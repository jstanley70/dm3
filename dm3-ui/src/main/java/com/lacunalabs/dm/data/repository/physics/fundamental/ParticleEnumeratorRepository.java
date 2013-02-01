package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.ParticleEnumerator;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = ParticleEnumerator.class)
public interface ParticleEnumeratorRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.ParticleEnumerator> findAll();
}
