/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dto;

import Entities.Products;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Vasu
 */
public class ProductDto {

    private SessionFactory factory;

    public ProductDto(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean savePraduct(Products product) {
        try(Session session = this.factory.openSession()){
            Transaction tx = session.beginTransaction();
            session.save(product);
            tx.commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Products> getAllProducts() {
        List<Products> list = null;
        try {
            Session session = this.factory.openSession();
            Query query = session.createQuery("FROM Products");
            list = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public List<Products> getAllProductsById(int id) {
        List<Products> list = null;
        try(Session session = this.factory.openSession()){
            Query query = session.createQuery("FROM Products as p WHERE p.category.categoryId =: id");
            query.setParameter("id",id);
            list = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

}
