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
public class CcdCamera {

    private String name;

    private String manufacturer;

    private Integer xResolution;

    private Integer yResolution;

    private BigDecimal collectionEfficiency;

    private String metadata;

    @Enumerated
    private MetaDataType metadataType;
}
