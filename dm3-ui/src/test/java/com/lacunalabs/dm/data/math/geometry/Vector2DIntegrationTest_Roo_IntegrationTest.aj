// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lacunalabs.dm.data.math.geometry;

import com.lacunalabs.dm.data.math.geometry.Vector2DDataOnDemand;
import com.lacunalabs.dm.data.math.geometry.Vector2DIntegrationTest;
import com.lacunalabs.dm.data.repository.math.geometry.Vector2DService;
import java.math.BigInteger;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

privileged aspect Vector2DIntegrationTest_Roo_IntegrationTest {
    
    declare @type: Vector2DIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: Vector2DIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    @Autowired
    private Vector2DDataOnDemand Vector2DIntegrationTest.dod;
    
    @Autowired
    Vector2DService Vector2DIntegrationTest.vector2DService;
    
    @Test
    public void Vector2DIntegrationTest.testCountAllVector2Ds() {
        Assert.assertNotNull("Data on demand for 'Vector2D' failed to initialize correctly", dod.getRandomVector2D());
        long count = vector2DService.countAllVector2Ds();
        Assert.assertTrue("Counter for 'Vector2D' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void Vector2DIntegrationTest.testFindVector2D() {
        Vector2D obj = dod.getRandomVector2D();
        Assert.assertNotNull("Data on demand for 'Vector2D' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Vector2D' failed to provide an identifier", id);
        obj = vector2DService.findVector2D(id);
        Assert.assertNotNull("Find method for 'Vector2D' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Vector2D' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void Vector2DIntegrationTest.testFindAllVector2Ds() {
        Assert.assertNotNull("Data on demand for 'Vector2D' failed to initialize correctly", dod.getRandomVector2D());
        long count = vector2DService.countAllVector2Ds();
        Assert.assertTrue("Too expensive to perform a find all test for 'Vector2D', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Vector2D> result = vector2DService.findAllVector2Ds();
        Assert.assertNotNull("Find all method for 'Vector2D' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Vector2D' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void Vector2DIntegrationTest.testFindVector2DEntries() {
        Assert.assertNotNull("Data on demand for 'Vector2D' failed to initialize correctly", dod.getRandomVector2D());
        long count = vector2DService.countAllVector2Ds();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Vector2D> result = vector2DService.findVector2DEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Vector2D' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Vector2D' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void Vector2DIntegrationTest.testSaveVector2D() {
        Assert.assertNotNull("Data on demand for 'Vector2D' failed to initialize correctly", dod.getRandomVector2D());
        Vector2D obj = dod.getNewTransientVector2D(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Vector2D' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Vector2D' identifier to be null", obj.getId());
        vector2DService.saveVector2D(obj);
        Assert.assertNotNull("Expected 'Vector2D' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void Vector2DIntegrationTest.testDeleteVector2D() {
        Vector2D obj = dod.getRandomVector2D();
        Assert.assertNotNull("Data on demand for 'Vector2D' failed to initialize correctly", obj);
        BigInteger id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Vector2D' failed to provide an identifier", id);
        obj = vector2DService.findVector2D(id);
        vector2DService.deleteVector2D(obj);
        Assert.assertNull("Failed to remove 'Vector2D' with identifier '" + id + "'", vector2DService.findVector2D(id));
    }
    
}
