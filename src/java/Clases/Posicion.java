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
public class Posicion extends Conexion {
    public void getPosiciones() throws SQLException
    {
        String sql = "Select * from positiontable";
        rs = stmt.executeQuery(sql);
    }
}
