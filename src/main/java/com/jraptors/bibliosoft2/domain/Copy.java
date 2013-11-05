package com.jraptors.bibliosoft2.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Copy {

    /**
     */
    @ManyToOne
    private Placement placement;

    /**
     */
    private String physicalstate;

    /**
     */
    private String editionyear;

    /**
     */
    private String creationdate;

    /**
     */
    private String deletiondate;

    /**
     */
    @ManyToOne
    private Person creationperson;

    /**
     */
    @ManyToOne
    private Person deletionperson;

    /**
     */
    private String comment;
}
