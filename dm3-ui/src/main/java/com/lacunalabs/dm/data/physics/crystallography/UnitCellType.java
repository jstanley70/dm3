package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.shared.physics.crystallography.CrystalIdentifierType;
import javax.persistence.Enumerated;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class UnitCellType {

    @Enumerated
    private CrystalIdentifierType type;

    private String designation;
}
