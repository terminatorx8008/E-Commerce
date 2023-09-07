/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dto;

import org.hibernate.SessionFactory;
import Entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Vasu
 */
public class CategoryDto {

    private SessionFactory factory;

    public CategoryDto(SessionFactory factory) {
        this.factory = factory;
    }

    public int saveCategory(Category cat) {
        int catId;
        try (Session session = this.factory.openSession()) {
            Transaction tx = session.beginTransaction();
            catId = (int) session.save(cat);
            tx.commit();
        }
        return catId;
    }

    public List<Category> getCategories() {
        try (Session s = this.factory.openSession()) {
            Query createQuery = s.createQuery("from Category");
            List list = createQuery.list();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Category getCategoryById(int catId) {
        Category category = null;
        try (Session session = factory.openSession()) {
            category = session.get(Category.class, catId);
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;

    }
}
