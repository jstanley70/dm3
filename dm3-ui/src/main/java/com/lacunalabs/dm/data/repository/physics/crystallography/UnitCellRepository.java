package com.lacunalabs.dm.data.repository.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.UnitCell;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = UnitCell.class)
public interface UnitCellRepository {

    List<com.lacunalabs.dm.data.physics.crystallography.UnitCell> findAll();
}
