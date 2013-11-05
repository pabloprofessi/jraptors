package com.jraptors.bibliosoft2.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Book {

    /**
     */
    private String isbn;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Author> authors = new HashSet<Author>();

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Gender> genders = new HashSet<Gender>();

    /**
     */
    private String editionnumber;

    /**
     */
    private String editioncountry;

    /**
     */
    private String summary;

    /**
     */
    @ManyToOne
    private Publisher publisher;

    /**
     */
    private String languagecode;

    /**
     */
    private String valuation;

    /**
     */
    private String price;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date creationdate;

    /**
     */
    @ManyToOne
    private Person creationperson;

    /**
     */
    private String imageurl;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Copy> copies = new HashSet<Copy>();
}
