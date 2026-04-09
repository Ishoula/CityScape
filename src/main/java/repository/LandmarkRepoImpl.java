package repository;

import model.Landmark;
import Enum.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.List;
import java.util.Optional;

public class LandmarkRepoImpl implements LandmarkRepo{
    @Override
    public boolean save(Landmark landmark) {

        Session session= HibernateUtil.getSessionFactory().openSession();
        Transaction transaction=session.beginTransaction();
        session.save(landmark);
        transaction.commit();
        session.close();
        return true;
    }

    @Override
    public Optional<Landmark> getLandmarkById(int id) {
       Session session=HibernateUtil.getSessionFactory().openSession();
       return
               session.createQuery("FROM Landmark WHERE id = :id", Landmark.class)
               .setParameter("id", id)
               .uniqueResultOptional();
    }


    @Override
    public boolean update(Landmark landmark) {
        Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction transaction=session.beginTransaction();
        session.update(landmark);
        transaction.commit();
        session.close();
        return true;
    }

    @Override
    public boolean delete(int id) {
        Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction transaction=session.beginTransaction();
        session.delete(id);
        transaction.commit();
        session.close();
        return true;
    }

    @Override
    public List<Landmark> getAll() {
        Session session=HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM Landmark", Landmark.class)
                .getResultList();
    }

    @Override
    public List<Landmark> getLandmarkByCategory(Category category) {
        Session session=HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM Landmark where category=:category", Landmark.class)
                .setParameter("category",category)
                .getResultList();
    }

    @Override
    public List<Landmark> getLandmarkByCity(City city) {
        Session session=HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("from Landmark l where l.address.city=:city",Landmark.class)
                .setParameter("city",city)
                .getResultList();
    }

    @Override
    public List<Landmark> getLandmarkByProvince(Province province) {
        Session session=HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("from Landmark l where l.address.province=:province",Landmark.class)
                .setParameter("province",province)
                .getResultList();
    }


}
