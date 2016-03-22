#!/usr/pkg/bin/perl

# prints mtime and atime of given files

while (<@ARGV>) {
        my ($atime, $mtime) = (stat($_))[8,9];
        my $new = ($mtime > $atime);
        print sprintf("%20s: m: %20s %10u, a: %20s %10u %s\n",
                $_, scalar localtime($mtime), $mtime,
                    scalar localtime($atime), $atime, ($new ? "N" : ""));
}