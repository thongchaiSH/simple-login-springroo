// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.project.domain;

import com.roo.project.domain.AppRole;
import com.roo.project.domain.AppRoleDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect AppRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AppRoleDataOnDemand: @Component;
    
    private Random AppRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<AppRole> AppRoleDataOnDemand.data;
    
    public AppRole AppRoleDataOnDemand.getNewTransientAppRole(int index) {
        AppRole obj = new AppRole();
        setCreatedBy(obj, index);
        setCreatedDate(obj, index);
        setName(obj, index);
        setStatus(obj, index);
        setUpdatedBy(obj, index);
        setUpdatedDate(obj, index);
        return obj;
    }
    
    public void AppRoleDataOnDemand.setCreatedBy(AppRole obj, int index) {
        String createdBy = "createdBy_" + index;
        obj.setCreatedBy(createdBy);
    }
    
    public void AppRoleDataOnDemand.setCreatedDate(AppRole obj, int index) {
        Date createdDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreatedDate(createdDate);
    }
    
    public void AppRoleDataOnDemand.setName(AppRole obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void AppRoleDataOnDemand.setStatus(AppRole obj, int index) {
        String status = "status_" + index;
        obj.setStatus(status);
    }
    
    public void AppRoleDataOnDemand.setUpdatedBy(AppRole obj, int index) {
        String updatedBy = "updatedBy_" + index;
        obj.setUpdatedBy(updatedBy);
    }
    
    public void AppRoleDataOnDemand.setUpdatedDate(AppRole obj, int index) {
        Date updatedDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setUpdatedDate(updatedDate);
    }
    
    public AppRole AppRoleDataOnDemand.getSpecificAppRole(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        AppRole obj = data.get(index);
        Long id = obj.getId();
        return AppRole.findAppRole(id);
    }
    
    public AppRole AppRoleDataOnDemand.getRandomAppRole() {
        init();
        AppRole obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return AppRole.findAppRole(id);
    }
    
    public boolean AppRoleDataOnDemand.modifyAppRole(AppRole obj) {
        return false;
    }
    
    public void AppRoleDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = AppRole.findAppRoleEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'AppRole' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<AppRole>();
        for (int i = 0; i < 10; i++) {
            AppRole obj = getNewTransientAppRole(i);
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
