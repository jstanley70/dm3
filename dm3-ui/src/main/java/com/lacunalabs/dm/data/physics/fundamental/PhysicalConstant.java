package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import com.lacunalabs.dm.shared.physics.fundamental.UncertaintyType;
import java.math.BigDecimal;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class PhysicalConstant {

    private String name;

    private String symbol;

    @Enumerated
    private MetaDataType metadataType;

    private String metadata;

    private BigDecimal quantity;

    @ManyToOne
    private Unit unit;

    private BigDecimal uncertainty;

    @Enumerated
    private UncertaintyType uncertaintyType;
}
