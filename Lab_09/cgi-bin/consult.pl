#!C:/xampp/perl/bin/perl.exe
use strict;
use warnings;
use CGI;
print "Content-type: text/html\n\n";
#cabecera de información
print <<HTML;
<!DOCTYPE html>
<html>
  <head> 
    <meta charset="utf-8"> 
    <link rel="stylesheet" type="text/css" href="../estilo.css">
    <title>Búsquedas bibliográficas de Programación Web 1 </title>
  </head>
<body>
HTML
my $query = CGI->new;
my $fields = $query->param("fields");
my $data = $query->param("data");

my $flag;
if(!($fields eq "") && !($data eq "")){
    open(IN, "../data/Programas de Universidades.csv") or die "<h1>ERROR: open file</h1>\n";
    while(my $line = <IN>){
        my %list = isMatchLine($line);
        my $value = $list{$fields};
        if($value && $value =~ /.*$data.*/){
            print "<h1>Encontrado:</h1>\n";
            print "<p>$line</p>";
            $flag = 1;
            next;
        }
    }
    close(IN);
}
if(!defined($flag)){
    print "<h1>No encontrado<h1>\n";
}
print <<HTML;
        <p>Ingrese <a href="../consulta.html">AQUI</a> para regresar al formulario de búsqueda</p>
    </body>
</html>
HTML


#function for found query;
#CODIGO_ENTIDAD|
#NOMBRE|
#TIPO_GESTION|ESTADO_LICENCIAMIENTO|
#PERIODO_LICENCIAMIENTO|
#CODIGO_FILIAL|NOMBRE_FILIAL|DEPARTAMENTO_FILIAL|
#PROVINCIA_FILIAL|CODIGO_LOCAL|
#DEPARTAMENTO_LOCAL|
#PROVINCIA_LOCAL|DISTRITO_LOCAL
#|LATITUD_UBICACION|LONGITUD_UBICACION|TIPO_AUTORIZACION_LOCAL|
#DENOMINACION_PROGRAMA|
#TIPO_NIVEL_ACADEMICO|NIVEL_ACADEMICO|CODIGO_CLASE_PROGRAMA_N2|
#NOMBRE_CLASE_PROGRAMA_N2|TIPO_AUTORIZACION_PROGRAMA|
#TIPO_AUTORIZACION_PROGRAMA_LOCAL
sub isMatchLine {
    my $line = $_[0];
    my %dict;

    if ($line =~ /(\d+)\|([^|]+)\|([^|]+)\|([^|]+)\|(\d+)\|(.{1})\|
                   (.+\-.+)\|
                   (.+)?\|(.+(\d+)$)\|([^|]+)\|([^|]+)\|(. +)\|
                   (\-\^\d+\.\d+\$){2}\|(. +)\|((. +)\.*$)\|
                   (. +)\|([^|]+)\|(. +)\|(\d+)\|(. +)\|((. +)\.*$)\|((. +))\.*$/x
    ) {
        $dict{"CODIGO_ENTIDAD"} = $1;
        $dict{"NOMBRE"} = $2;
        $dict{"TIPO_GESTION"} = $3;
        $dict{"ESTADO_LICENCIAMIENTO"} = $4;
        $dict{"PERIODO_LICENCIAMIENTO"} = $5;
        $dict{"CODIGO_FILIAL"} = $6;
        $dict{"NOMBRE_FILIAL"} = $7;
        $dict{"DEPARTAMENTO_FILIAL"} = $8;
        $dict{"PROVINCIA_FILIAL"} = $9;
        $dict{"CODIGO_LOCAL"} = $10;
        $dict{"DEPARTAMENTO_LOCAL"} = $11;
        $dict{"PROVINCIA_LOCAL"} = $12;
        $dict{"DISTRITO_LOCAL"} = $13;
        $dict{"LATITUD_UBICACION"} = $14;
        $dict{"LONGITUD_UBICACION"} = $15;
        $dict{"TIPO_AUTORIZACION_LOCAL"} = $16;
        $dict{"DENOMINACION_PROGRAMA"} = $17;
    } else {
        print "<h2>Error la linea no hace match:</h2>\n";
    }

    return %dict;
}
