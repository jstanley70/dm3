package com.lacunalabs.dm.data.physics.solidstate;

import com.lacunalabs.dm.data.math.geometry.Shape3D;
import com.lacunalabs.dm.data.physics.crystallography.UnitCell;
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
public class Crystal {

    private String name;

    @ManyToOne
    private UnitCell lattice;

    @ManyToOne
    private Shape3D crystalShape;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<CrystalPhysicalProperty> properties = new HashSet<CrystalPhysicalProperty>();
}
