package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.DecimalMultiplier;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = DecimalMultiplier.class)
public interface DecimalMultiplierRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.DecimalMultiplier> findAll();
}
