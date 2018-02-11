// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.project.domain;

import com.roo.project.domain.AppRoleDataOnDemand;
import com.roo.project.domain.AppUserDataOnDemand;
import com.roo.project.domain.AppUserRole;
import com.roo.project.domain.AppUserRoleDataOnDemand;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect AppUserRoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AppUserRoleDataOnDemand: @Component;
    
    private Random AppUserRoleDataOnDemand.rnd = new SecureRandom();
    
    private List<AppUserRole> AppUserRoleDataOnDemand.data;
    
    @Autowired
    AppRoleDataOnDemand AppUserRoleDataOnDemand.appRoleDataOnDemand;
    
    @Autowired
    AppUserDataOnDemand AppUserRoleDataOnDemand.appUserDataOnDemand;
    
    public AppUserRole AppUserRoleDataOnDemand.getNewTransientAppUserRole(int index) {
        AppUserRole obj = new AppUserRole();
        setCreatedBy(obj, index);
        setCreatedDate(obj, index);
        setStatus(obj, index);
        setUpdatedBy(obj, index);
        setUpdatedDate(obj, index);
        return obj;
    }
    
    public void AppUserRoleDataOnDemand.setCreatedBy(AppUserRole obj, int index) {
        String createdBy = "createdBy_" + index;
        obj.setCreatedBy(createdBy);
    }
    
    public void AppUserRoleDataOnDemand.setCreatedDate(AppUserRole obj, int index) {
        Date createdDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreatedDate(createdDate);
    }
    
    public void AppUserRoleDataOnDemand.setStatus(AppUserRole obj, int index) {
        String status = "status_" + index;
        obj.setStatus(status);
    }
    
    public void AppUserRoleDataOnDemand.setUpdatedBy(AppUserRole obj, int index) {
        String updatedBy = "updatedBy_" + index;
        obj.setUpdatedBy(updatedBy);
    }
    
    public void AppUserRoleDataOnDemand.setUpdatedDate(AppUserRole obj, int index) {
        Date updatedDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setUpdatedDate(updatedDate);
    }
    
    public AppUserRole AppUserRoleDataOnDemand.getSpecificAppUserRole(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        AppUserRole obj = data.get(index);
        Long id = obj.getId();
        return AppUserRole.findAppUserRole(id);
    }
    
    public AppUserRole AppUserRoleDataOnDemand.getRandomAppUserRole() {
        init();
        AppUserRole obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return AppUserRole.findAppUserRole(id);
    }
    
    public boolean AppUserRoleDataOnDemand.modifyAppUserRole(AppUserRole obj) {
        return false;
    }
    
    public void AppUserRoleDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = AppUserRole.findAppUserRoleEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'AppUserRole' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<AppUserRole>();
        for (int i = 0; i < 10; i++) {
            AppUserRole obj = getNewTransientAppUserRole(i);
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
