package com.lacunalabs.dm.data.physics.instruments;

import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class TemObjectiveLens {

    private String name;

    private BigDecimal chromaticAberration;

    private BigDecimal sphericalAberration;

    private BigDecimal delVoltage;

    private BigDecimal delCurrent;

    private BigDecimal chromaticSpread;

    private BigDecimal convergenceAngle;

    private BigDecimal astigmatism;

    private BigDecimal stigmaticAngle;

    private BigDecimal defocus;

    private BigDecimal defocusSpread;

    private BigDecimal lensCurrent;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<LensPhysicalProperty> lensProperties = new HashSet<LensPhysicalProperty>();

    @Enumerated
    private MetaDataType metadataType;

    private String metadata;
}
