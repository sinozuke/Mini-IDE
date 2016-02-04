package BackEnd.Objects;

/**
 *
 * @author Songoku
 */
public class Proyecto {
    private String nombre;
    private String ruta;
    private String FechaC;
    private Archivo[] archs;

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

    public Archivo[] getArchs() {
        return archs;
    }

    public void setArchs(Archivo[] archs) {
        this.archs = archs;
    }
    
}