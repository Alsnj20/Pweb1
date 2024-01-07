#Cree un CGI que muestre una tabla, con todas las películas con puntaje mayor a 7 y más de 5000 votos.
#!C:/xampp/perl/bin/perl.exe
use strict;
use warnings;
use CGI;
use DBI;
#Maria DB
my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.56.101";
my $dbh =DBI->connect($dsn, $user, $password) or die ("could not connect!");


my $sth = $dbh->prepare("SELECT * FROM Movie WHERE Score>=7 AND Votes>=5000");
$sth->execute();

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
        <h1>Buscando películas con puntaje mayor a 7 y más de 5000 votos</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>TITLE</th>
                <th>YEAR</th>
                <th>SCORE</th>
                <th>VOTES</th>
            </tr>
HTML
while (my @row = $sth->fetchrow_array) {
    print "<tr>\n";
    foreach my $cel (@row){
        print "<td>$cel</td>\n";
    }
    print "</tr>\n";
}
$sth->finish;
$dbh->disconnect;
print <<HTML;
    </table>
    </body>
</html>
HTML