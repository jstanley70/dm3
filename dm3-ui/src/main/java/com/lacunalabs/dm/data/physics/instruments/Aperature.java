package com.lacunalabs.dm.data.physics.instruments;

import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import java.math.BigDecimal;
import javax.persistence.Enumerated;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Aperature {

    private String name;

    private BigDecimal aperatureRadius;

    @Enumerated
    private MetaDataType metadataType;

    private String metadata;
}
