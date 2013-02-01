package com.lacunalabs.dm.data.physics.instruments;

import java.math.BigDecimal;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class TemDoubleTiltHolder {

    private String name;

    private BigDecimal tiltAxisRotationToVertical;

    private BigDecimal azimuthAxisRotationToVertical;
}
