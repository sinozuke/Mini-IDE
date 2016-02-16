package BackEnd.Analizadores.XML;
import java_cup.runtime.Symbol;
%%
%cupsym Simbolo2
%class Scanner2
%cup
%public
%unicode
%line
%column
%ignorecase

cadena = [\"] ([^\n\r\r\n\s])* [\"]  
ruta = [\"] "/" ([^\n\r\r\n\s])* ".usac" [\"]
Meses = "enero" | "febrero" | "marzo" | "abril" | "mayo" | "junio" | "julio" | "agosto" | "septiembre" | "octubre" | "noviembre" | "diciembre"
Fecha = [0-9][0-9] [\-] {Meses} [\-] [0-2][0-9][0-9][0-9]
%%

"<proyecto>"              	{return new Symbol(Simbolo2.Proyectoi, yycolumn,yyline,yytext()); }
"</proyecto>"              	{return new Symbol(Simbolo2.Proyectof, yycolumn,yyline,yytext()); }
"<nombre>"              	{return new Symbol(Simbolo2.Nombrei, yycolumn,yyline,yytext()); }
"</nombre>"              	{return new Symbol(Simbolo2.Nombref, yycolumn,yyline,yytext()); }
"<fecha_creacion>"         	{return new Symbol(Simbolo2.Fechai, yycolumn,yyline,yytext()); }
"</fecha_creacion>"        	{return new Symbol(Simbolo2.Fechaf, yycolumn,yyline,yytext()); }
"<archs>"              		{return new Symbol(Simbolo2.Archsi, yycolumn,yyline,yytext()); }
"</archs>"              	{return new Symbol(Simbolo2.Archsf, yycolumn,yyline,yytext()); }
"<archivo>"              	{return new Symbol(Simbolo2.Archivoi, yycolumn,yyline,yytext()); }
"</archivo>"              	{return new Symbol(Simbolo2.Archivof, yycolumn,yyline,yytext()); }
"<ruta>"	              	{return new Symbol(Simbolo2.rutai, yycolumn,yyline,yytext()); }
"</ruta>"	              	{return new Symbol(Simbolo2.rutaf, yycolumn,yyline,yytext()); }
{Fecha}				{return new Symbol(Simbolo2.Fecha, yycolumn,yyline,yytext()); }
{ruta}				{return new Symbol(Simbolo2.Ruta, yycolumn,yyline,yytext()); }
{cadena}			{return new Symbol(Simbolo2.Cadena, yycolumn,yyline,yytext()); }


[ \t\r\f\n\s]+		{}
.					{System.out.println("Error lexico: "+yytext());}
