// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jraptors.bibliosoft2.domain;

import com.jraptors.bibliosoft2.domain.Author;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Author_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Author.entityManager;
    
    public static final EntityManager Author.entityManager() {
        EntityManager em = new Author().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Author.countAuthors() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Author o", Long.class).getSingleResult();
    }
    
    public static List<Author> Author.findAllAuthors() {
        return entityManager().createQuery("SELECT o FROM Author o", Author.class).getResultList();
    }
    
    public static Author Author.findAuthor(Long id) {
        if (id == null) return null;
        return entityManager().find(Author.class, id);
    }
    
    public static List<Author> Author.findAuthorEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Author o", Author.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Author.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Author.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Author attached = Author.findAuthor(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Author.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Author.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Author Author.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Author merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
