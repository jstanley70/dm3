package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.LatticeVector3D;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = LatticeVector3D.class)
public interface LatticeVector3DRepository {

    List<com.lacunalabs.dm.data.physics.crystallography.LatticeVector3D> findAll();
}
