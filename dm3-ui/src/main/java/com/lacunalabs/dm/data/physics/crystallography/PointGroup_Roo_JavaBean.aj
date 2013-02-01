// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.Centering;
import com.lacunalabs.dm.data.physics.crystallography.PointGroup;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;

privileged aspect PointGroup_Roo_JavaBean {
    
    public String PointGroup.getName() {
        return this.name;
    }
    
    public void PointGroup.setName(String name) {
        this.name = name;
    }
    
    public String PointGroup.getSymbol() {
        return this.symbol;
    }
    
    public void PointGroup.setSymbol(String symbol) {
        this.symbol = symbol;
    }
    
    public Centering PointGroup.getCentering() {
        return this.centering;
    }
    
    public void PointGroup.setCentering(Centering centering) {
        this.centering = centering;
    }
    
    public String PointGroup.getReflectionConditions() {
        return this.reflectionConditions;
    }
    
    public void PointGroup.setReflectionConditions(String reflectionConditions) {
        this.reflectionConditions = reflectionConditions;
    }
    
    public String PointGroup.getCenterings() {
        return this.centerings;
    }
    
    public void PointGroup.setCenterings(String centerings) {
        this.centerings = centerings;
    }
    
    public String PointGroup.getCoordinatePoints() {
        return this.coordinatePoints;
    }
    
    public void PointGroup.setCoordinatePoints(String coordinatePoints) {
        this.coordinatePoints = coordinatePoints;
    }
    
    public MetaDataType PointGroup.getMetadataType() {
        return this.metadataType;
    }
    
    public void PointGroup.setMetadataType(MetaDataType metadataType) {
        this.metadataType = metadataType;
    }
    
    public String PointGroup.getMetadata() {
        return this.metadata;
    }
    
    public void PointGroup.setMetadata(String metadata) {
        this.metadata = metadata;
    }
    
}