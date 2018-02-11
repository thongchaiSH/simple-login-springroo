package com.roo.project.security;
import com.roo.project.domain.AppUserRole;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.*;

public class UserDetaislApp implements UserDetails {

//    public static final GrantedAuthority ADMIN_ROLE = new SimpleGrantedAuthority("ADMIN");
//    public static final GrantedAuthority EDITOR_ROLE = new SimpleGrantedAuthority("EDITOR");
//    public static final GrantedAuthority PUBLIC_ROLE = new SimpleGrantedAuthority("PUBLIC");

    private List<AppUserRole> appUserRoles;
    private Set<GrantedAuthority> grants;
    private List<String> roles = new ArrayList<String>();

    public  UserDetaislApp(List<AppUserRole> appUserRoles) {
        this.appUserRoles = appUserRoles;
    }

    public List<String> getRoles(){
        return roles;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        if (grants == null) {
            grants = new HashSet<GrantedAuthority>();
            for(AppUserRole appUserRole : appUserRoles){
                roles.add(appUserRole.getAppRole().getName());
                grants.add(new SimpleGrantedAuthority(appUserRole.getAppRole().getName()));
            }
        }
        return grants;
    }

    @Override
    public String getPassword() {
        return appUserRoles.get(0).getAppUser().getPassword();
    }

    @Override
    public String getUsername() {
        return appUserRoles.get(0).getAppUser().getUserName();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
