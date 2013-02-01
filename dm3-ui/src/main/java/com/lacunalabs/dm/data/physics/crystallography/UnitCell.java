package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class UnitCell {

    private String name;

    @Size(max = 20)
    private String symbol;

    @Enumerated
    private MetaDataType metadataType;

    private String metadata;

    @ManyToOne
    private SpaceGroup spaceGroup;

    @ManyToOne
    private BravaisLattice lattice;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<AtomicPosition> atoms = new HashSet<AtomicPosition>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<UnitCellType> alternativeDesignations = new HashSet<UnitCellType>();

    @OneToMany(cascade = CascadeType.ALL)
    private Set<UnitCellPhysicalProperty> properties = new HashSet<UnitCellPhysicalProperty>();
}
