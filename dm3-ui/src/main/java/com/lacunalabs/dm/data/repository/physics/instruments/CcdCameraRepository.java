package com.lacunalabs.dm.data.repository.physics.instruments;

import com.lacunalabs.dm.data.physics.instruments.CcdCamera;
import java.util.List;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoRepository;

@RooMongoRepository(domainType = CcdCamera.class)
public interface CcdCameraRepository {

    List<com.lacunalabs.dm.data.physics.instruments.CcdCamera> findAll();
}
