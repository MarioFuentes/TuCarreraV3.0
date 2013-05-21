/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import javax.servlet.http.HttpSession;


public class Sesion {
    
    //Variables miembro
    private String Nombreusuario;
    private int Tipologin;
    private HttpSession Sesion;
 
    
    public Sesion(HttpSession Sesion)
    {
        this.Sesion = Sesion;
    }
    
    public Sesion( HttpSession Sesion, String Nombre, int Tipologin )
    {
        this.Sesion = Sesion;
        this.Nombreusuario = Nombre;
        this.Tipologin = Tipologin;
    }
    
    public void CrearSesion()
    {
        Sesion.setAttribute("NombreUsuario", Nombreusuario);
        Sesion.setAttribute("TipoLogin", Tipologin);
    }
    
    public int ObtenerTipoLogin()
    {
        if(Sesion.getAttribute("TipoLogin") != null)
        {
            return Integer.parseInt(Sesion.getAttribute("TipoLogin").toString());
        }
        else
        {
            return 0;
        }
    }
    
    public String ObtenerNombreUsuario()
    {
        if(Sesion.getAttribute("NombreUsuario") != null)
        {
            return (String)Sesion.getAttribute("NombreUsuario");
        }
        else
        {
            return "Sesion no iniciada";
        }
    }
    
    public void EliminarSesion()
    {
        Sesion.invalidate();
    }
}
