// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Orientation;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect Orientation_Roo_Mongo_Entity {
    
    declare @type: Orientation: @Persistent;
    
    @Id
    private BigInteger Orientation.id;
    
    public BigInteger Orientation.getId() {
        return this.id;
    }
    
    public void Orientation.setId(BigInteger id) {
        this.id = id;
    }
    
}