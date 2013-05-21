/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.SQLException;

/**
 *
 * @author Mario
 */
public class Grado extends Conexion {
    public void getGrados() throws SQLException
    {
        String sql = "Select * from degree";
        rs = stmt.executeQuery(sql);
    }
}
