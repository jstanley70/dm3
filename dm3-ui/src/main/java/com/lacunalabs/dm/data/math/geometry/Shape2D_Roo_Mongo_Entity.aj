// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Shape2D;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect Shape2D_Roo_Mongo_Entity {
    
    declare @type: Shape2D: @Persistent;
    
    @Id
    private BigInteger Shape2D.id;
    
    public BigInteger Shape2D.getId() {
        return this.id;
    }
    
    public void Shape2D.setId(BigInteger id) {
        this.id = id;
    }
    
}
