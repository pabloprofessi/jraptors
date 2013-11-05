package com.jraptors.bibliosoft2.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Location {

    /**
     */
    private String locationname;

    /**
     */
    private String postalcode;

    /**
     */
    private String city;

    /**
     */
    private String country;

    /**
     */
    private String floor;

    /**
     */
    private String floornumber;

    /**
     */
    private String aditionalinfo;
}
