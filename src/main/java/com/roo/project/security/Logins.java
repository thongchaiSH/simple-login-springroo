package com.roo.project.security;

import com.roo.project.domain.AppUser;
import com.roo.project.domain.AppUserRole;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.ArrayList;
import java.util.List;

public class Logins {
    private static Logger LOGGER = LoggerFactory.getLogger(Logins.class);

    public static AppUser getUser() {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authen = securityContext.getAuthentication();
        AppUser appUser = null;
        if (authen != null) {
            Object principal = authen.getPrincipal();
            if (principal instanceof UserDetaislApp) {
                String userName = ((UserDetaislApp) principal).getUsername();
                List<AppUser> appUsers = AppUser.findAllAppUsersByUsername(userName);
                if(appUsers.size() == 0){
                    LOGGER.error("ERROR: Not found AppUser username [{}]", userName);
                }else if(appUsers.size() > 1){
                    LOGGER.error("ERROR: Duplicated AppUser username [{}]", userName);
                }else{
                    appUser = appUsers.get(0);
                }
            } else if (principal instanceof String) {
                appUser = new AppUser();
                appUser.setUserName("anonymous");
            }
        }

        return appUser;
    }

    public static List<String> getRole() {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authen = securityContext.getAuthentication();
        AppUser appUser = null;
        List<String> result = new ArrayList<String>();

        if (authen != null) {
            Object principal = authen.getPrincipal();
            if (principal instanceof UserDetaislApp) {
                String userName = ((UserDetaislApp) principal).getUsername();
                List<AppUser> appUsers = AppUser.findAllAppUsersByUsername(userName);
                if(appUsers.size() == 0){
                    LOGGER.error("ERROR: Not found AppUser username [{}]", userName);
                }else if(appUsers.size() > 1){
                    LOGGER.error("ERROR: Duplicated AppUser username [{}]", userName);
                }else{
                    appUser = appUsers.get(0);
                    List<AppUserRole> appUserRoles = AppUserRole.findAllAppUserRolesByAppUser(appUser);
                    for(AppUserRole appUserRole : appUserRoles){
                        result.add(appUserRole.getAppRole().getName());
                    }
                }
            }
        }

        return result;
    }
}