/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BackEnd.Objects;

import java.util.ArrayList;

/**
 *
 * @author Songoku
 */
public class Carpeta {
    
    private String nombre;
    private ArrayList<Archivo> archs;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void AArch(Archivo arch){
        archs.add(arch);
    }

    public ArrayList<Archivo> getArchs() {
        return archs;
    }
    
}
