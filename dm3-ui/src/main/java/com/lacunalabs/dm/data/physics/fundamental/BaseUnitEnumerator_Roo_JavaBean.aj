// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.BaseUnit;
import com.lacunalabs.dm.data.physics.fundamental.BaseUnitEnumerator;
import java.math.BigDecimal;

privileged aspect BaseUnitEnumerator_Roo_JavaBean {
    
    public BaseUnit BaseUnitEnumerator.getBaseUnit() {
        return this.baseUnit;
    }
    
    public void BaseUnitEnumerator.setBaseUnit(BaseUnit baseUnit) {
        this.baseUnit = baseUnit;
    }
    
    public String BaseUnitEnumerator.getIdentifier() {
        return this.identifier;
    }
    
    public void BaseUnitEnumerator.setIdentifier(String identifier) {
        this.identifier = identifier;
    }
    
    public BigDecimal BaseUnitEnumerator.getExponent() {
        return this.exponent;
    }
    
    public void BaseUnitEnumerator.setExponent(BigDecimal exponent) {
        this.exponent = exponent;
    }
    
    public BigDecimal BaseUnitEnumerator.getMultiplier() {
        return this.multiplier;
    }
    
    public void BaseUnitEnumerator.setMultiplier(BigDecimal multiplier) {
        this.multiplier = multiplier;
    }
    
    public BigDecimal BaseUnitEnumerator.getZeroOffset() {
        return this.zeroOffset;
    }
    
    public void BaseUnitEnumerator.setZeroOffset(BigDecimal zeroOffset) {
        this.zeroOffset = zeroOffset;
    }
    
}
