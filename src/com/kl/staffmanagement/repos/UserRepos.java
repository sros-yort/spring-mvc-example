package com.kl.staffmanagement.repos;

import com.kl.staffmanagement.model.User;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserRepos {

    private SessionFactory sessionFactory;

    public UserRepos(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void create(User user){
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    public User findByEmail(String email){
        User user = null;
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            user = session.find(User.class, email);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return user;
    }


    public List<User> getAll() {
        Criteria criteria = sessionFactory.openSession().createCriteria(User.class);
        return criteria.list();
    }
}
