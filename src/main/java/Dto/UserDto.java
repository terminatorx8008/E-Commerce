/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dto;

import Entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author Vasu
 */
public class UserDto {
    private SessionFactory factory;

    public UserDto(SessionFactory factory) {
        this.factory = factory;
    }
    public User getUserByEmailAndPassword(String email,String password){
        User user = null;
        try{
            String query ="FROM User where userEmail =:e and userPassword =:p";
            Session session =this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);
            user = (User) q.uniqueResult();
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
                
    }
}
