// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jraptors.bibliosoft2.domain;

import com.jraptors.bibliosoft2.domain.Publisher;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Publisher_Roo_Jpa_Entity {
    
    declare @type: Publisher: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Publisher.id;
    
    @Version
    @Column(name = "version")
    private Integer Publisher.version;
    
    public Long Publisher.getId() {
        return this.id;
    }
    
    public void Publisher.setId(Long id) {
        this.id = id;
    }
    
    public Integer Publisher.getVersion() {
        return this.version;
    }
    
    public void Publisher.setVersion(Integer version) {
        this.version = version;
    }
    
}
