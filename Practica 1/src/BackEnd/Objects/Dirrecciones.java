/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BackEnd.Objects;

import java.io.File;
import java.util.ArrayList;

/**
 *
 * @author Songoku
 */
public class Dirrecciones {
    public static String NombreP;
    public static String nombreinterno;
    public static String Fecha;
    public static ArrayList<String> Dirreciones;
    public static ArrayList<String[]> nodos;
    public static String pathPractica;
    
    public boolean esta(String Dirrecion){
        return Dirreciones.contains(Dirrecion);
    }
    
    public static boolean existepro(){
        File carpeta = new File(pathPractica.replaceAll(".practica1", "\\\\"));
        return carpeta.exists();
    }
    
    public static void dividir(){
        for(String dire : Dirreciones){
            String[] nodo = dire.split("/");
            nodos.add(nodo);
        }
    }
}
