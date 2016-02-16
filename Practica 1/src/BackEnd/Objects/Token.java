/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BackEnd.Objects;
/**
 *
 * @author Songoku
 */
public class Token {
   
    private final String lexema;
    private final int reporte;
    private final int linea;
    private final int columnas;
    private final String Descripcion;

    public Token(String lexema, int reporte, int linea, int columnas, String Descripcion) {
        this.lexema = lexema;
        this.reporte = reporte;
        this.linea = linea;
        this.columnas = columnas;
        this.Descripcion = Descripcion;
    }

    public String getLexema() {
        return lexema;
    }

    public int getReporte() {
        return reporte;
    }

    public int getLinea() {
        return linea;
    }

    public int getColumnas() {
        return columnas;
    }

    public String getDescripcion() {
        return Descripcion;
    }
    
}
