package com.lacunalabs.dm.data.repository.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Shape3D;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Shape3D.class)
public interface Shape3DRepository {

    List<com.lacunalabs.dm.data.math.geometry.Shape3D> findAll();
}
