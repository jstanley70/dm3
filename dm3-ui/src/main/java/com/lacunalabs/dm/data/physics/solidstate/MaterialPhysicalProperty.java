package com.lacunalabs.dm.data.physics.solidstate;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyType;
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
public class MaterialPhysicalProperty {

    private String name;

    @ManyToOne
    private PhysicalPropertyType propertyType;

    @ManyToOne
    private Material material;

    private BigDecimal quantity;

    private String functionParameters;

    private BigDecimal uncertainty;

    @Enumerated
    private UncertaintyType uncertaintyType;
}
