package com.lacunalabs.dm.data.repository.math.geometry;

import com.lacunalabs.dm.data.math.geometry.OrientationRelationship;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = OrientationRelationship.class)
public interface OrientationRelationshipRepository {

    List<com.lacunalabs.dm.data.math.geometry.OrientationRelationship> findAll();
}
