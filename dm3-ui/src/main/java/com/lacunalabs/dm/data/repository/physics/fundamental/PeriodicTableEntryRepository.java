package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PeriodicTableEntry;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = PeriodicTableEntry.class)
public interface PeriodicTableEntryRepository {

    List<com.lacunalabs.dm.data.physics.fundamental.PeriodicTableEntry> findAll();
}
