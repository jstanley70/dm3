// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.ParticleEnumeratorDataOnDemand;
import com.lacunalabs.dm.data.physics.fundamental.ParticleEnumeratorIntegrationTest;
import com.lacunalabs.dm.data.repository.physics.fundamental.ParticleEnumeratorService;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect ParticleEnumeratorIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ParticleEnumeratorIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ParticleEnumeratorIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    private ParticleEnumeratorDataOnDemand ParticleEnumeratorIntegrationTest.dod;
    
    @Autowired
    ParticleEnumeratorService ParticleEnumeratorIntegrationTest.particleEnumeratorService;
    
    @Test
    public void ParticleEnumeratorIntegrationTest.testCountAllParticleEnumerators() {
        Assert.assertNotNull("Data on demand for 'ParticleEnumerator' failed to initialize correctly", dod.getRandomParticleEnumerator());
        long count = particleEnumeratorService.countAllParticleEnumerators();
        Assert.assertTrue("Counter for 'ParticleEnumerator' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ParticleEnumeratorIntegrationTest.testFindParticleEnumerator() {
        ParticleEnumerator obj = dod.getRandomParticleEnumerator();
        Assert.assertNotNull("Data on demand for 'ParticleEnumerator' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ParticleEnumerator' failed to provide an identifier", id);
        obj = particleEnumeratorService.findParticleEnumerator(id);
        Assert.assertNotNull("Find method for 'ParticleEnumerator' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ParticleEnumerator' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ParticleEnumeratorIntegrationTest.testFindAllParticleEnumerators() {
        Assert.assertNotNull("Data on demand for 'ParticleEnumerator' failed to initialize correctly", dod.getRandomParticleEnumerator());
        long count = particleEnumeratorService.countAllParticleEnumerators();
        Assert.assertTrue("Too expensive to perform a find all test for 'ParticleEnumerator', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ParticleEnumerator> result = particleEnumeratorService.findAllParticleEnumerators();
        Assert.assertNotNull("Find all method for 'ParticleEnumerator' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ParticleEnumerator' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ParticleEnumeratorIntegrationTest.testFindParticleEnumeratorEntries() {
        Assert.assertNotNull("Data on demand for 'ParticleEnumerator' failed to initialize correctly", dod.getRandomParticleEnumerator());
        long count = particleEnumeratorService.countAllParticleEnumerators();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ParticleEnumerator> result = particleEnumeratorService.findParticleEnumeratorEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ParticleEnumerator' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ParticleEnumerator' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ParticleEnumeratorIntegrationTest.testSaveParticleEnumerator() {
        Assert.assertNotNull("Data on demand for 'ParticleEnumerator' failed to initialize correctly", dod.getRandomParticleEnumerator());
        ParticleEnumerator obj = dod.getNewTransientParticleEnumerator(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ParticleEnumerator' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ParticleEnumerator' identifier to be null", obj.getId());
        particleEnumeratorService.saveParticleEnumerator(obj);
        Assert.assertNotNull("Expected 'ParticleEnumerator' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ParticleEnumeratorIntegrationTest.testDeleteParticleEnumerator() {
        ParticleEnumerator obj = dod.getRandomParticleEnumerator();
        Assert.assertNotNull("Data on demand for 'ParticleEnumerator' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ParticleEnumerator' failed to provide an identifier", id);
        obj = particleEnumeratorService.findParticleEnumerator(id);
        particleEnumeratorService.deleteParticleEnumerator(obj);
        Assert.assertNull("Failed to remove 'ParticleEnumerator' with identifier '" + id + "'", particleEnumeratorService.findParticleEnumerator(id));
    }
    
}