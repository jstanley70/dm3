package com.lacunalabs.dm.data.repository.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Vector2D;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Vector2D.class)
public interface Vector2DRepository {

    List<com.lacunalabs.dm.data.math.geometry.Vector2D> findAll();
}
