#!C:/xampp/perl/bin/perl.exe
#Cree un CGI que muestre el nombre del actor cuyo ID es 5 (antes se deberia haberlo insertado)
use strict;
use warnings;
use CGI;
use DBI;
#Maria DB
my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.56.101";
my $dbh =DBI->connect($dsn, $user, $password) or die ("could not connect!");
#Consultas al SGBD
my $id_Actor = 5;
#operar consultas
my $sth = $dbh->prepare("SELECT * FROM Actor WHERE ActorId=?");
#prepare recibira 1 o mas registros (name, id, borthDate)
# ?:valor proporcionado mas tarde
$sth->execute($id_Actor);
#recibira los parametros de la consulta y ejecutara
#fetchrow_array : recibira los valores de la consulta como array
my @row = $sth->fetchrow_array;
$sth->finish;
$dbh->disconnect;

#CGI
my $query = CGI->new;
$query->charset("UTF-8");
print $query->header("text/html");

print <<HTML;
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <title>sortAutor</title>
    </head>
    <body style="display:inline; font-family: Arial, sans-serif; text-align: center;">
HTML

if (@row) {
    print <<HTML;
        <h1>Buscando...autor con id = 5</h1>
        <table>
        <tr>
        <th>ID</th>
        <th>NOMBRE DEL AUTOR</th>
        </tr>
        <tr>
        <td>$row[0]</td>
        <td>$row[1]</td>
        </tr>
        </table>
HTML
} else {
    print "<p>No se encontraron resultados para el ID $id_Actor</p>\n";
}

print <<HTML;
    </body>
</html>
HTML




