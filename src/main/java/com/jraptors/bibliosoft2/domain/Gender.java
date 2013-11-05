package com.jraptors.bibliosoft2.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Gender {

    /**
     */
    private String name;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Book> books = new HashSet<Book>();
}
