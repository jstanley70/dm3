// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.solidstate;

import com.lacunalabs.dm.data.math.geometry.Shape3D;
import com.lacunalabs.dm.data.physics.crystallography.UnitCell;
import com.lacunalabs.dm.data.physics.solidstate.Crystal;
import com.lacunalabs.dm.data.physics.solidstate.CrystalPhysicalProperty;
import java.util.Set;

privileged aspect Crystal_Roo_JavaBean {
    
    public String Crystal.getName() {
        return this.name;
    }
    
    public void Crystal.setName(String name) {
        this.name = name;
    }
    
    public UnitCell Crystal.getLattice() {
        return this.lattice;
    }
    
    public void Crystal.setLattice(UnitCell lattice) {
        this.lattice = lattice;
    }
    
    public Shape3D Crystal.getCrystalShape() {
        return this.crystalShape;
    }
    
    public void Crystal.setCrystalShape(Shape3D crystalShape) {
        this.crystalShape = crystalShape;
    }
    
    public Set<CrystalPhysicalProperty> Crystal.getProperties() {
        return this.properties;
    }
    
    public void Crystal.setProperties(Set<CrystalPhysicalProperty> properties) {
        this.properties = properties;
    }
    
}
