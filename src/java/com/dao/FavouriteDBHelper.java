/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.beans.Product;
import static com.dao.ProductDBHelper.connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class FavouriteDBHelper {

    public static String TABLE_NAME = "favorite";
    public static String ID = "id";
    public static String CID = "customer_id";
    public static String PID = "product_id";
    public static String TIME = "time";
    public static String COMMA = ", ";

    static DatabaseConnector dbConnector = DatabaseConnector.getIsntance();
    static Connection connection;
    static PreparedStatement statement;
    static ResultSet rs;

    public static void main(String[] args) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-ddHH-mm-ss");  
   LocalDateTime now = LocalDateTime.now();  
   String classpath = System.getProperty("java.class.path");
        System.err.println(classpath);
    }

    public static int save(int pid, int cid) {
        int status = 0;
        connection = dbConnector.getConnection();
        try {
            statement = connection.prepareCall("INSERT INTO " + TABLE_NAME + " (" + CID + COMMA + PID + ") VALUES(?,?)");
            statement.setInt(1, cid);
            statement.setInt(2, pid);
            status = statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FavouriteDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;

    }

    public static int delete(int id) {
        int status = 0;
        connection = dbConnector.getConnection();
        try {
            statement = connection.prepareCall("DELETE FROM " + TABLE_NAME + " WHERE " + ID + "=?");
            statement.setInt(1, id);
            status = statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FavouriteDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    public static ArrayList<Product> getById(int userId) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            connection = dbConnector.getConnection();
            statement = connection.prepareStatement("select favorite.id, \n"
                    + "products.id,\n"
                    + "products.name,\n"
                    + "products.unit,\n"
                    + "products.unit_price,\n"
                    + "products.unit_size,\n"
                    + "products.image,\n"
                    + "products.location\n"
                    + "from favorite \n"
                    + "inner join products \n"
                    + "on favorite.product_id = products.id and favorite.customer_id= ?");
            statement.setInt(1, userId);
            rs = statement.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(ProductDBHelper.ID));
                product.setName(rs.getString(ProductDBHelper.NAME));
                product.setLocation(rs.getString(ProductDBHelper.LOCATION));
                product.setAuthorId(rs.getInt(1));
                product.setUnit(rs.getFloat(ProductDBHelper.UNIT));
                product.setUnitPrize(rs.getFloat(ProductDBHelper.UNIT_PRICE));
                product.setUnitSize(rs.getString(ProductDBHelper.UNIT_SIZE));
                product.setImage(rs.getString(ProductDBHelper.IMAGE));
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

}
