// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.ParticleBeamDataOnDemand;
import com.lacunalabs.dm.data.physics.fundamental.ParticleBeamIntegrationTest;
import com.lacunalabs.dm.data.repository.physics.fundamental.ParticleBeamService;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect ParticleBeamIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ParticleBeamIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ParticleBeamIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    private ParticleBeamDataOnDemand ParticleBeamIntegrationTest.dod;
    
    @Autowired
    ParticleBeamService ParticleBeamIntegrationTest.particleBeamService;
    
    @Test
    public void ParticleBeamIntegrationTest.testCountAllParticleBeams() {
        Assert.assertNotNull("Data on demand for 'ParticleBeam' failed to initialize correctly", dod.getRandomParticleBeam());
        long count = particleBeamService.countAllParticleBeams();
        Assert.assertTrue("Counter for 'ParticleBeam' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ParticleBeamIntegrationTest.testFindParticleBeam() {
        ParticleBeam obj = dod.getRandomParticleBeam();
        Assert.assertNotNull("Data on demand for 'ParticleBeam' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ParticleBeam' failed to provide an identifier", id);
        obj = particleBeamService.findParticleBeam(id);
        Assert.assertNotNull("Find method for 'ParticleBeam' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ParticleBeam' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ParticleBeamIntegrationTest.testFindAllParticleBeams() {
        Assert.assertNotNull("Data on demand for 'ParticleBeam' failed to initialize correctly", dod.getRandomParticleBeam());
        long count = particleBeamService.countAllParticleBeams();
        Assert.assertTrue("Too expensive to perform a find all test for 'ParticleBeam', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ParticleBeam> result = particleBeamService.findAllParticleBeams();
        Assert.assertNotNull("Find all method for 'ParticleBeam' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ParticleBeam' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ParticleBeamIntegrationTest.testFindParticleBeamEntries() {
        Assert.assertNotNull("Data on demand for 'ParticleBeam' failed to initialize correctly", dod.getRandomParticleBeam());
        long count = particleBeamService.countAllParticleBeams();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ParticleBeam> result = particleBeamService.findParticleBeamEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ParticleBeam' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ParticleBeam' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ParticleBeamIntegrationTest.testSaveParticleBeam() {
        Assert.assertNotNull("Data on demand for 'ParticleBeam' failed to initialize correctly", dod.getRandomParticleBeam());
        ParticleBeam obj = dod.getNewTransientParticleBeam(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ParticleBeam' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ParticleBeam' identifier to be null", obj.getId());
        particleBeamService.saveParticleBeam(obj);
        Assert.assertNotNull("Expected 'ParticleBeam' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ParticleBeamIntegrationTest.testDeleteParticleBeam() {
        ParticleBeam obj = dod.getRandomParticleBeam();
        Assert.assertNotNull("Data on demand for 'ParticleBeam' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ParticleBeam' failed to provide an identifier", id);
        obj = particleBeamService.findParticleBeam(id);
        particleBeamService.deleteParticleBeam(obj);
        Assert.assertNull("Failed to remove 'ParticleBeam' with identifier '" + id + "'", particleBeamService.findParticleBeam(id));
    }
    
}
