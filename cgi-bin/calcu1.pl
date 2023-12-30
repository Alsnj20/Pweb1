#!C:/xampp/perl/bin/perl.exe
use strict;
use warnings;
use CGI;
print "Content-type: text/html\n\n"; 
my $q = CGI->new;
my $expression = $q->param('expression');
if($expression){
    my ($nro1, $nro2, $resultado) = (0, 0, 0);
    if ($expression =~ /(\d+)\+(\d+)/) {
        $nro1 = $1;
        $nro2 = $2;
        $resultado = $nro1 + $nro2;
    }
    if ($expression =~ /(\d+)-(\d+)/) {
        $nro1 = $1;
        $nro2 = $2;
        $resultado = $nro1 - $nro2;
    }
    if ($expression =~ /(\d+)\*(\d+)/) {
        $nro1 = $1;
        $nro2 = $2;
        $resultado = $nro1 * $nro2;
    }
    if ($expression =~ /(\d+)\/(\d+)/) {
        $nro1 = $1;
        $nro2 = $2;
        $resultado = ($nro2 != 0) ? $nro1/$nro2:"ERROR: Divicion entre cero";
    }
    print "El resultado de la operación es: $resultado";
} else {
    print "Ingresa algo";
}