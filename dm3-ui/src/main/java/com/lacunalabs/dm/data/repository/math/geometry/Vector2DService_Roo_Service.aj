// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Vector2D;
import com.lacunalabs.dm.data.repository.math.geometry.Vector2DService;
import java.math.BigInteger;
import java.util.List;

privileged aspect Vector2DService_Roo_Service {
    
    public abstract long Vector2DService.countAllVector2Ds();    
    public abstract void Vector2DService.deleteVector2D(Vector2D vector2D);    
    public abstract Vector2D Vector2DService.findVector2D(BigInteger id);    
    public abstract List<Vector2D> Vector2DService.findAllVector2Ds();    
    public abstract List<Vector2D> Vector2DService.findVector2DEntries(int firstResult, int maxResults);    
    public abstract void Vector2DService.saveVector2D(Vector2D vector2D);    
    public abstract Vector2D Vector2DService.updateVector2D(Vector2D vector2D);    
}
