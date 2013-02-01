package com.lacunalabs.dm.data.math.geometry;

import java.math.BigDecimal;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

import com.lacunalabs.dm.shared.math.geometry.VectorType;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Orientation {

    @ManyToOne
    private Vector3D zAspect;

    @ManyToOne
    private Vector3D yAspect;

    private BigDecimal rotationAboutZ;

    private BigDecimal rotationAboutAspectY;
}
