// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jraptors.bibliosoft2.domain;

import com.jraptors.bibliosoft2.domain.Loan;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Loan_Roo_Jpa_Entity {
    
    declare @type: Loan: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Loan.id;
    
    @Version
    @Column(name = "version")
    private Integer Loan.version;
    
    public Long Loan.getId() {
        return this.id;
    }
    
    public void Loan.setId(Long id) {
        this.id = id;
    }
    
    public Integer Loan.getVersion() {
        return this.version;
    }
    
    public void Loan.setVersion(Integer version) {
        this.version = version;
    }
    
}
