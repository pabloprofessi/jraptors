package com.jraptors.bibliosoft2.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ContactInfo {

    /**
     */
    private String email;

    /**
     */
    private String phone;

    /**
     */
    private String celphone;

    /**
     */
    private String adressstreet;

    /**
     */
    private String adressnumber;

    /**
     */
    private String floor;

    /**
     */
    private String floornumber;

    /**
     */
    private String aditionalinfo;

    /**
     */
    @ManyToOne
    private Location location;
}
