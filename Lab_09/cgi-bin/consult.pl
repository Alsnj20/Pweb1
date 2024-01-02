#!C:/xampp/perl/bin/perl.exe
binmode(STDOUT, ":utf8"); #perl entre el archivo con charset utf-8
use strict;
use warnings;
use CGI;
#cabecera de información
print "Content-type: text/html\n\n";
print <<HTML;
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <head> 
    <link rel="stylesheet" type="text/css" href="../estilo.css">
    <title>Búsqueda de Universidades Licenciadas</title>
  </head>
<body>
HTML
my $query = CGI->new;
print "INGRESE VARIABLE";
my $fields = <STDIN>;
my $data = <STDIN>;

my $flag;

if(!($fields eq "") && !($data eq "")){
open(IN, "../data/file.txt") or die "<h1>ERROR: open file</h1>\n";
    print "<p>Iniciando archivo</p>\n";
    while(my $line = <IN>){
        print "$line\n";
        my %list = isMatchLine($line);
        print "$list{"$fields"}\n";
        my $value = $list{$fields};
        print "HOLA $value como estas\n";
        if(defined($value) && $value =~ /.*$data.*/){
            print "<h1>Encontrado:</h1>\n";
            print "<p>$line</p>";
            $flag = 1;
            next;
        }
    }
    close(IN);
}
if(!defined($flag)){
    print "<h1>No encontrado</h1>\n";
}
print <<HTML;
        <p>Ingrese <a href="../consulta.html">AQUI</a> para regresar al formulario de búsqueda</p>
    </body>
</html>
HTML

sub isMatchLine {
    my $line = $_[0];
    my %dict;

    if ($line =~ /^(\d+)\|([^|]+)\|.+/) {
        $dict{"CODIGO_ENTIDAD"} = $1;
        print "$1\n";
        $dict{"name"} = $2;
        print "$2\n";
    }
    return %dict;
}
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

