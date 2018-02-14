#!/usr/bin/perl
use strict;
use warnings;
use Crypt::Mode::CBC;
use NetAddr::IP::Util;

my $rnddev = '/dev/urandom';
open (R, $rnddev) || die "$rnddev: $!";

my $key;
my $iv;
sysread(R, $key, 16);
sysread(R, $iv, 16);
my $cbc = Crypt::Mode::CBC->new('AES');

while (<>) {
	chomp;
	my $ip = NetAddr::IP::Util::inet_aton($_);
	my $enc = $cbc->encrypt($ip, $key, $iv);
	print NetAddr::IP::Util::inet_ntoa(substr($enc,0,4)). "\n";
}
