package Clases;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.sql.*;

public class Conexion 
{
MysqlDataSource datasource;
    Connection conexion;
    Statement stmt;
    protected PreparedStatement prestmt;
    public ResultSet rs;
    
    public String estado = "";

    public Conexion()
    {
        datasource = new MysqlDataSource();
        datasource.setUser("root");
        datasource.setPassword("");
        datasource.setDatabaseName("tucarreradb");
        datasource.setServerName("localhost");
        
        try {
            conexion = datasource.getConnection();
            stmt = conexion.createStatement();
            estado = "Conectado";
        } catch (SQLException ex) {
            estado = ex.getMessage();
        }
    }
    
    public void desconectar() throws SQLException
    {
        conexion.close();
    }
}