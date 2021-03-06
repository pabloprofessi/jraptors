// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jraptors.bibliosoft2.domain;

import com.jraptors.bibliosoft2.domain.Copy;
import com.jraptors.bibliosoft2.domain.CopyDataOnDemand;
import com.jraptors.bibliosoft2.domain.CopyIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CopyIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CopyIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CopyIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CopyIntegrationTest: @Transactional;
    
    @Autowired
    CopyDataOnDemand CopyIntegrationTest.dod;
    
    @Test
    public void CopyIntegrationTest.testCountCopys() {
        Assert.assertNotNull("Data on demand for 'Copy' failed to initialize correctly", dod.getRandomCopy());
        long count = Copy.countCopys();
        Assert.assertTrue("Counter for 'Copy' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CopyIntegrationTest.testFindCopy() {
        Copy obj = dod.getRandomCopy();
        Assert.assertNotNull("Data on demand for 'Copy' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Copy' failed to provide an identifier", id);
        obj = Copy.findCopy(id);
        Assert.assertNotNull("Find method for 'Copy' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Copy' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CopyIntegrationTest.testFindAllCopys() {
        Assert.assertNotNull("Data on demand for 'Copy' failed to initialize correctly", dod.getRandomCopy());
        long count = Copy.countCopys();
        Assert.assertTrue("Too expensive to perform a find all test for 'Copy', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Copy> result = Copy.findAllCopys();
        Assert.assertNotNull("Find all method for 'Copy' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Copy' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CopyIntegrationTest.testFindCopyEntries() {
        Assert.assertNotNull("Data on demand for 'Copy' failed to initialize correctly", dod.getRandomCopy());
        long count = Copy.countCopys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Copy> result = Copy.findCopyEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Copy' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Copy' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CopyIntegrationTest.testFlush() {
        Copy obj = dod.getRandomCopy();
        Assert.assertNotNull("Data on demand for 'Copy' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Copy' failed to provide an identifier", id);
        obj = Copy.findCopy(id);
        Assert.assertNotNull("Find method for 'Copy' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCopy(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Copy' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void CopyIntegrationTest.testMergeUpdate() {
        Copy obj = dod.getRandomCopy();
        Assert.assertNotNull("Data on demand for 'Copy' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Copy' failed to provide an identifier", id);
        obj = Copy.findCopy(id);
        boolean modified =  dod.modifyCopy(obj);
        Integer currentVersion = obj.getVersion();
        Copy merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Copy' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void CopyIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Copy' failed to initialize correctly", dod.getRandomCopy());
        Copy obj = dod.getNewTransientCopy(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Copy' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Copy' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Copy' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void CopyIntegrationTest.testRemove() {
        Copy obj = dod.getRandomCopy();
        Assert.assertNotNull("Data on demand for 'Copy' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Copy' failed to provide an identifier", id);
        obj = Copy.findCopy(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Copy' with identifier '" + id + "'", Copy.findCopy(id));
    }
    
}
