package com.lacunalabs.dm.data.repository.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Vector3D;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Vector3D.class)
public interface Vector3DRepository {

    List<com.lacunalabs.dm.data.math.geometry.Vector3D> findAll();
}
