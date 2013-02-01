package com.lacunalabs.dm.data.physics.instruments;

import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Tem {

    private String manufacturer;

    private String microscope;

    @ManyToOne
    private TemDoubleTiltHolder holder;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Aperature> aperatures = new HashSet<Aperature>();

    @OneToMany(cascade = CascadeType.ALL)
    private Set<TemObjectiveLens> objectiveLenses = new HashSet<TemObjectiveLens>();

    @ManyToOne
    private CcdCamera detector;

    private String metadata;

    @Enumerated
    private MetaDataType metadataType;
}
