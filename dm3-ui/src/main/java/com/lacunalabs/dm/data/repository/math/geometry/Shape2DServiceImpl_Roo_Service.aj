// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Shape2D;
import com.lacunalabs.dm.data.repository.math.geometry.Shape2DRepository;
import com.lacunalabs.dm.data.repository.math.geometry.Shape2DServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Shape2DServiceImpl_Roo_Service {
    
    declare @type: Shape2DServiceImpl: @Service;
    
    declare @type: Shape2DServiceImpl: @Transactional;
    
    @Autowired
    Shape2DRepository Shape2DServiceImpl.shape2DRepository;
    
    public long Shape2DServiceImpl.countAllShape2Ds() {
        return shape2DRepository.count();
    }
    
    public void Shape2DServiceImpl.deleteShape2D(Shape2D shape2D) {
        shape2DRepository.delete(shape2D);
    }
    
    public Shape2D Shape2DServiceImpl.findShape2D(BigInteger id) {
        return shape2DRepository.findOne(id);
    }
    
    public List<Shape2D> Shape2DServiceImpl.findAllShape2Ds() {
        return shape2DRepository.findAll();
    }
    
    public List<Shape2D> Shape2DServiceImpl.findShape2DEntries(int firstResult, int maxResults) {
        return shape2DRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void Shape2DServiceImpl.saveShape2D(Shape2D shape2D) {
        shape2DRepository.save(shape2D);
    }
    
    public Shape2D Shape2DServiceImpl.updateShape2D(Shape2D shape2D) {
        return shape2DRepository.save(shape2D);
    }
    
}
