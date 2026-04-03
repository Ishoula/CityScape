package repository;

import model.User;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.Optional;

public class UserRepoImpl implements UserRepo{


    @Override
    public boolean save(User user) {
        Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction transaction= session.beginTransaction();
        try{
            session.save(user);
            transaction.commit();
            session.close();
            return true;
        } finally {
            session.close();
        }
    }


        public Optional<User> findByEmail(String email) {
            Session session=HibernateUtil.getSessionFactory().openSession();
            Transaction transaction=session.beginTransaction();
            try {
                return session.createQuery("FROM User WHERE email = :email", User.class)
                        .setParameter("email", email)
                        .uniqueResultOptional();
            } finally {
                session.close();
            }
        }


    @Override
    public void deleteByEmail(String email) {
        Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction transaction=session.beginTransaction();
        try {
            session.createQuery("DELETE FROM User WHERE email = :email")
                    .setParameter("email", email)
                    .executeUpdate();
            transaction.commit();
        } finally {
            session.close();
        }
    }

    @Override
    public boolean existsByEmail(String email) {
        Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction transaction=session.beginTransaction();
        try {
            Long count = session.createQuery("SELECT COUNT(*) FROM User WHERE email = :email", Long.class)
                    .setParameter("email", email)
                    .uniqueResult();
            return count != null && count > 0;
        } finally {
            session.close();
        }
    }
}
