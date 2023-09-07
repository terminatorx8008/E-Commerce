/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author Vasu
 */

@Entity
public class Products {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int productId;
    private String prodectname;
    @Column(length = 3000)
    private String prodectDescription;
    private String prodectPhoto;
    private int prodectPrice;
    private int prodectDiscount;
    private int productQuantity;
    @ManyToOne
    private Category category;

    public Products() {
    }

    public Products(int productId, String prodectname, String prodectDescription, String prodectPhoto, int prodectPrice, int prodectDiscount, int productQuantity,Category category) {
        this.productId = productId;
        this.prodectname = prodectname;
        this.prodectDescription = prodectDescription;
        this.prodectPhoto = prodectPhoto;
        this.prodectPrice = prodectPrice;
        this.prodectDiscount = prodectDiscount;
        this.productQuantity = productQuantity;
        this.category=category;
    }

    public Products(String prodectname, String prodectDescription, String prodectPhoto, int prodectPrice, int prodectDiscount, int productQuantity,Category category) {
        this.prodectname = prodectname;
        this.prodectDescription = prodectDescription;
        this.prodectPhoto = prodectPhoto;
        this.prodectPrice = prodectPrice;
        this.prodectDiscount = prodectDiscount;
        this.productQuantity = productQuantity;
        this.category=category;
    }

    public Products(String prodectname, String prodectDescription, String prodectPhoto, int prodectPrice, int prodectDiscount, int productQuantity) {
        this.prodectname = prodectname;
        this.prodectDescription = prodectDescription;
        this.prodectPhoto = prodectPhoto;
        this.prodectPrice = prodectPrice;
        this.prodectDiscount = prodectDiscount;
        this.productQuantity = productQuantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProdectname() {
        return prodectname;
    }

    public void setProdectname(String prodectname) {
        this.prodectname = prodectname;
    }

    public String getProdectDescription() {
        return prodectDescription;
    }

    public void setProdectDescription(String prodectDescription) {
        this.prodectDescription = prodectDescription;
    }

    public String getProdectPhoto() {
        return prodectPhoto;
    }

    public void setProdectPhoto(String prodectPhoto) {
        this.prodectPhoto = prodectPhoto;
    }

    public int getProdectPrice() {
        return prodectPrice;
    }

    public void setProdectPrice(int prodectPrice) {
        this.prodectPrice = prodectPrice;
    }

    public int getProdectDiscount() {
        return prodectDiscount;
    }

    public void setProdectDiscount(int prodectDiscount) {
        this.prodectDiscount = prodectDiscount;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Products{" + "productId=" + productId + ", prodectname=" + prodectname + ", prodectDescription=" + prodectDescription + ", prodectPhoto=" + prodectPhoto + ", prodectPrice=" + prodectPrice + ", prodectDiscount=" + prodectDiscount + ", productQuantity=" + productQuantity + ", category=" + category + '}';
    }
    
    public int pxAfterDiscount(){
        int afterPrize = this.prodectPrice-((this.prodectPrice*this.prodectDiscount)/100) ;
        return afterPrize;
    }

}
