// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.LatticeVector3D;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect LatticeVector3D_Roo_Mongo_Entity {
    
    declare @type: LatticeVector3D: @Persistent;
    
    @Id
    private BigInteger LatticeVector3D.id;
    
    public BigInteger LatticeVector3D.getId() {
        return this.id;
    }
    
    public void LatticeVector3D.setId(BigInteger id) {
        this.id = id;
    }
    
}
