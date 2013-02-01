package com.lacunalabs.dm.data.repository.physics.instruments;

import com.lacunalabs.dm.data.physics.instruments.TemDoubleTiltHolder;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = TemDoubleTiltHolder.class)
public interface TemDoubleTiltHolderRepository {

    List<com.lacunalabs.dm.data.physics.instruments.TemDoubleTiltHolder> findAll();
}
