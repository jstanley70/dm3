package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import com.lacunalabs.dm.shared.physics.fundamental.ParticleType;
import java.math.BigDecimal;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Particle {

    private String name;

    @NotNull
    @Size(min = 1, max = 10)
    private String symbol;

    @Enumerated
    private ParticleType particleType;

    private BigDecimal charge;

    private BigDecimal mass;

    private BigDecimal spin;

    @Enumerated
    private MetaDataType metadataType;

    private String metadata;
}
