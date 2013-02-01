package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.data.physics.fundamental.CompositeParticle;
import java.math.BigDecimal;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class AtomicPosition {

    private BigDecimal x;

    private BigDecimal y;

    private BigDecimal z;

    private BigDecimal occupancy;

    private String positionType;

    @ManyToOne
    private CompositeParticle atom;
}
