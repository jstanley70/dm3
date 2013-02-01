package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.Centering;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Centering.class)
public interface CenteringRepository {

    List<com.lacunalabs.dm.data.physics.crystallography.Centering> findAll();
}
