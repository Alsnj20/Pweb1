#!C:/xampp/perl/bin/perl.exe
use strict;
use warnings;
use CGI;
print "Content-type: text/html\n\n";
print "<meta charset=\"UTF-8\">";
my $q = CGI->new;
my $expression = $q->param('expression');
if($expresion =~ /(\d\+-\*\/)/){
    my $resultado = resolver_expresion($expression);
    print "El Resultado de la expresión $expression es $resultado\n";
}else{
    print "Ingrese una expresión aritmética ejemplo: (4+5)*8\n";
}
sub resolver_expresion {
    my ($expresion) = @_;
    while ($expresion =~ /\(([^\(\)]+)\)/) {
        my $expresion_interna = $1;
        my $resultado_interno = resolver_expresion($expresion_interna);
        $expresion =~ s/($expresion_interna)/$resultado_interno/;
    }
    return $expresion;  
}
