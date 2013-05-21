/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Date;
import java.sql.SQLException;

/**
 *
 * @author Mario
 */
public class Trabajador extends Conexion{
    String DUI; //
    String FirstName;
    String LastName;
    String Email;
    String Address;
    String Phone;
    String City;
    String Department;
    String Gender;
    String Birthdate; //
    int Degree;
    String University;
    String SpecializationField;
    int Position;

    
    public Trabajador()
    {}
    public Trabajador(String DUI, String FirstName, String LastName, String Email, String Address, String Phone, String City, String Department, String Gender, String Birthdate, int Degree, String University, String SpecializationField, int Position)
    {
        this.DUI = DUI;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Email = Email;
        this.Address = Address;
        this.Phone = Phone;
        this.City = City;
        this.Department = Department;
        this.Gender = Gender;
        this.Birthdate = Birthdate;
        this.Degree = Degree;
        this.University = University;
        this.SpecializationField = SpecializationField;
        this.Position = Position;
    }
    
    public int agregarTrabajador()
    {
        int rows = 0;
            try {
            prestmt = conexion.prepareStatement("Insert into jobseeker values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            prestmt.setString(1, DUI);
            prestmt.setString(2, FirstName);
            prestmt.setString(3, LastName);
            prestmt.setString(4, Email);
            prestmt.setString(5, Address);
            prestmt.setString(6, Phone);
            prestmt.setString(7, City);
            prestmt.setString(8, Department);
            prestmt.setString(9, Gender);
            
            //Formatear fecha
            String[] fechapedazos = Birthdate.split("/");
            String dia = fechapedazos[0];
            String mes = fechapedazos[1];
            String year = fechapedazos[2];
            
            String fechaformato = year + "-" + mes + "-" + dia;
                    
            prestmt.setDate(10, Date.valueOf(fechaformato));
            prestmt.setInt(11, Degree);
            prestmt.setString(12, University);
            prestmt.setString(13, SpecializationField);
            prestmt.setInt(14, Position);
            rows = prestmt.executeUpdate();
        } catch (SQLException ex) {
        
    }
            return rows;
    }
            
    public void getTrabajadores() throws SQLException
    {
        String sql = "Select * from jobseeker";
        rs = stmt.executeQuery(sql);
    }
    
}

