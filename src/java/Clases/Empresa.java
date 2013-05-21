/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mario
 */
public class Empresa extends Conexion{
    
    String NIT;
    String company;
    String email;
    String address;
    String Phone;
    String City;
    String Department;
    
    /**
     *
     * @param nit
     * @param company
     * @param email
     * @param address
     * @param phone
     * @param city
     * @param department
     */
    public Empresa()
    {
    
    }
    public Empresa(String nit, String company, String email, String address, String phone, String city, String department) //Constructor
    {
        //Set variables.
        this.NIT = nit;
        this.company = company;
        this.email = email;
        this.address = address;
        this.Phone = phone;
        this.City = city;
        this.Department = department;
    }
    
    public int agregarEmpresa()
    {
        int rows = 0;
        try {
            prestmt = conexion.prepareStatement("Insert into company values(?,?,?,?,?,?,?)");
            prestmt.setString(1, NIT);
            prestmt.setString(2, company);
            prestmt.setString(3, email);
            prestmt.setString(4, address);
            prestmt.setString(5, Phone);
            prestmt.setString(6, City);
            prestmt.setString(7, Department);
            rows = prestmt.executeUpdate();
        } catch (SQLException ex) {
            
        }
     return rows; //Regresa el número de filas afectadas.
    }
    
    public int actualizarEmpresa(String CompanyName, String Email, String Address, String Phone, String City, String Department, String NIT)
    {
        int rows = 0;
            try
            {
                prestmt = conexion.prepareStatement("Update company set CompanyName=?, Email=?, Address=?, Phone=?, City=?, Department=? where NIT=?");
                prestmt.setString(1, CompanyName);
                prestmt.setString(2, Email);
                prestmt.setString(3, Address);
                prestmt.setString(4, Phone);
                prestmt.setString(5, City);
                prestmt.setString(6, Department);
                prestmt.setString(7, NIT);
                
                rows= prestmt.executeUpdate();
            }
            catch(Exception e)
            {
                        
            }
        return rows;
    }
    
    public void getNITs() throws SQLException
    {
        String sql = "Select * from company";
        rs = stmt.executeQuery(sql);
    }
    
    public void getAllfields(String NIT)
    {
        try {
            prestmt = conexion.prepareStatement("Select * from company where NIT = ?");
            prestmt.setString(1, NIT);
            rs = prestmt.executeQuery();
        } catch (SQLException ex) {
            
        }
    }
}
