#!C:/xampp/perl/bin/perl.exe
use strict;
use warnings;
use CGI;
print "Content-type: text/html\n\n";
print "<meta charset=\"UTF-8\">";
my $q = CGI->new;
my $expression = $q->param('expression');
if($expression){
    if($expression =~ /[\d\+\-\*\/]+/){
        my $resultado = resolver_expresion($expression);
        print "El Resultado de la expresión $expression es $resultado\n";
    }else{
        print "Ingrese una expresión aritmética ejemplo: (4+5)*8\n";
    }
}else{
    print "Ingrese algo\n";
}
sub resolver_expresion {
    my ($expresion) = @_;
    while ($expresion =~ /\(([^\(\)]+)\)/) {
        my $expresion_interna = $1;
        my $resultado_interno = resolver_expresion($expresion_interna);
        $expresion =~ s/\Q($expresion_interna)\E/$resultado_interno/;
    }
    return eval $expresion;  
}
