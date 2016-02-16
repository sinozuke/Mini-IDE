package BackEnd.Analizadores.usac;
import java_cup.runtime.Symbol;

import BackEnd.Objects.Token;
import java.util.Queue;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

%%
%cupsym simbolo
%class AnalizadorLexico_usac
%cup
%public
%unicode
%line
%column
%{
	public Queue coladetokens;

	public Queue colatokens(){
		return this.coladetokens;
	}
	
	private int contador;
	
	private void writeOutputFile() throws IOException{
		BufferedWriter out = new BufferedWriter(new FileWriter("file.out"));
		for(Object t: this.coladetokens){
			out.write(t + "\n");
		}
		out.close();
	}
%}

%init{
	contador=0;
%init}

%eof{
	try{
		this.writeOutputFile();
	}catch(IOException ioe){
		ioe.printStackTrace();
	}
%eof}

SALTO = \t|\r|\f|\n|\s
NUMERO = [0-9]+
CARACTER = [^\t\r\f\n\s]
COMENT = ([/][/] ([^\r\n])* \r|\n)|("#"[*] [^*]+ [*]"#")

%%
{SALTO}                         {System.out.println(new String("<font color=\"blue\">"+yytext()+"</font>"));}

//VERDE

{COMENT}                        {return new Symbol(simbolo.COMENT, yycolumn,yyline,new String("<font color=\"green\">"+yytext()+"</font><br>")); }

//AZUL OSCURO

"^"                             {return new Symbol(simbolo.POTENCIA, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"*"                             {return new Symbol(simbolo.POR, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"/"                             {return new Symbol(simbolo.DIVIDIDO, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"+"                             {return new Symbol(simbolo.MAS, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"-"                             {return new Symbol(simbolo.MENOS, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }

"++"                            {return new Symbol(simbolo.INCREMENTA, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"--"                            {return new Symbol(simbolo.DISMINUYE, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }

">"                             {return new Symbol(simbolo.MENORQ, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"<"                             {return new Symbol(simbolo.MAYORQ, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
">="                            {return new Symbol(simbolo.MENOROIQ, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"<="                            {return new Symbol(simbolo.MAYOROIQ, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"=="                            {return new Symbol(simbolo.IGUALA, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"!="                            {return new Symbol(simbolo.DISTINTOA, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"||"                            {return new Symbol(simbolo.O, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"??"                            {return new Symbol(simbolo.XOR, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"%%"                            {return new Symbol(simbolo.AND, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"!!"                            {return new Symbol(simbolo.NOT, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }    
"::="                           {return new Symbol(simbolo.ASIG, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }

//--------DATOS------------
//AZUL

"true"                          {return new Symbol(simbolo.VERD, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"false"                         {return new Symbol(simbolo.FALS, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }

//NARANJA

{NUMERO}                        {return new Symbol(simbolo.NUM, yycolumn,yyline,new String("<font color=\"orange\">"+yytext()+"</font>")); }

//ROJO

{NUMERO}+.{NUMERO}+             {return new Symbol(simbolo.DECIMAL, yycolumn,yyline,new String("<font color=\"red\">"+yytext()+"</font>")); }

//CAFE

"\""{CARACTER}+"\""             {return new Symbol(simbolo.CADENA, yycolumn,yyline,new String("<font color=\"brown\">"+yytext()+"</font>")); }
"'"{CARACTER}"'"                {return new Symbol(simbolo.CARACTER, yycolumn,yyline,new String("<font color=\"brown\">"+yytext()+"</font>")); }

//NEGRO

{CARACTER}+                     {return new Symbol(simbolo.IDEN, yycolumn,yyline,new String("<font color=\"black\">"+yytext()+"</font>")); }

//-----------FIN DATOS----------------

//MORADO CLARO

"importar"			{return new Symbol(simbolo.IMPORT, yycolumn,yyline,new String("<font color=\"purple\">"+yytext()+"</font>")); }
"clase"				{return new Symbol(simbolo.ClASS, yycolumn,yyline,new String("<font color=\"purple\">"+yytext()+"</font>")); }
"heredar"			{return new Symbol(simbolo.HERE, yycolumn,yyline,new String("<font color=\"purple\">"+yytext()+"</font>")); }

"publico"       		{return new Symbol(simbolo.PUBLIC, yycolumn,yyline,new String("<font color=\"purple\">"+yytext()+"</font>")); }
"privado"               	{return new Symbol(simbolo.PRIVATE, yycolumn,yyline,new String("<font color=\"purple\">"+yytext()+"</font>")); }
"protegido"                     {return new Symbol(simbolo.PROTECTED, yycolumn,yyline,new String("<font color=\"purple\">"+yytext()+"</font>")); }

//AZUL

"SI"				{return new Symbol(simbolo.IF, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"SINO_SI"			{return new Symbol(simbolo.ELSEIF, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"SINO"				{return new Symbol(simbolo.ELSE, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }

"INTERRUPTOR"                   {return new Symbol(simbolo.SWITCH, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"CASO"				{return new Symbol(simbolo.CASE, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"DEFECTO"			{return new Symbol(simbolo.DEFAULT, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }

"MIENTRAS"			{return new Symbol(simbolo.WHILE, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"HACER"				{return new Symbol(simbolo.DO, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"CONTINUAR"			{return new Symbol(simbolo.NEXT, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"SALIR"				{return new Symbol(simbolo.EXIT, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }

"super"				{return new Symbol(simbolo.SUPER, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"@Override"			{return new Symbol(simbolo.OVER, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"nuevo"				{return new Symbol(simbolo.NEW, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"retornar"			{return new Symbol(simbolo.RETURN, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"principal"			{return new Symbol(simbolo.MAIN, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }

"int"                           {return new Symbol(simbolo.INT, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"double"                        {return new Symbol(simbolo.DOU, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"string"                        {return new Symbol(simbolo.STR, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"char"                          {return new Symbol(simbolo.CH, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }
"bool"                          {return new Symbol(simbolo.B, yycolumn,yyline,new String("<font color=\"blue\">"+yytext()+"</font>")); }

//NEGRO

"("				{return new Symbol(simbolo.PINI, yycolumn,yyline,new String("<font color=\"black\">"+yytext()+"</font>")); }
")"				{return new Symbol(simbolo.EOP, yycolumn,yyline,new String("<font color=\"black\">"+yytext()+"</font>")); }
";"				{return new Symbol(simbolo.EOSEN, yycolumn,yyline,new String("<font color=\"black\">"+yytext()+"</font>")); }
":"                             {return new Symbol(simbolo.DP, yycolumn,yyline,new String("<font color=\"black\">"+yytext()+"</font>")); }
","                             {return new Symbol(simbolo.COMA, yycolumn,yyline,new String("<font color=\"black\">"+yytext()+"</font>")); }
"["                             {return new Symbol(simbolo.CINI, yycolumn,yyline,new String("<font color=\"black\">"+yytext()+"</font>")); }
"]"                             {return new Symbol(simbolo.EOC, yycolumn,yyline,new String("<font color=\"black\">"+yytext()+"</font>")); }

//ERROR

.                               {System.out.println("Error lexico: "+yytext());}