#!C:/xampp/perl/bin/perl.exe
#Cree un CGI que muestre el nombre del actor cuyo ID es 5 (antes se deberia haberlo insertado)

use strict;
use warnings;
use CGI;
use DBI;
#Maria DB
my $user = 'root';
my $password ='Alissonj-20';
my $dsn = "DBI:MariaDB:database=pweb;host=127.0.0.1";
my $dbh =DBI->connect($dsn, $user, $password) or die ("could not connect!");
#Consultas al SGBD
my $id = 5;
#operar consultas
my $sth = $dbh->prepare("SELECT * FROM customer WHERE id=?");
#prepare recibira 1 o mas registros (name, id, borthDate)
# ?:valor proporcionado mas tarde
$sth->execute($id);
#recibira los parametros de la consulta y ejecutara
#fetchrow_array : recibira los valores de la consulta como array
while (my @row = $sth->fetchrow_array) {
    print "@row\n";
}
$sth->finish;
$dbh->disconnect;