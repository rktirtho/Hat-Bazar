/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import java.sql.Time;
import java.sql.Timestamp;

/**
 *
 * @author Siam
 */
public class Product {
    private int id;
    private String name;
    private String category; //Main Category
    private String type;  //Sub Category
    private String location;
    private String unitSize;
    private int authorId;
    private float unit;
    private float unitPrize;
    private int view;
    private String description;
    private String image;
    private Timestamp timestamp;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getUnitSize() {
        return unitSize;
    }

    public void setUnitSize(String unitSize) {
        this.unitSize = unitSize;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public float getUnit() {
        return unit;
    }

    public void setUnit(float unit) {
        this.unit = unit;
    }

    public float getUnitPrize() {
        return unitPrize;
    }

    public void setUnitPrize(float unitPrize) {
        this.unitPrize = unitPrize;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", category=" + category + ", type=" + type + ", location=" + location + ", unitSize=" + unitSize + ", authorId=" + authorId + ", unit=" + unit + ", unitPrize=" + unitPrize + ", view=" + view + ", description=" + description + ", image=" + image + ", timestamp=" + timestamp + '}';
    }
    
    


    
    
    
    
    
    
}
