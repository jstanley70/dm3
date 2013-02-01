// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Shape3D;
import com.lacunalabs.dm.data.repository.math.geometry.Shape3DService;
import java.math.BigInteger;
import java.util.List;

privileged aspect Shape3DService_Roo_Service {
    
    public abstract long Shape3DService.countAllShape3Ds();    
    public abstract void Shape3DService.deleteShape3D(Shape3D shape3D);    
    public abstract Shape3D Shape3DService.findShape3D(BigInteger id);    
    public abstract List<Shape3D> Shape3DService.findAllShape3Ds();    
    public abstract List<Shape3D> Shape3DService.findShape3DEntries(int firstResult, int maxResults);    
    public abstract void Shape3DService.saveShape3D(Shape3D shape3D);    
    public abstract Shape3D Shape3DService.updateShape3D(Shape3D shape3D);    
}
