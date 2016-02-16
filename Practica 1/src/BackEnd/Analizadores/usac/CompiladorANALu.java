/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BackEnd.Analizadores.usac;

import java.io.File;
/**
 *
 * @author Songoku
 */


public class CompiladorANALu {
    private final static String[] archlex={"C:\\Users\\Songoku\\Documents\\NetBeansProjects\\Mini-IDE\\Practica 1\\src\\BackEnd\\Analizadores\\usac\\Analex-usacf.flex"};
    private static File arch;

//    public static void main(String[] args){
//        compilar();
//    }
    
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
