package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PeriodicTable;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = PeriodicTable.class)
public interface PeriodicTableRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.PeriodicTable> findAll();
}
