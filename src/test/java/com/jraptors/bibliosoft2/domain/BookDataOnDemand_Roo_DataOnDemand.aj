// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jraptors.bibliosoft2.domain;

import com.jraptors.bibliosoft2.domain.Book;
import com.jraptors.bibliosoft2.domain.BookDataOnDemand;
import com.jraptors.bibliosoft2.domain.PersonDataOnDemand;
import com.jraptors.bibliosoft2.domain.PublisherDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect BookDataOnDemand_Roo_DataOnDemand {
    
    declare @type: BookDataOnDemand: @Component;
    
    private Random BookDataOnDemand.rnd = new SecureRandom();
    
    private List<Book> BookDataOnDemand.data;
    
    @Autowired
    PersonDataOnDemand BookDataOnDemand.personDataOnDemand;
    
    @Autowired
    PublisherDataOnDemand BookDataOnDemand.publisherDataOnDemand;
    
    public Book BookDataOnDemand.getNewTransientBook(int index) {
        Book obj = new Book();
        setCreationdate(obj, index);
        setEditioncountry(obj, index);
        setEditionnumber(obj, index);
        setImageurl(obj, index);
        setIsbn(obj, index);
        setLanguagecode(obj, index);
        setPrice(obj, index);
        setSummary(obj, index);
        setValuation(obj, index);
        return obj;
    }
    
    public void BookDataOnDemand.setCreationdate(Book obj, int index) {
        Date creationdate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreationdate(creationdate);
    }
    
    public void BookDataOnDemand.setEditioncountry(Book obj, int index) {
        String editioncountry = "editioncountry_" + index;
        obj.setEditioncountry(editioncountry);
    }
    
    public void BookDataOnDemand.setEditionnumber(Book obj, int index) {
        String editionnumber = "editionnumber_" + index;
        obj.setEditionnumber(editionnumber);
    }
    
    public void BookDataOnDemand.setImageurl(Book obj, int index) {
        String imageurl = "imageurl_" + index;
        obj.setImageurl(imageurl);
    }
    
    public void BookDataOnDemand.setIsbn(Book obj, int index) {
        String isbn = "isbn_" + index;
        obj.setIsbn(isbn);
    }
    
    public void BookDataOnDemand.setLanguagecode(Book obj, int index) {
        String languagecode = "languagecode_" + index;
        obj.setLanguagecode(languagecode);
    }
    
    public void BookDataOnDemand.setPrice(Book obj, int index) {
        String price = "price_" + index;
        obj.setPrice(price);
    }
    
    public void BookDataOnDemand.setSummary(Book obj, int index) {
        String summary = "summary_" + index;
        obj.setSummary(summary);
    }
    
    public void BookDataOnDemand.setValuation(Book obj, int index) {
        String valuation = "valuation_" + index;
        obj.setValuation(valuation);
    }
    
    public Book BookDataOnDemand.getSpecificBook(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Book obj = data.get(index);
        Long id = obj.getId();
        return Book.findBook(id);
    }
    
    public Book BookDataOnDemand.getRandomBook() {
        init();
        Book obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Book.findBook(id);
    }
    
    public boolean BookDataOnDemand.modifyBook(Book obj) {
        return false;
    }
    
    public void BookDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Book.findBookEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Book' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Book>();
        for (int i = 0; i < 10; i++) {
            Book obj = getNewTransientBook(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
