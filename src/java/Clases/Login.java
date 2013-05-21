/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.*;

public class Login extends Conexion{

    private String Usuario;
    private String Password;
    
    public Login(String User, String Pass)
    {
        this.Usuario = User;
        this.Password = Pass;
    }
    
    public int VerificarLogin() throws SQLException
    {
      String sql="SELECT * FROM logintable WHERE Username_fk = ? AND Password = ?";
      prestmt = conexion.prepareStatement(sql);
      prestmt.setString(1,Usuario);
      prestmt.setString(2,Password);
      rs = prestmt.executeQuery();      
      rs.last();
      int fila = rs.getRow(); 
      if( fila > 0)
      {
          return 1;
      }
      else
      {
          return 0;
      }
      
    }
    
}
