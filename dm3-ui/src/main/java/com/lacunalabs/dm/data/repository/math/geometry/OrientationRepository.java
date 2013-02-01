package com.lacunalabs.dm.data.repository.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Orientation;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = Orientation.class)
public interface OrientationRepository {

    List<com.lacunalabs.dm.data.math.geometry.Orientation> findAll();
}
