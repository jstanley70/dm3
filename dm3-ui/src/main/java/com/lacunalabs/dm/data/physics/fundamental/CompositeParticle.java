package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import com.lacunalabs.dm.shared.physics.fundamental.ParticleType;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class CompositeParticle {

    private String name;

    @NotNull
    @Size(min = 1, max = 10)
    private String symbol;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<ParticleEnumerator> particles = new HashSet<ParticleEnumerator>();

    private BigDecimal mass;

    @Enumerated
    private ParticleType particleType;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<ParticlePhysicalProperty> properties = new HashSet<ParticlePhysicalProperty>();

    @Enumerated
    private MetaDataType metadataType;

    private String metadata;
}
