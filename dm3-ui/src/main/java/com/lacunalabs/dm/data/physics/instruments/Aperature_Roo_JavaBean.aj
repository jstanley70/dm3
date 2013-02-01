// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.instruments;

import com.lacunalabs.dm.data.physics.instruments.Aperature;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import java.math.BigDecimal;

privileged aspect Aperature_Roo_JavaBean {
    
    public String Aperature.getName() {
        return this.name;
    }
    
    public void Aperature.setName(String name) {
        this.name = name;
    }
    
    public BigDecimal Aperature.getAperatureRadius() {
        return this.aperatureRadius;
    }
    
    public void Aperature.setAperatureRadius(BigDecimal aperatureRadius) {
        this.aperatureRadius = aperatureRadius;
    }
    
    public MetaDataType Aperature.getMetadataType() {
        return this.metadataType;
    }
    
    public void Aperature.setMetadataType(MetaDataType metadataType) {
        this.metadataType = metadataType;
    }
    
    public String Aperature.getMetadata() {
        return this.metadata;
    }
    
    public void Aperature.setMetadata(String metadata) {
        this.metadata = metadata;
    }
    
}