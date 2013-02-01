package com.lacunalabs.dm.data.physics.fundamental;

import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class ParticleEnumerator {

    @ManyToOne
    private Particle particle;

    private Integer amount;

    private String name;
}
