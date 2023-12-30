#!C:/xampp/perl/bin/perl.exe
use strict;
use warnings;
use CGI;
print "Content-type: text/html\n\n";
my $q = CGI->new;
my $expression = $q->param('expression');
if($expression){
    if ($expression =~ /(\d+)\+(\d+)/) {
        my $numero1 = $1;
        my $numero2 = $2;
        my $resultado = $numero1 + $numero2;
        print "Es una suma. El resultado es: $resultado";
    } else {
        print "No es una suma";
    }
} else {
    print "Ingresa algo";
}