package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.ParticleBeam;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = ParticleBeam.class)
public interface ParticleBeamRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.ParticleBeam> findAll();
}
