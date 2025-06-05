/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author Lawliez57
 */
public class JobDAO extends DBContext{
    
     private static JobDAO instance;

    public static JobDAO getInstance() {
        if (instance == null) {
            instance = new JobDAO();
        }
        return instance;
    }
    
    
    
}
