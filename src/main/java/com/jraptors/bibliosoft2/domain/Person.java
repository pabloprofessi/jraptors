package com.jraptors.bibliosoft2.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Person {

    /**
     */
    private String firstname;

    /**
     */
    private String lastname;

    /**
     */
    private String dni;

    /**
     */
    private String cuil;

    /**
     */
    private String libraryrole;

    /**
     */
    private String reputation;

    /**
     */
    private String librarystate;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date suspenddate;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date suspendreason;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date reincorporationdate;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date creationdate;

    /**
     */
    private String usernm;

    /**
     */
    private String passwordkey;

    /**
     */
    @ManyToOne
    private ContactInfo contactinfo;

    /**
     */
    private String aditionalinfo;
}
