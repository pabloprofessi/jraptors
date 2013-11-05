// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jraptors.bibliosoft2.domain;

import com.jraptors.bibliosoft2.domain.Book;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Book_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Book.entityManager;
    
    public static final EntityManager Book.entityManager() {
        EntityManager em = new Book().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Book.countBooks() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Book o", Long.class).getSingleResult();
    }
    
    public static List<Book> Book.findAllBooks() {
        return entityManager().createQuery("SELECT o FROM Book o", Book.class).getResultList();
    }
    
    public static Book Book.findBook(Long id) {
        if (id == null) return null;
        return entityManager().find(Book.class, id);
    }
    
    public static List<Book> Book.findBookEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Book o", Book.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Book.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Book.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Book attached = Book.findBook(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Book.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Book.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Book Book.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Book merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
