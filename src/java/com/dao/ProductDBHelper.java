/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.beans.Product;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class ProductDBHelper {

    public static String TABLE_NAME = "products";
    public static String ID = "id";
    public static String NAME = "name";
    public static String CATEGORY = "category"; //Main Category
    public static String TYPE = "type";  //Sub Category
    public static String LOCATION = "location";
    public static String UNIT_SIZE = "unit_size";
    public static String AUTHOR_ID = "author_id";
    public static String UNIT = "unit";
    public static String UNIT_PRICE = "unit_price";
    public static String VIEW = "view";
    public static String DESCRIPTION = "description";
    public static String IMAGE = "image";
    public static String SelectAll = "SELECT * FROM products";
    public static String COMMA = ", ";

    static DatabaseConnector dbConnector = DatabaseConnector.getIsntance();
    static Connection connection;
    static PreparedStatement statement;
    static ResultSet rs;

    public static void main(String[] args) {
      
        System.out.println(delete(27));
    }

    public static ArrayList<Product> getAll() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            connection = dbConnector.getConnection();
            statement = connection.prepareStatement(SelectAll);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(ID));
                product.setName(rs.getString(NAME));
                product.setCategory(rs.getString(CATEGORY));
                product.setType(rs.getString(TYPE));
                product.setLocation(rs.getString(LOCATION));
                product.setAuthorId(rs.getInt(AUTHOR_ID));
                product.setUnit(rs.getFloat(UNIT));
                product.setUnitPrize(rs.getFloat(UNIT_PRICE));
                product.setUnitSize(rs.getString(UNIT_SIZE));
                product.setView(rs.getInt(VIEW));
                product.setDescription(rs.getString(DESCRIPTION));
                product.setImage(rs.getString(IMAGE));
                product.setTimestamp(rs.getTimestamp("time"));
                products.add(product);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }
        return products;
    }
    
    public static ArrayList<Product> getSameCategory(String cat) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            connection = dbConnector.getConnection();
            statement = connection.prepareStatement("select * from "+TABLE_NAME+" WHERE "+CATEGORY+"=?");
            statement.setString(1, cat);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(ID));
                product.setName(rs.getString(NAME));
                product.setCategory(rs.getString(CATEGORY));
                product.setType(rs.getString(TYPE));
                product.setLocation(rs.getString(LOCATION));
                product.setAuthorId(rs.getInt(AUTHOR_ID));
                product.setUnit(rs.getFloat(UNIT));
                product.setUnitPrize(rs.getFloat(UNIT_PRICE));
                product.setUnitSize(rs.getString(UNIT_SIZE));
                product.setView(rs.getInt(VIEW));
                product.setDescription(rs.getString(DESCRIPTION));
                product.setImage(rs.getString(IMAGE));
                product.setTimestamp(rs.getTimestamp("time"));
                products.add(product);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }
        return products;
    }
     public static ArrayList<Product> search(String key) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            connection = dbConnector.getConnection();
            statement = connection.prepareStatement("select * from "+TABLE_NAME+" WHERE "
                    +NAME+" like \'%"+key+"%\' OR "+CATEGORY+" LIKE \'%"+key+"%\' OR "+TYPE+" LIKE \'%"+key+"%\'");
            
            rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(ID));
                product.setName(rs.getString(NAME));
                product.setCategory(rs.getString(CATEGORY));
                product.setType(rs.getString(TYPE));
                product.setLocation(rs.getString(LOCATION));
                product.setAuthorId(rs.getInt(AUTHOR_ID));
                product.setUnit(rs.getFloat(UNIT));
                product.setUnitPrize(rs.getFloat(UNIT_PRICE));
                product.setUnitSize(rs.getString(UNIT_SIZE));
                product.setView(rs.getInt(VIEW));
                product.setDescription(rs.getString(DESCRIPTION));
                product.setImage(rs.getString(IMAGE));
                product.setTimestamp(rs.getTimestamp("time"));
                products.add(product);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }
        return products;
    }
    
    public static ArrayList<Product> getSameType(String type) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            connection = dbConnector.getConnection();
            statement = connection.prepareStatement("select * from "+TABLE_NAME+" WHERE "+TYPE+"=?");
            statement.setString(1, type);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(ID));
                product.setName(rs.getString(NAME));
                product.setCategory(rs.getString(CATEGORY));
                product.setType(rs.getString(TYPE));
                product.setLocation(rs.getString(LOCATION));
                product.setAuthorId(rs.getInt(AUTHOR_ID));
                product.setUnit(rs.getFloat(UNIT));
                product.setUnitPrize(rs.getFloat(UNIT_PRICE));
                product.setUnitSize(rs.getString(UNIT_SIZE));
                product.setView(rs.getInt(VIEW));
                product.setDescription(rs.getString(DESCRIPTION));
                product.setImage(rs.getString(IMAGE));
                product.setTimestamp(rs.getTimestamp("time"));
                products.add(product);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }
        return products;
    }
    
    public static ArrayList<Product> getByUser(int id) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            connection = dbConnector.getConnection();
            statement = connection.prepareStatement("select * from "+TABLE_NAME+" WHERE "+AUTHOR_ID+"=?");
            statement.setInt(1, id);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(ID));
                product.setName(rs.getString(NAME));
                product.setCategory(rs.getString(CATEGORY));
                product.setType(rs.getString(TYPE));
                product.setLocation(rs.getString(LOCATION));
                product.setAuthorId(rs.getInt(AUTHOR_ID));
                product.setUnit(rs.getFloat(UNIT));
                product.setUnitPrize(rs.getFloat(UNIT_PRICE));
                product.setUnitSize(rs.getString(UNIT_SIZE));
                product.setView(rs.getInt(VIEW));
                product.setDescription(rs.getString(DESCRIPTION));
                product.setImage(rs.getString(IMAGE));
                product.setTimestamp(rs.getTimestamp("time"));
                products.add(product);

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }
        return products;
    }

    public static Product getById(int id) {
        Product product = new Product();
        try {
            connection = dbConnector.getConnection();
            statement = connection.prepareStatement("SELECT * FROM products WHERE id=" + id);
            rs = statement.executeQuery();
            while (rs.next()) {
                
                product.setId(rs.getInt(ID));
                product.setName(rs.getString(NAME));
                product.setCategory(rs.getString(CATEGORY));
                product.setType(rs.getString(TYPE));
                product.setLocation(rs.getString(LOCATION));
                product.setAuthorId(rs.getInt(AUTHOR_ID));
                product.setUnit(rs.getFloat(UNIT));
                product.setUnitPrize(rs.getFloat(UNIT_PRICE));
                product.setUnitSize(rs.getString(UNIT_SIZE));
                product.setView(rs.getInt(VIEW));
                product.setDescription(rs.getString(DESCRIPTION));
                product.setImage(rs.getString(IMAGE));
                product.setTimestamp(rs.getTimestamp("time"));

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return product;
    }

    public static ArrayList<Product> getByCategoryDist(String cat) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            connection = dbConnector.getConnection();
            statement = connection.prepareStatement("select distinct type, image from products where category = ? group by type LIMIT 0,6");
            statement.setString(1, cat);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setType(rs.getString(TYPE));
                product.setImage(rs.getString(IMAGE));
                products.add(product);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        
        return products;
    }

    public static ArrayList<String> getType() {
        ArrayList<String> types = new ArrayList<>();
        try {
            connection = dbConnector.getConnection();
            statement = connection.prepareStatement("select distinct type from products limit 0,9");
            rs = statement.executeQuery();
            while (rs.next()) {
                types.add(rs.getString(1));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
        }        
        return types;
    }
public static ArrayList<String> getCat() {
        ArrayList<String> types = new ArrayList<>();
        try {
            connection = dbConnector.getConnection();
            statement = connection.prepareStatement("select distinct "+CATEGORY+" from products limit 0,9");
            rs = statement.executeQuery();
            while (rs.next()) {
                types.add(rs.getString(1));
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
        }        
        return types;
    }

    public static int save(Product product) {
        int status = 0;
        connection = dbConnector.getConnection();
        try {
            statement = connection.prepareCall("INSERT INTO " + TABLE_NAME + " ("
                    + NAME + COMMA
                    + CATEGORY + COMMA
                    + TYPE + COMMA
                    + LOCATION + COMMA
                    + UNIT_SIZE + COMMA
                    + AUTHOR_ID + COMMA
                    + UNIT + COMMA
                    + UNIT_PRICE + COMMA
                    + VIEW + COMMA
                    + DESCRIPTION + COMMA
                    + IMAGE + ") values(?,?,?,?,?,?,?,?,?,?,?)");
            statement.setString(1, product.getName());
            statement.setString(2, product.getCategory());
            statement.setString(3, product.getType());
            statement.setString(4, product.getLocation());
            statement.setString(5, product.getUnitSize());
            statement.setInt(6, product.getAuthorId());
            statement.setFloat(7, product.getUnit());
            statement.setFloat(8, product.getUnitPrize());
            statement.setInt(9, 0);
            statement.setString(10, product.getDescription());
            statement.setString(11, product.getImage());

            status = statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return status;
    }
    
    public static int delete(int id){
        int status=0;
         connection = dbConnector.getConnection();
        try {
            statement = connection.prepareCall( "DELETE FROM "+TABLE_NAME+" where "+ID +"=?");
            statement.setInt(1, id);
            status = statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                statement.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBHelper.class.getName()).log(Level.SEVERE, null, ex);
            }
        }    
        return status;
    }

}
