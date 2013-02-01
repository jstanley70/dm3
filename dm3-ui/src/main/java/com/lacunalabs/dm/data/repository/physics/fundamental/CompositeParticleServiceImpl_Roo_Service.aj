// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.repository.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.CompositeParticle;
import com.lacunalabs.dm.data.repository.physics.fundamental.CompositeParticleRepository;
import com.lacunalabs.dm.data.repository.physics.fundamental.CompositeParticleServiceImpl;
import java.math.BigInteger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CompositeParticleServiceImpl_Roo_Service {
    
    declare @type: CompositeParticleServiceImpl: @Service;
    
    declare @type: CompositeParticleServiceImpl: @Transactional;
    
    @Autowired
    CompositeParticleRepository CompositeParticleServiceImpl.compositeParticleRepository;
    
    public long CompositeParticleServiceImpl.countAllCompositeParticles() {
        return compositeParticleRepository.count();
    }
    
    public void CompositeParticleServiceImpl.deleteCompositeParticle(CompositeParticle compositeParticle) {
        compositeParticleRepository.delete(compositeParticle);
    }
    
    public CompositeParticle CompositeParticleServiceImpl.findCompositeParticle(BigInteger id) {
        return compositeParticleRepository.findOne(id);
    }
    
    public List<CompositeParticle> CompositeParticleServiceImpl.findAllCompositeParticles() {
        return compositeParticleRepository.findAll();
    }
    
    public List<CompositeParticle> CompositeParticleServiceImpl.findCompositeParticleEntries(int firstResult, int maxResults) {
        return compositeParticleRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void CompositeParticleServiceImpl.saveCompositeParticle(CompositeParticle compositeParticle) {
        compositeParticleRepository.save(compositeParticle);
    }
    
    public CompositeParticle CompositeParticleServiceImpl.updateCompositeParticle(CompositeParticle compositeParticle) {
        return compositeParticleRepository.save(compositeParticle);
    }
    
}