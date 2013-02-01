package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import java.math.BigDecimal;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Unit {

    private String name;

    @NotNull
    @Size(min = 1, max = 10)
    private String symbol;

    @ManyToOne
    private ScienceUnit referenceUnit;

    private Boolean isSIU;

    private BigDecimal conversionToMultiplier;

    private BigDecimal conversionToOffset;

    @Enumerated
    private MetaDataType metadataType;

    private String metadata;
}
