// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.Centering;
import com.lacunalabs.dm.shared.physics.crystallography.CenteringType;

privileged aspect Centering_Roo_JavaBean {
    
    public String Centering.getName() {
        return this.name;
    }
    
    public void Centering.setName(String name) {
        this.name = name;
    }
    
    public CenteringType Centering.getCenteringType() {
        return this.centeringType;
    }
    
    public void Centering.setCenteringType(CenteringType centeringType) {
        this.centeringType = centeringType;
    }
    
    public String Centering.getCenterings() {
        return this.centerings;
    }
    
    public void Centering.setCenterings(String centerings) {
        this.centerings = centerings;
    }
    
    public String Centering.getReflectionConditions() {
        return this.reflectionConditions;
    }
    
    public void Centering.setReflectionConditions(String reflectionConditions) {
        this.reflectionConditions = reflectionConditions;
    }
    
}
