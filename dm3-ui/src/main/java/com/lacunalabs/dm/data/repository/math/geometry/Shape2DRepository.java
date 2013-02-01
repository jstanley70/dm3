package com.lacunalabs.dm.data.repository.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Shape2D;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Shape2D.class)
public interface Shape2DRepository {

    List<com.lacunalabs.dm.data.math.geometry.Shape2D> findAll();
}
