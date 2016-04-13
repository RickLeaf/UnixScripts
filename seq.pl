#!/usr/bin/perl

my ($start, $end, $step);

if ($#ARGV == 0) {
        # one parameter, assumed to be the endpoint
        $start = 1;
        $end = int($ARGV[0]);
        $step = 1;
} elsif ($#ARGV == 1) {
        # two parameters, start and endpoints
        $start = int($ARGV[0]);
        $end = int($ARGV[1]);
        $step = 1;
} else {
        # three parameters: start, step, end
        $start = int($ARGV[0]);
        $step = int($ARGV[1]);
        $end = int($ARGV[2]);
}

validate($start, $end, $step) or die "Invalid start, end, and/or step\n" .
        "Usage: $0 [Start [Step]] End\n";

if ($step > 0) {
        for (my $i = $start; $i <= $end; $i += $step) {
                print "$i ";
        }
} else {
        for (my $i = $start; $i >= $end; $i += $step) {
                print "$i ";
        }
}
print "\n";

sub validate() {
        my ($start, $end, $step) = @_;
        return 0 if 0 == $step;

        if ($step > 0) {
                return 0 if $start > $end;
        } else {
                return 0 if $start < $end;
        }
        return 1;
}
