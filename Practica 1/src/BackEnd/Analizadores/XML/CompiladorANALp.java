/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BackEnd.Analizadores.XML;

import java.io.File;
import java.io.IOException;

/**
 *
 * @author Songoku
 */
public class CompiladorANALp {
    private final static String[] archlex={"C:\\Users\\Songoku\\Documents\\NetBeansProjects\\Mini-IDE\\Practica 1\\src\\BackEnd\\Analizadores\\XML\\Analex-xml.flex"};
    private static File arch;

/*
    
    public static void main(String[] args){
        compilar();
    }

*/
    
    public static void compilar(){
        jflex.Main.main(archlex);    
        arch = new File("AnalizadorLexico_exp.java");
    }

    //Posiblemente implentacion de generacion de nuevo analizador lexico
    
/*    
    public void mover(){
        if(arch.exists()){
            
        } else {
            
        }    
    }    
*/
}
