package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.BravaisLattice;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = BravaisLattice.class)
public interface BravaisLatticeRepository {

    List<com.lacunalabs.dm.data.physics.crystallography.BravaisLattice> findAll();
}
