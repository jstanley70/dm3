// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.PhysicalConstant;
import com.lacunalabs.dm.data.physics.fundamental.Unit;
import com.lacunalabs.dm.shared.physics.fundamental.MetaDataType;
import com.lacunalabs.dm.shared.physics.fundamental.UncertaintyType;
import java.math.BigDecimal;

privileged aspect PhysicalConstant_Roo_JavaBean {
    
    public String PhysicalConstant.getName() {
        return this.name;
    }
    
    public void PhysicalConstant.setName(String name) {
        this.name = name;
    }
    
    public String PhysicalConstant.getSymbol() {
        return this.symbol;
    }
    
    public void PhysicalConstant.setSymbol(String symbol) {
        this.symbol = symbol;
    }
    
    public MetaDataType PhysicalConstant.getMetadataType() {
        return this.metadataType;
    }
    
    public void PhysicalConstant.setMetadataType(MetaDataType metadataType) {
        this.metadataType = metadataType;
    }
    
    public String PhysicalConstant.getMetadata() {
        return this.metadata;
    }
    
    public void PhysicalConstant.setMetadata(String metadata) {
        this.metadata = metadata;
    }
    
    public BigDecimal PhysicalConstant.getQuantity() {
        return this.quantity;
    }
    
    public void PhysicalConstant.setQuantity(BigDecimal quantity) {
        this.quantity = quantity;
    }
    
    public Unit PhysicalConstant.getUnit() {
        return this.unit;
    }
    
    public void PhysicalConstant.setUnit(Unit unit) {
        this.unit = unit;
    }
    
    public BigDecimal PhysicalConstant.getUncertainty() {
        return this.uncertainty;
    }
    
    public void PhysicalConstant.setUncertainty(BigDecimal uncertainty) {
        this.uncertainty = uncertainty;
    }
    
    public UncertaintyType PhysicalConstant.getUncertaintyType() {
        return this.uncertaintyType;
    }
    
    public void PhysicalConstant.setUncertaintyType(UncertaintyType uncertaintyType) {
        this.uncertaintyType = uncertaintyType;
    }
    
}
