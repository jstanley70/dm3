package com.lacunalabs.dm.data.physics.solidstate;

import com.lacunalabs.dm.data.math.geometry.OrientationRelationship;
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
public class MaterialComponentOrientations {

    @OneToMany(cascade = CascadeType.ALL)
    private Set<OrientationRelationship> orientations = new HashSet<OrientationRelationship>();

    @ManyToOne
    private MaterialComponent crystal1;

    @ManyToOne
    private MaterialComponent crystal2;
}
