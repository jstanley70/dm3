package com.lacunalabs.dm.data.physics.fundamental;

import java.math.BigDecimal;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class BaseUnitEnumerator {

    @ManyToOne
    private BaseUnit baseUnit;

    private String identifier;

    private BigDecimal exponent;

    private BigDecimal multiplier;

    private BigDecimal zeroOffset;
}
