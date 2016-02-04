package BackEnd.Objects;

/**
 *
 * @author Songoku
 */

public class Archivo {
    private String nombre;
    private String ruta;
    private boolean compilado;
    private String inforuta;

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

    public boolean isCompilado() {
        return compilado;
    }

    public void setCompilado(boolean compilado) {
        this.compilado = compilado;
    }

    public String getInforuta() {
        return inforuta;
    }

    public void setInforuta(String inforuta) {
        this.inforuta = inforuta;
    }
    
}