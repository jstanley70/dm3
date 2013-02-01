// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.physics.experiment;

import com.lacunalabs.dm.data.physics.experiment.TemExperimentDataOnDemand;
import com.lacunalabs.dm.data.physics.experiment.TemExperimentIntegrationTest;
import com.lacunalabs.dm.data.repository.physics.experiment.TemExperimentService;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect TemExperimentIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TemExperimentIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TemExperimentIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    private TemExperimentDataOnDemand TemExperimentIntegrationTest.dod;
    
    @Autowired
    TemExperimentService TemExperimentIntegrationTest.temExperimentService;
    
    @Test
    public void TemExperimentIntegrationTest.testCountAllTemExperiments() {
        Assert.assertNotNull("Data on demand for 'TemExperiment' failed to initialize correctly", dod.getRandomTemExperiment());
        long count = temExperimentService.countAllTemExperiments();
        Assert.assertTrue("Counter for 'TemExperiment' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TemExperimentIntegrationTest.testFindTemExperiment() {
        TemExperiment obj = dod.getRandomTemExperiment();
        Assert.assertNotNull("Data on demand for 'TemExperiment' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TemExperiment' failed to provide an identifier", id);
        obj = temExperimentService.findTemExperiment(id);
        Assert.assertNotNull("Find method for 'TemExperiment' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'TemExperiment' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TemExperimentIntegrationTest.testFindAllTemExperiments() {
        Assert.assertNotNull("Data on demand for 'TemExperiment' failed to initialize correctly", dod.getRandomTemExperiment());
        long count = temExperimentService.countAllTemExperiments();
        Assert.assertTrue("Too expensive to perform a find all test for 'TemExperiment', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<TemExperiment> result = temExperimentService.findAllTemExperiments();
        Assert.assertNotNull("Find all method for 'TemExperiment' illegally returned null", result);
        Assert.assertTrue("Find all method for 'TemExperiment' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TemExperimentIntegrationTest.testFindTemExperimentEntries() {
        Assert.assertNotNull("Data on demand for 'TemExperiment' failed to initialize correctly", dod.getRandomTemExperiment());
        long count = temExperimentService.countAllTemExperiments();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<TemExperiment> result = temExperimentService.findTemExperimentEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'TemExperiment' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'TemExperiment' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TemExperimentIntegrationTest.testSaveTemExperiment() {
        Assert.assertNotNull("Data on demand for 'TemExperiment' failed to initialize correctly", dod.getRandomTemExperiment());
        TemExperiment obj = dod.getNewTransientTemExperiment(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'TemExperiment' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'TemExperiment' identifier to be null", obj.getId());
        temExperimentService.saveTemExperiment(obj);
        Assert.assertNotNull("Expected 'TemExperiment' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TemExperimentIntegrationTest.testDeleteTemExperiment() {
        TemExperiment obj = dod.getRandomTemExperiment();
        Assert.assertNotNull("Data on demand for 'TemExperiment' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TemExperiment' failed to provide an identifier", id);
        obj = temExperimentService.findTemExperiment(id);
        temExperimentService.deleteTemExperiment(obj);
        Assert.assertNull("Failed to remove 'TemExperiment' with identifier '" + id + "'", temExperimentService.findTemExperiment(id));
    }
    
}
