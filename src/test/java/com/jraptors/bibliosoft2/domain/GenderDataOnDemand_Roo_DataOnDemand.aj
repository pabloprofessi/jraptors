// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jraptors.bibliosoft2.domain;

import com.jraptors.bibliosoft2.domain.Gender;
import com.jraptors.bibliosoft2.domain.GenderDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect GenderDataOnDemand_Roo_DataOnDemand {
    
    declare @type: GenderDataOnDemand: @Component;
    
    private Random GenderDataOnDemand.rnd = new SecureRandom();
    
    private List<Gender> GenderDataOnDemand.data;
    
    public Gender GenderDataOnDemand.getNewTransientGender(int index) {
        Gender obj = new Gender();
        setName(obj, index);
        return obj;
    }
    
    public void GenderDataOnDemand.setName(Gender obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public Gender GenderDataOnDemand.getSpecificGender(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Gender obj = data.get(index);
        Long id = obj.getId();
        return Gender.findGender(id);
    }
    
    public Gender GenderDataOnDemand.getRandomGender() {
        init();
        Gender obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Gender.findGender(id);
    }
    
    public boolean GenderDataOnDemand.modifyGender(Gender obj) {
        return false;
    }
    
    public void GenderDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Gender.findGenderEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Gender' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Gender>();
        for (int i = 0; i < 10; i++) {
            Gender obj = getNewTransientGender(i);
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
            data.add(obj);
        }
    }
    
}