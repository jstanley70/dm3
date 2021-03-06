package com.lacunalabs.dm.data.math.geometry;

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
public class Shape3D {

    private String name;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Vector3D> faces = new HashSet<Vector3D>();
}
