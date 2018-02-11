package com.roo.project.security;


import com.roo.project.domain.AppUser;
import com.roo.project.domain.AppUserRole;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.List;

public class UserDetailServices implements UserDetailsService {

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<AppUser> appUsers = AppUser.findAllAppUsersByUsername(username);
        if(appUsers.size() == 0){
            throw new UsernameNotFoundException("Login incorrect");
        }
        else if(appUsers.size() > 1){
            throw new UsernameNotFoundException("Duplicated username");
        }
        List<AppUserRole> appUserRoles = AppUserRole.findAllAppUserRolesByAppUser(appUsers.get(0));
        return new UserDetaislApp(appUserRoles);
    }
}
