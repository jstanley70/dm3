// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.solidstate;

import com.lacunalabs.dm.data.physics.solidstate.CrystalPhysicalProperty;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect CrystalPhysicalProperty_Roo_Mongo_Entity {
    
    declare @type: CrystalPhysicalProperty: @Persistent;
    
    @Id
    private BigInteger CrystalPhysicalProperty.id;
    
    public BigInteger CrystalPhysicalProperty.getId() {
        return this.id;
    }
    
    public void CrystalPhysicalProperty.setId(BigInteger id) {
        this.id = id;
    }
    
}
