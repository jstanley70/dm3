package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.UnitCellType;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = UnitCellType.class)
public interface UnitCellTypeRepository {

    List<com.lacunalabs.dm.data.physics.crystallography.UnitCellType> findAll();
}
