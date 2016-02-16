package BackEnd.Objects;

import java.util.ArrayList;

/**
 *
 * @author Songoku
 */
public class Proyecto {
    private String nombre;
    private String ruta;
    private String FechaC;
    private ArrayList<Carpeta> carps;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public String getFechaC() {
        return FechaC;
    }

    public void setFechaC(String FechaC) {
        this.FechaC = FechaC;
    }
    
    public void AC(Carpeta carp){
        carps.add(carp);
    }

}