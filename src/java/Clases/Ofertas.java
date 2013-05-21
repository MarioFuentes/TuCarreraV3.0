/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.SQLException;

/**
 *
 * @author Doda
 */
public class Ofertas extends Conexion
{
    String NIT_fk;
    int IdPosition_fk;
    int ExperienceYears;
    String Specialization;
    String Qualifications;
    
    public Ofertas(String NIT_fk, int IdPosition_fk, int ExperienceYears, String Specialization, String Qualifications)
    {
        this.NIT_fk = NIT_fk;
        this.IdPosition_fk = IdPosition_fk;
        this.ExperienceYears = ExperienceYears;
        this.Specialization = Specialization;
        this.Qualifications = Qualifications;
    }
    
    public int agregarOferta()
    {
        int rows = 0;
        try {
            prestmt = conexion.prepareStatement("Insert into joboffer values(?,?,?,?,?)");
            prestmt.setString(1, NIT_fk);
            prestmt.setInt(2, IdPosition_fk);
            prestmt.setInt(3, ExperienceYears);
            prestmt.setString(4, Specialization);
            prestmt.setString(5, Qualifications);
            rows = prestmt.executeUpdate();
        } catch (SQLException ex) {
            
        }
     return rows; //Regresa el número de filas afectadas.
    }
    
    public void getOfertas() throws SQLException
    {
        String sql = "select j.*, c.CompanyName, p.PositionName from joboffer as j inner join company as c on j.NIT_fk=c.NIT inner join positiontable as p on j.IdPosition_fk=p.IdPosition";
        rs = stmt.executeQuery(sql);
    }
}
