package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class PhysicalPropertyType {

    private String name;

    private String symbol;

    @ManyToOne
    private Unit unit;

    @ManyToOne
    private DecimalMultiplier perferredDecimalMultiplier;

    @Enumerated
    private MetaDataType metadataType;

    private String metadata;
}
