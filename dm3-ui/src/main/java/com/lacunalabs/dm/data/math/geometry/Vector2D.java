package com.lacunalabs.dm.data.math.geometry;

import java.math.BigDecimal;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Vector2D {

    private BigDecimal x;

    private BigDecimal y;
}
