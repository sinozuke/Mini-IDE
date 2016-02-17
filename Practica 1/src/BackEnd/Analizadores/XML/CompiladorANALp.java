/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BackEnd.Analizadores.XML;

import BackEnd.Objects.*;
import java.io.File;
import java.io.IOException;
import java.io.StringReader;

/**
 *
// * @author Songoku
 */
public class CompiladorANALp {
    private final static String[] archlex={"C:\\Users\\Songoku\\Documents\\NetBeansProjects\\Mini-IDE\\Practica 1\\src\\BackEnd\\Analizadores\\XML\\Scanner2.jflex"};
    private static File arch;
//    public static void main(String[] args){
//        compilar();
//    }

    public void imprimir(StringReader texto) throws IOException, Exception{
            Scanner2 scan = new Scanner2(texto);
            Sintactico2 sintac = new Sintactico2(scan);
            sintac.parse();
            
    }
    
    public void CrearNodos(){
    
    
    }
    
    public void GuardarPro(){
        Proyecto proyecto= new Proyecto();
        
    
    
    }
    
    public static void compilar(){
        jflex.Main.main(archlex);    
        arch = new File("AnalizadorLexico_exp.java");
    }

}
