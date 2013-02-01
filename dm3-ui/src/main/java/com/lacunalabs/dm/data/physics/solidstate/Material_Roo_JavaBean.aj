// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.solidstate;

import com.lacunalabs.dm.data.math.geometry.Shape3D;
import com.lacunalabs.dm.data.physics.solidstate.Material;
import com.lacunalabs.dm.data.physics.solidstate.MaterialComponent;
import com.lacunalabs.dm.data.physics.solidstate.MaterialComponentOrientations;
import com.lacunalabs.dm.data.physics.solidstate.MaterialPhysicalProperty;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import java.math.BigDecimal;
import java.util.Set;

privileged aspect Material_Roo_JavaBean {
    
    public String Material.getName() {
        return this.name;
    }
    
    public void Material.setName(String name) {
        this.name = name;
    }
    
    public MetaDataType Material.getMetadataType() {
        return this.metadataType;
    }
    
    public void Material.setMetadataType(MetaDataType metadataType) {
        this.metadataType = metadataType;
    }
    
    public String Material.getMetadata() {
        return this.metadata;
    }
    
    public void Material.setMetadata(String metadata) {
        this.metadata = metadata;
    }
    
    public Set<MaterialComponent> Material.getComponents() {
        return this.components;
    }
    
    public void Material.setComponents(Set<MaterialComponent> components) {
        this.components = components;
    }
    
    public Set<MaterialComponentOrientations> Material.getOrientations() {
        return this.orientations;
    }
    
    public void Material.setOrientations(Set<MaterialComponentOrientations> orientations) {
        this.orientations = orientations;
    }
    
    public BigDecimal Material.getTotalVolume() {
        return this.totalVolume;
    }
    
    public void Material.setTotalVolume(BigDecimal totalVolume) {
        this.totalVolume = totalVolume;
    }
    
    public Shape3D Material.getShape() {
        return this.shape;
    }
    
    public void Material.setShape(Shape3D shape) {
        this.shape = shape;
    }
    
    public Set<MaterialPhysicalProperty> Material.getProperties() {
        return this.properties;
    }
    
    public void Material.setProperties(Set<MaterialPhysicalProperty> properties) {
        this.properties = properties;
    }
    
}