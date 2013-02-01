// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.fundamental;

import com.lacunalabs.dm.data.physics.fundamental.ScienceUnitDataOnDemand;
import com.lacunalabs.dm.data.physics.fundamental.ScienceUnitIntegrationTest;
import com.lacunalabs.dm.data.repository.physics.fundamental.ScienceUnitService;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect ScienceUnitIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ScienceUnitIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ScienceUnitIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    private ScienceUnitDataOnDemand ScienceUnitIntegrationTest.dod;
    
    @Autowired
    ScienceUnitService ScienceUnitIntegrationTest.scienceUnitService;
    
    @Test
    public void ScienceUnitIntegrationTest.testCountAllScienceUnits() {
        Assert.assertNotNull("Data on demand for 'ScienceUnit' failed to initialize correctly", dod.getRandomScienceUnit());
        long count = scienceUnitService.countAllScienceUnits();
        Assert.assertTrue("Counter for 'ScienceUnit' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ScienceUnitIntegrationTest.testFindScienceUnit() {
        ScienceUnit obj = dod.getRandomScienceUnit();
        Assert.assertNotNull("Data on demand for 'ScienceUnit' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ScienceUnit' failed to provide an identifier", id);
        obj = scienceUnitService.findScienceUnit(id);
        Assert.assertNotNull("Find method for 'ScienceUnit' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ScienceUnit' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ScienceUnitIntegrationTest.testFindAllScienceUnits() {
        Assert.assertNotNull("Data on demand for 'ScienceUnit' failed to initialize correctly", dod.getRandomScienceUnit());
        long count = scienceUnitService.countAllScienceUnits();
        Assert.assertTrue("Too expensive to perform a find all test for 'ScienceUnit', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ScienceUnit> result = scienceUnitService.findAllScienceUnits();
        Assert.assertNotNull("Find all method for 'ScienceUnit' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ScienceUnit' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ScienceUnitIntegrationTest.testFindScienceUnitEntries() {
        Assert.assertNotNull("Data on demand for 'ScienceUnit' failed to initialize correctly", dod.getRandomScienceUnit());
        long count = scienceUnitService.countAllScienceUnits();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ScienceUnit> result = scienceUnitService.findScienceUnitEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ScienceUnit' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ScienceUnit' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ScienceUnitIntegrationTest.testSaveScienceUnit() {
        Assert.assertNotNull("Data on demand for 'ScienceUnit' failed to initialize correctly", dod.getRandomScienceUnit());
        ScienceUnit obj = dod.getNewTransientScienceUnit(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ScienceUnit' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ScienceUnit' identifier to be null", obj.getId());
        scienceUnitService.saveScienceUnit(obj);
        Assert.assertNotNull("Expected 'ScienceUnit' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ScienceUnitIntegrationTest.testDeleteScienceUnit() {
        ScienceUnit obj = dod.getRandomScienceUnit();
        Assert.assertNotNull("Data on demand for 'ScienceUnit' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ScienceUnit' failed to provide an identifier", id);
        obj = scienceUnitService.findScienceUnit(id);
        scienceUnitService.deleteScienceUnit(obj);
        Assert.assertNull("Failed to remove 'ScienceUnit' with identifier '" + id + "'", scienceUnitService.findScienceUnit(id));
    }
    
}