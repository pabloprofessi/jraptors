package com.jraptors.bibliosoft2.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Loan {

    /**
     */
    @ManyToOne
    private Copy copy;

    /**
     */
    @ManyToOne
    private Person usernm;

    /**
     */
    private String loantype;

    /**
     */
    private String actualreturndate;

    /**
     */
    private String loandate;

    /**
     */
    private String returnstate;

    /**
     */
    private String comments;

    /**
     */
    @ManyToOne
    private Person affiliate;
}
