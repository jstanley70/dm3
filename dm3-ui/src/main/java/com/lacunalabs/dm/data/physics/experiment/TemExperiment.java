package com.lacunalabs.dm.data.physics.experiment;

import com.lacunalabs.dm.data.math.geometry.Orientation;
import com.lacunalabs.dm.data.math.geometry.Vector3D;
import com.lacunalabs.dm.data.physics.fundamental.ParticleBeam;
import com.lacunalabs.dm.data.physics.instruments.Aperature;
import com.lacunalabs.dm.data.physics.instruments.Tem;
import com.lacunalabs.dm.data.physics.instruments.TemObjectiveLens;
import com.lacunalabs.dm.data.physics.solidstate.Material;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class TemExperiment {

    private String identifier;

    @Enumerated
    private MetaDataType metadataType;

    private String metadata;

    @ManyToOne
    private Tem tem;

    @ManyToOne
    private Aperature aperature;

    @ManyToOne
    private TemObjectiveLens objectiveLens;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Processor> processors = new HashSet<Processor>();

    @ManyToOne
    private Material sample;

    private BigDecimal cameraLength;

    private BigDecimal cameraConstant;

    private Boolean setByCameraLength;

    private BigDecimal tilt;

    private BigDecimal azimuth;

    @ManyToOne
    private Vector3D stagePosition;

    private BigDecimal exposureTime;

    @ManyToOne
    private ParticleBeam beam;

    @ManyToOne
    private Orientation matrixOrientation;
    
}
