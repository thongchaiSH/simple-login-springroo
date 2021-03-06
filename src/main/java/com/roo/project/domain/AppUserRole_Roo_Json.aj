// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.project.domain;

import com.roo.project.domain.AppUserRole;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect AppUserRole_Roo_Json {
    
    public String AppUserRole.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String AppUserRole.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static AppUserRole AppUserRole.fromJsonToAppUserRole(String json) {
        return new JSONDeserializer<AppUserRole>()
        .use(null, AppUserRole.class).deserialize(json);
    }
    
    public static String AppUserRole.toJsonArray(Collection<AppUserRole> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String AppUserRole.toJsonArray(Collection<AppUserRole> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<AppUserRole> AppUserRole.fromJsonArrayToAppUserRoles(String json) {
        return new JSONDeserializer<List<AppUserRole>>()
        .use("values", AppUserRole.class).deserialize(json);
    }
    
}
