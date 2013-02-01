package com.lacunalabs.dm.data.physics.solidstate;

import com.lacunalabs.dm.data.math.geometry.Shape3D;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Enumerated;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
public class Material {

    private String name;

    @Enumerated
    private MetaDataType metadataType;

    private String metadata;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<MaterialComponent> components = new HashSet<MaterialComponent>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<MaterialComponentOrientations> orientations = new HashSet<MaterialComponentOrientations>();

    private BigDecimal totalVolume;

    @ManyToOne
    private Shape3D shape;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<MaterialPhysicalProperty> properties = new HashSet<MaterialPhysicalProperty>();
    
    public MaterialComponent retriveMatrix(){
    	for(MaterialComponent material : components){
    		if(material.getMatrix() == true)
    			return material;
    	}
    	return null;
    }
}
