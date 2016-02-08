//Seccion de Codigo Usuario
package BackEnd.Analizadores.XML;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;


//Clase de Yytoken
class Yytoken{
	
    //Metodos de los atributos de la clase
    private final int numToken;
    private final String token;
    private final String tipo;
    private final int linea;
    private final int column;
	
    //Constructor para asignar Atibutos al token
    Yytoken(int numToken, String token, String tipo, int linea, int column) {
        this.numToken = numToken;
        this.token = token;
        this.tipo = tipo;
        this.linea = linea;
        this.column = column;
    }
    
    //Funciones para obtener los atributos del token
    public int getNumToken() {
        return numToken;
    }
    public String getToken() {
        return token;
    }
    public String getTipo() {
        return tipo;
    }
    public int getLinea() {
        return linea;
    }
    public int getColumn() {
        return column;
    }
}



%% //inicio de opciones jflex
//nombre devolucion de siguiente token
%function nextToken
//declaracion de clase publica
%public
//especificamos el nombre de la nueva clase
%class AnalizadorLexico_exp
//agregamos soporte unicode
%unicode

//codigo java

%{
	private int contador;
	private ArrayList<Yytoken> tokens;
	
	private void writeOutputFile() throws IOException{
		BufferedWriter out = new BufferedWriter(new FileWriter("file.out"));
		for(Yytoken T: this.tokens){
			out.write(T + "\n");
		}
		out.close();
	}
%}
//crear contador para los tokens
%init{
	contador=0;
	tokens = new ArrayList<Yytoken>();
%init}
//codigo de ejecucion al final del archivo
%eof{
	try{
		this.writeOutputFile();
	}catch(IOException ioe){
		ioe.printStackTrace();
	}
%eof}
//Activar contador de lineas de variable yyline
%line
//Activar contador de columnas de variable yycolumn
%column
//Fin de Opciones

//Expreciones Regulares

//Declaraciones

SALTO=\n|\r|\r\n
SPACE=" "

EXP_ALPHA=[A-Za-z]
EXP_DIGITO=[0-9]
D="/"
G="-"
NUMERO={EXP_DIGITO}+


IDENTIFICADOR={EXP_ALPHA}+
FECHA={NUMERO}{G}{IDENTIFICADOR}{G}{NUMERO}
CADENA=\"[^SALTO]*\"


//fin de declaraciones

/*  SECCION DE REGLAS LEXICAS  */
%%
//Regla {Accion}

"<proyecto>"	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"inip",yyline,yycolumn);
		tokens.add(T);
		return T;
}
"</proyecto>"	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"eop",yyline,yycolumn);
		tokens.add(T);
		return T;
}
"<nombre>"	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"ininombre",yyline,yycolumn);
		tokens.add(T);
		return T;
}
"</nombre>"	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"eonombre",yyline,yycolumn);
		tokens.add(T);
		return T;
}
"<fecha_creacion>"	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"inifc",yyline,yycolumn);
		tokens.add(T);
		return T;
}
"</fecha_creacion>"	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"eofc",yyline,yycolumn);
		tokens.add(T);
		return T;
}
"<archs>"	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"inias",yyline,yycolumn);
		tokens.add(T);
		return T;
}

"</archs>"	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"eoas",yyline,yycolumn);
		tokens.add(T);
		return T;
}

"<archivo>"	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"inia",yyline,yycolumn);
		tokens.add(T);
		return T;
}
"</archivo>"	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"eoa",yyline,yycolumn);
		tokens.add(T);
		return T;
}

"<ruta>"	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"inir",yyline,yycolumn);
		tokens.add(T);
		return T;
}
"</ruta>"	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"eor",yyline,yycolumn);
		tokens.add(T);
		return T;
}

{CADENA}	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"cadena",yyline,yycolumn);
		tokens.add(T);
		return T;
}

{FECHA}	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"date",yyline,yycolumn);
		tokens.add(T);
		return T;
}
{SPACE}	{
	//ignora
}
{SALTO}	{
		contador++;
		Yytoken T = new Yytoken(contador,yytext(),"EOL",yyline,yycolumn);
		tokens.add(T);
		return T;	
}