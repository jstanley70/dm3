package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.math.geometry.Vector3D;
import java.math.BigDecimal;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class ParticleBeam {

    private BigDecimal voltage;

    @ManyToOne
    private CompositeParticle particle;

    private BigDecimal wavelength;

    private Boolean setByWavelength;

    private BigDecimal intensity;

    @ManyToOne
    private Vector3D direction;
}
