// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.UnitCellType;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect UnitCellType_Roo_Mongo_Entity {
    
    declare @type: UnitCellType: @Persistent;
    
    @Id
    private BigInteger UnitCellType.id;
    
    public BigInteger UnitCellType.getId() {
        return this.id;
    }
    
    public void UnitCellType.setId(BigInteger id) {
        this.id = id;
    }
    
}
