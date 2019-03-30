/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Siam
 */
public class DatabaseConnector {

    private static DatabaseConnector connector = new DatabaseConnector();
    private final static String DATABASE_HOST = "jdbc:mysql://localhost:3306/";
    private final static String DATABASE_NAME = "Hatbazar";
    private final static String DATABASE_USER_NAME = "root";
    private final static String DATABASE_PASSWORD = "root";
    private final static String EXIST_CHECK = "CREATE TABLE IF NOT EXISTS ";

    private final static String DATABASE_CREATE_COMMAND = "CREATE DATABASE IF NOT EXISTS " + DATABASE_NAME;
    private final static String TABLE_CREATION_COMMAND_USER = "CREATE TABLE IF NOT EXISTS `user` ("
            +UserDBHelper.ID +" int(20) NOT NULL AUTO_INCREMENT,"
            +UserDBHelper.NAME + " varchar(50) NOT NULL,"
            +UserDBHelper.PHONE_NUMBER + " varchar(15) DEFAULT NULL,"
            +UserDBHelper.PASSWORD + " varchar(255) NOT NULL,"
            +UserDBHelper.ACC_TYPE + " varchar(20) NOT NULL,"
            +UserDBHelper.RATE + " float(20) NOT NULL,"
            + "  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,"
            + "  PRIMARY KEY ("+UserDBHelper.ID+")"
            + ")";
     private final static String TABLE_CREATION_COMMAND_PRODUCT = EXIST_CHECK +  ProductDBHelper.TABLE_NAME+ " ("
            + ProductDBHelper.ID+" int(20) NOT NULL AUTO_INCREMENT,"
            + ProductDBHelper.NAME+ " varchar(50) NOT NULL,"
            + ProductDBHelper.CATEGORY+ " varchar(50) NOT NULL,"
            + ProductDBHelper.TYPE+ " varchar(50) NOT NULL,"
            + ProductDBHelper.UNIT+ " int(100) DEFAULT NULL,"
            + ProductDBHelper.UNIT_PRICE+ " float NOT NULL,"
            + ProductDBHelper.UNIT_SIZE+ " varchar(100) NOT NULL,"
            + ProductDBHelper.VIEW+ " int(20) NOT NULL,"
            + ProductDBHelper.DESCRIPTION+ " varchar(255) NOT NULL,"
            + ProductDBHelper.LOCATION+ " varchar(255) NOT NULL,"
            + ProductDBHelper.AUTHOR_ID+ " int(20) NOT NULL,"
            + ProductDBHelper.IMAGE+ " varchar(255) NOT NULL,"
            + "  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,"
            + "  PRIMARY KEY (`id`)"
            + ")";
     private final static String TABLE_CREATION_COMMAND_FAVOURITE = EXIST_CHECK +  FavouriteDBHelper.TABLE_NAME+ " ("
            + FavouriteDBHelper.ID+" int(20) NOT NULL AUTO_INCREMENT,"
            + FavouriteDBHelper.CID+ " int(50) NOT NULL,"
            + FavouriteDBHelper.PID+ " int(50) NOT NULL,"
            + "  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,"
            + "  PRIMARY KEY (`id`)"
            + ")";
    

    private DatabaseConnector() {
    }
    public static void main(String[] args) {
    }
    public Connection getConnection() {
        //singleto pattern

        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(DATABASE_HOST,
                    DATABASE_USER_NAME, DATABASE_PASSWORD);
            Statement statement = connection.createStatement();

            statement.executeUpdate(DATABASE_CREATE_COMMAND);

            connection = (Connection) DriverManager.getConnection(DATABASE_HOST + DATABASE_NAME,
                    DATABASE_USER_NAME, DATABASE_PASSWORD);
            statement = connection.createStatement();

            statement.executeUpdate(TABLE_CREATION_COMMAND_USER);
            statement.executeUpdate(TABLE_CREATION_COMMAND_PRODUCT);
            statement.executeUpdate(TABLE_CREATION_COMMAND_FAVOURITE);
            

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnector.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
        return connection;
    }

    public static DatabaseConnector getIsntance() {
        return connector;
    }
}
