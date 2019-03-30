/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.beans.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class UserDBHelper {

    public static String DB_NAME = "user";
    public static String ID = "id";
    public static String NAME = "name";
    public static String PHONE_NUMBER = "phone_number";
    public static String PASSWORD = "password";
    public static String RATE = "ratting";
    public static String ACC_TYPE = "account_type";
    public static String COMMA = ", ";

    static DatabaseConnector dbConnector = DatabaseConnector.getIsntance();
    static Connection connection;
    static PreparedStatement statement;
    static ResultSet resultSet;

    public static void main(String[] args) {
        User user = new User();
        user.setName("Zahir Uddin");
        user.setPhoneNumber("0175345613");
        user.setPassword("01712");
        user.setAccType("Seller");
        System.out.println(save(user));

        
    }

    public static int save(User user) {
        int status = 0;

        try {
            connection = dbConnector.getConnection();
            statement = connection.prepareStatement("select phone_number from user where phone_number=?");
            statement.setString(1, user.getPhoneNumber());
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                status = -1;
            } else {

                statement = connection.prepareCall("INSERT INTO " + DB_NAME + "("
                        + NAME + COMMA
                        + PHONE_NUMBER + COMMA
                        + PASSWORD + COMMA
                        + ACC_TYPE + COMMA
                        + RATE
                        + ") values(?,?,?,?,?)");
                statement.setString(1, user.getName());
                statement.setString(2, user.getPhoneNumber());
                statement.setString(3, user.getPassword());
                statement.setString(4, user.getAccType());
                statement.setFloat(5, 0);
                status = statement.executeUpdate();

            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    public static int login(String phoneNumber, String password) {
        int status = 0;
        connection = dbConnector.getConnection();

        try {
            String command = "select phone_number ,password from " + DB_NAME + " where " + PHONE_NUMBER + "=? and password=?";
            statement = connection.prepareStatement(command);

            statement.setString(1, phoneNumber);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                status = 1;
                System.out.println("Valid login credentials");
            } else {
                System.out.println("Invalid login credentials");
            }

        } catch (Exception ex) {
            Logger.getLogger(UserDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDBHelper.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }

        return status;
    }
    
    public static User getByPhoneNumber(String phoneNumber){
            User user = new User();
            connection = dbConnector.getConnection();
        try {
            statement = connection.prepareCall("SELECT * FROM user WHERE "+PHONE_NUMBER+" = ?");
            statement.setString(1, phoneNumber);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {                
                user.setId(resultSet.getInt(ID));
                user.setName(resultSet.getString(NAME));
                user.setPhoneNumber(resultSet.getString(PHONE_NUMBER));
                user.setAccType(resultSet.getString(ACC_TYPE));
                
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
            return user;
    }
     public static User getById(int id){
            User user = new User();
            connection = dbConnector.getConnection();
        try {
            statement = connection.prepareCall("SELECT * FROM user WHERE "+ID+" = ?");
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {                
                user.setId(resultSet.getInt(ID));
                user.setName(resultSet.getString(NAME));
                user.setPhoneNumber(resultSet.getString(PHONE_NUMBER));
                user.setAccType(resultSet.getString(ACC_TYPE));
                
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
            return user;
    }

}
