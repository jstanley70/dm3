package com.lacunalabs.dm.data.physics.solidstate;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class MaterialComponent {

    private String name;

    private Boolean active;

    private Boolean matrix;

    @ManyToOne
    private Crystal crystal;

    private BigDecimal totalVolume;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<MaterialComponentPhysicalProperty> properties = new HashSet<MaterialComponentPhysicalProperty>();
}
