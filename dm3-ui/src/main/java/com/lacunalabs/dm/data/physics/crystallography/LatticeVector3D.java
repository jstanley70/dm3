package com.lacunalabs.dm.data.physics.crystallography;

import java.math.BigDecimal;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class LatticeVector3D {

    @ManyToOne
    private UnitCell unitCell;

    private BigDecimal x;

    private BigDecimal y;

    private BigDecimal z;
}
