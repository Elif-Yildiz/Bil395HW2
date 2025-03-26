use strict;
use warnings;

while (1) {
    print "Enter expression (e.g., 5 + 3) or 'exit' to quit: ";
    my $input = <STDIN>;
    chomp($input);
    
    last if $input =~ /^exit$/i;
    
    if ($input =~ /^(\d+)\s*([+\-*\/])\s*(\d+)$/) {
        my ($first, $oper, $other) = ($1, $2, $3);
        my $result;
        
        if ($oper eq '+') { $result = $first + $other; }
        elsif ($oper eq '-') { $result = $first - $other; }
        elsif ($oper eq '*') { $result = $first * $other; }
        elsif ($oper eq '/') {
            if ($other == 0) {
                print "\nCannot divide by 0\n";
                next;
            } else {
                $result = $first / $other;
            }
        }
        
        print "\nResult: $first $oper $other = $result\n\n";
    } else {
        print "\nInvalid input. Please enter in format: number operator number\n\n";
    }
}
