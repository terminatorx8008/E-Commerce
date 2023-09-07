/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.Helper;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;


/**
 *
 * @author Vasu
 */
public class FactoryProvider {

    private static StandardServiceRegistry registry;
    private static SessionFactory factory;

    public static SessionFactory getFactory() {
        try {
            registry = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
            MetadataSources sources = new MetadataSources(registry);
            Metadata metadata = sources.getMetadataBuilder().build();
            factory = metadata.getSessionFactoryBuilder().build();
            System.out.println(factory);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return factory;
    }

}
