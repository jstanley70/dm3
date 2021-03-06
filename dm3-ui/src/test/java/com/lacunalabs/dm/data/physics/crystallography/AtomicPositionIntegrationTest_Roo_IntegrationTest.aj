// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.crystallography;

import com.lacunalabs.dm.data.physics.crystallography.AtomicPositionDataOnDemand;
import com.lacunalabs.dm.data.physics.crystallography.AtomicPositionIntegrationTest;
import com.lacunalabs.dm.data.repository.physics.crystallography.AtomicPositionService;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect AtomicPositionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AtomicPositionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AtomicPositionIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    private AtomicPositionDataOnDemand AtomicPositionIntegrationTest.dod;
    
    @Autowired
    AtomicPositionService AtomicPositionIntegrationTest.atomicPositionService;
    
    @Test
    public void AtomicPositionIntegrationTest.testCountAllAtomicPositions() {
        Assert.assertNotNull("Data on demand for 'AtomicPosition' failed to initialize correctly", dod.getRandomAtomicPosition());
        long count = atomicPositionService.countAllAtomicPositions();
        Assert.assertTrue("Counter for 'AtomicPosition' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AtomicPositionIntegrationTest.testFindAtomicPosition() {
        AtomicPosition obj = dod.getRandomAtomicPosition();
        Assert.assertNotNull("Data on demand for 'AtomicPosition' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'AtomicPosition' failed to provide an identifier", id);
        obj = atomicPositionService.findAtomicPosition(id);
        Assert.assertNotNull("Find method for 'AtomicPosition' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'AtomicPosition' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AtomicPositionIntegrationTest.testFindAllAtomicPositions() {
        Assert.assertNotNull("Data on demand for 'AtomicPosition' failed to initialize correctly", dod.getRandomAtomicPosition());
        long count = atomicPositionService.countAllAtomicPositions();
        Assert.assertTrue("Too expensive to perform a find all test for 'AtomicPosition', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<AtomicPosition> result = atomicPositionService.findAllAtomicPositions();
        Assert.assertNotNull("Find all method for 'AtomicPosition' illegally returned null", result);
        Assert.assertTrue("Find all method for 'AtomicPosition' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AtomicPositionIntegrationTest.testFindAtomicPositionEntries() {
        Assert.assertNotNull("Data on demand for 'AtomicPosition' failed to initialize correctly", dod.getRandomAtomicPosition());
        long count = atomicPositionService.countAllAtomicPositions();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<AtomicPosition> result = atomicPositionService.findAtomicPositionEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'AtomicPosition' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'AtomicPosition' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AtomicPositionIntegrationTest.testSaveAtomicPosition() {
        Assert.assertNotNull("Data on demand for 'AtomicPosition' failed to initialize correctly", dod.getRandomAtomicPosition());
        AtomicPosition obj = dod.getNewTransientAtomicPosition(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'AtomicPosition' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'AtomicPosition' identifier to be null", obj.getId());
        atomicPositionService.saveAtomicPosition(obj);
        Assert.assertNotNull("Expected 'AtomicPosition' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AtomicPositionIntegrationTest.testDeleteAtomicPosition() {
        AtomicPosition obj = dod.getRandomAtomicPosition();
        Assert.assertNotNull("Data on demand for 'AtomicPosition' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'AtomicPosition' failed to provide an identifier", id);
        obj = atomicPositionService.findAtomicPosition(id);
        atomicPositionService.deleteAtomicPosition(obj);
        Assert.assertNull("Failed to remove 'AtomicPosition' with identifier '" + id + "'", atomicPositionService.findAtomicPosition(id));
    }
    
}
