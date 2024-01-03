#!C:/xampp/perl/bin/perl.exe
#perl entre el archivo con charset utf-8
use strict;
use warnings;
use CGI;
#cabecera de información

my $query = CGI->new;
#my $fields = "CODIGO_ENTIDAD";
#my $data = "065";

my $fields = $query->param("fields");
my $data = $query->param("data");
$query->charset("UTF-8");
print ($query->header("text/html"));
print <<HTML;
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <head> 
    <link rel="stylesheet" type="text/css" href="../estilo.css">
    <title>Búsqueda de Universidades Licenciadas</title>
    </head>
<body>
HTML

my $flag;
if(!($fields eq "") && !($data eq "")){
open(IN, "../data/Programas de Universidades.csv") or die "<h1>ERROR: open file</h1>\n";
    print "<p>Iniciando archivo</p>\n";
    <IN>;
    my %map = ("CODIGO_ENTIDAD" => 0, "NOMBRE" => 1, "PERIODO_LICENCIAMIENTO" => 2,
    "DEPARTAMENTO_LOCAL" => 3, "DENOMINACION_PROGRAMA" => 4);
    print "<table>\n";
    print <<HTML;
    <tr> 
    <th>CODIGO ENTIDAD</th>
    <th>NOMBRE</th>
    <th>PERIODO DE LICENCIAMIENTO</th>
    <th>DEPARTAMENTO LOCAL</th>
    <th>DENOMINACIÓN PROGRAMA</th>
    </tr>
HTML
    while(my $line = <IN>){
        my @list = isMatchLine($line);
        my $value = $list[$map{$fields}];
        if($value && $value eq $data){
            print "<tr>\n";
            foreach my $n(@list){
                print "<td>$n</td>\n";
            }
            print "</tr>\n";
            $flag = 1;
        }
    }
    close(IN);
}
print "</table>\n";
if(!$flag){
    print "<h1>No encontrado</h1>\n";
}

print <<HTML;
        <p>Ingrese <a href="../consulta.html">AQUI</a> para regresar al formulario de búsqueda</p>
    </body>
</html>
HTML

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
#function for found query;
sub isMatchLine {
    my $line = $_[0];
    my @arr;
    if($line =~ /(.+?)\|(.+?)\|(?:.+?\|){2}(.+?)\|(?:.+?\|){5}(.+?)\|(?:.+?\|){5}(.+?)\|/){
        @arr = ($1, $2, $3, $4, $5);
    }
    return @arr;
}


