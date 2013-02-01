package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.UnitCellPhysicalProperty;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = UnitCellPhysicalProperty.class)
public interface UnitCellPhysicalPropertyRepository {

    List<com.lacunalabs.dm.data.physics.crystallography.UnitCellPhysicalProperty> findAll();
}
