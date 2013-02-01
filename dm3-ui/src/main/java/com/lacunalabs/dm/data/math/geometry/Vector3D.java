package com.lacunalabs.dm.data.math.geometry;

import com.lacunalabs.dm.shared.math.geometry.VectorType;
import java.math.BigDecimal;
import javax.persistence.Enumerated;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Vector3D {

    private BigDecimal x;

    private BigDecimal y;

    private BigDecimal z;

    @Enumerated
    private VectorType vectorType;
}
