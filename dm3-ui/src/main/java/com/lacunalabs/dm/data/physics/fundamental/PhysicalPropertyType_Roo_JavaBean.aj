// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.DecimalMultiplier;
import com.lacunalabs.dm.data.physics.fundamental.PhysicalPropertyType;
import com.lacunalabs.dm.data.physics.fundamental.Unit;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;

privileged aspect PhysicalPropertyType_Roo_JavaBean {
    
    public String PhysicalPropertyType.getName() {
        return this.name;
    }
    
    public void PhysicalPropertyType.setName(String name) {
        this.name = name;
    }
    
    public String PhysicalPropertyType.getSymbol() {
        return this.symbol;
    }
    
    public void PhysicalPropertyType.setSymbol(String symbol) {
        this.symbol = symbol;
    }
    
    public Unit PhysicalPropertyType.getUnit() {
        return this.unit;
    }
    
    public void PhysicalPropertyType.setUnit(Unit unit) {
        this.unit = unit;
    }
    
    public DecimalMultiplier PhysicalPropertyType.getPerferredDecimalMultiplier() {
        return this.perferredDecimalMultiplier;
    }
    
    public void PhysicalPropertyType.setPerferredDecimalMultiplier(DecimalMultiplier perferredDecimalMultiplier) {
        this.perferredDecimalMultiplier = perferredDecimalMultiplier;
    }
    
    public MetaDataType PhysicalPropertyType.getMetadataType() {
        return this.metadataType;
    }
    
    public void PhysicalPropertyType.setMetadataType(MetaDataType metadataType) {
        this.metadataType = metadataType;
    }
    
    public String PhysicalPropertyType.getMetadata() {
        return this.metadata;
    }
    
    public void PhysicalPropertyType.setMetadata(String metadata) {
        this.metadata = metadata;
    }
    
}
