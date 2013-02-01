package com.lacunalabs.dm.data.repository.physics.instruments;

import com.lacunalabs.dm.data.physics.instruments.Tem;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Tem.class)
public interface TemRepository {

    List<com.lacunalabs.dm.data.physics.instruments.Tem> findAll();
}
