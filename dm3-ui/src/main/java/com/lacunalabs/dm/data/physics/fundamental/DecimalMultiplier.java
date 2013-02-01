package com.lacunalabs.dm.data.physics.fundamental;

import java.math.BigDecimal;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class DecimalMultiplier {

    private String name;

    @NotNull
    @Size(min = 1, max = 10)
    private String symbol;

    private BigDecimal multiplier;
}
