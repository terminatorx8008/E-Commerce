/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.Helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author Vasu
 */
public class DescriptionShortenner {
    public static String minimiseDescription(String des){
        String[] str = des.split(" ");
        if(des.length()>10){
            StringBuilder strb = new StringBuilder();
            int i=0;
            while(i < 10 && i < str.length){
                strb.append(str[i++]).append(" ");
            }
            return (strb.toString().trim()+" ...");
        }else{
            return(des+" ...");
        }
    }
    public static Map<String,Long> getCount(SessionFactory factory){
        Session session = factory.openSession();
        String query1 = "Select count(*)from User"; 
        String query2 = "Select count(*)from Products";
        Query createQuery = session.createQuery(query1);
        Query createQuery1 = session.createQuery(query2);
        Long userCount =(Long) createQuery.list().get(0);
        Long productCount =(Long) createQuery1.list().get(0);
        Map<String , Long> map =new HashMap<String, Long>();
        map.put("userCount", userCount);
        map.put("productCount", productCount);
        session.close();
        return map;
    }
}

    
