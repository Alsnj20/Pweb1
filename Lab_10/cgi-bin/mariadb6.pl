#!C:/xampp/perl/bin/perl.exe
use strict;
use warnings;
use CGI;
use DBI;
#Maria DB
my $query = CGI->new;
$query->charset("UTF-8");
#MariaDB
my $year = 1985;

my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.56.101";
my $dbh =DBI->connect($dsn, $user, $password) or die ("could not connect!");

my $sth = $dbh->prepare("INSERT INTO Actor(ActorId, Name) VALUES (5, 'Emma Watson')");
$sth->execute();

$sth->finish;
$dbh->disconnect;