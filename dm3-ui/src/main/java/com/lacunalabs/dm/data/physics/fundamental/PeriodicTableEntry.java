package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.shared.physics.fundamental.ElementClassification;
import com.lacunalabs.dm.shared.physics.fundamental.PeriodicTableBlock;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class PeriodicTableEntry {

    @ManyToOne
    private CompositeParticle atom;

    private Integer period;

    private Integer tableGroup;

    @Enumerated
    private PeriodicTableBlock block;

    @Enumerated
    private ElementClassification classification;

    private String symbol;
}
