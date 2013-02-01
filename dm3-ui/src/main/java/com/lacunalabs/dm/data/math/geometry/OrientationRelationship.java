package com.lacunalabs.dm.data.math.geometry;

import java.math.BigDecimal;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class OrientationRelationship {

    @ManyToOne
    private Vector3D aspect1Shape1;

    @ManyToOne
    private Vector3D aspect1Shape2;

    @ManyToOne
    private Vector3D aspect2Shape1;

    @ManyToOne
    private Vector3D aspect2Shape2;

    private BigDecimal rotationShape2AboutAspect1;

    private BigDecimal rotationShape2AboutAspect2;
}
