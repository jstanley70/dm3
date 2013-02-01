package com.lacunalabs.dm.data.physics.fundamental;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class PeriodicTable {

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<PeriodicTableEntry> elements = new HashSet<PeriodicTableEntry>();

    private String name;
}
