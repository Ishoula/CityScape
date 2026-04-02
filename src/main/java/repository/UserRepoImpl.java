package repository;

import model.User;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class UserRepoImpl implements UserRepo{
    @Override
    public void save(User user) {
        Session session= HibernateUtil.getSessionFactory().openSession();
        Transaction tx= session.beginTransaction();
        tx.commit();
        session.save(user);
        session.close();
    }

    @Override
    public User findUser(User user) {
        Session session= HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
        session.createQuery("from User where email=:email and password=:password",User.class)
                .setParameter("email",user.getEmail())
                .setParameter("password",user.getPassword())
                .getSingleResult();
        tx.commit();
        session.close();
        return user;
    }

    @Override
    public void deleteUser(User user) {
        Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx= session.beginTransaction();
        session.delete(user);
        tx.commit();
        session.close();

    }
}
