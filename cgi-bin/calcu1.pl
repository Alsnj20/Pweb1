#!C:/xampp/perl/bin/perl.exe
use strict;
use warnings;
use CGI;
print "Content-type: text/html\n\n";
print "<meta charset=\"UTF-8\">";
my $q = CGI->new;
my $expression = '(5+3)*8';
if($expression){
    if  ($expression =~ /\((\d+[+\-*\/]\d+)\)([+\-*\/]\d+)/) {
        my $nro1 = $1;
        my $operador1 = $2;
        my $nro2 = $3;
        my $resultado;
        if ($operador1 eq '+') {
            $resultado = $nro1 + $nro2;
        } elsif ($operador1 eq '-') {
            $resultado = $nro1 - $nro2;
        } elsif ($operador1 eq '*') {
            $resultado = $nro1 * $nro2;
        } elsif ($operador1 eq '/') {
            if ($nro2 != 0) {
                $resultado = $nro1 / $nro2;
            } else {
                print "Error: División por cero";
                exit;
            }
        } else {
            print "Error: Operador no válido";
            exit;
        }
        print "El resultado de la operación es: $resultado";
    } else {
        print "No hay paréntesis";
    }
} else {
    print "Ingresa algo";
}