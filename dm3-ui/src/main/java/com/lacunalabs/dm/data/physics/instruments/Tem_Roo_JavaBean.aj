// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.instruments;

import com.lacunalabs.dm.data.physics.instruments.Aperature;
import com.lacunalabs.dm.data.physics.instruments.CcdCamera;
import com.lacunalabs.dm.data.physics.instruments.Tem;
import com.lacunalabs.dm.data.physics.instruments.TemDoubleTiltHolder;
import com.lacunalabs.dm.data.physics.instruments.TemObjectiveLens;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import java.util.Set;

privileged aspect Tem_Roo_JavaBean {
    
    public String Tem.getManufacturer() {
        return this.manufacturer;
    }
    
    public void Tem.setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }
    
    public String Tem.getMicroscope() {
        return this.microscope;
    }
    
    public void Tem.setMicroscope(String microscope) {
        this.microscope = microscope;
    }
    
    public TemDoubleTiltHolder Tem.getHolder() {
        return this.holder;
    }
    
    public void Tem.setHolder(TemDoubleTiltHolder holder) {
        this.holder = holder;
    }
    
    public Set<Aperature> Tem.getAperatures() {
        return this.aperatures;
    }
    
    public void Tem.setAperatures(Set<Aperature> aperatures) {
        this.aperatures = aperatures;
    }
    
    public Set<TemObjectiveLens> Tem.getObjectiveLenses() {
        return this.objectiveLenses;
    }
    
    public void Tem.setObjectiveLenses(Set<TemObjectiveLens> objectiveLenses) {
        this.objectiveLenses = objectiveLenses;
    }
    
    public CcdCamera Tem.getDetector() {
        return this.detector;
    }
    
    public void Tem.setDetector(CcdCamera detector) {
        this.detector = detector;
    }
    
    public String Tem.getMetadata() {
        return this.metadata;
    }
    
    public void Tem.setMetadata(String metadata) {
        this.metadata = metadata;
    }
    
    public MetaDataType Tem.getMetadataType() {
        return this.metadataType;
    }
    
    public void Tem.setMetadataType(MetaDataType metadataType) {
        this.metadataType = metadataType;
    }
    
}