#Cree un formulario que reciba un año y llame a un CGI que muestre todas las películas del año dado.
#!C:/xampp/perl/bin/perl.exe
use strict;
use warnings;
use CGI;
use DBI;
#Maria DB
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
HTML
my $year = $query->param('year');

my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.56.101";
my $dbh =DBI->connect($dsn, $user, $password) or die ("could not connect!");

my $sth = $dbh->prepare("SELECT * FROM Movie WHERE Year=$year");
$sth->execute();

#CGI
print <<HTML;
    <body style="display:inline; font-family: Arial, sans-serif; text-align: center;">
        <h1>Buscando pelicula estrenada $year</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>TITLE</th>
                <th>YEAR</th>
                <th>SCORE</th>
                <th>VOTES</th>
            </tr>
HTML
my @row = $sth->fetchrow_array;

if(@row){
    fillTable(@row);
    while (@row = $sth->fetchrow_array) {
        fillTable(@row);
    }
}else{
    print "<p>NO EXISTE</p>\n";
}

$sth->finish;
$dbh->disconnect;
print <<HTML;
    </table>
    </body>
</html>
HTML

sub fillTable{
    my @row = @_;
    print "<tr>\n";
    foreach my $cel (@row){
        print "<td>$cel</td>\n";
    }
    print "</tr>\n";
}