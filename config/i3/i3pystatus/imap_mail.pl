#!/usr/bin/perl

use strict;
use Mail::IMAPClient;
use IO::Socket::SSL;

my $username = 'srsantos';
my $password = 'XXXXXXXXX';

my $socket = IO::Socket::SSL->new(
  SSL_hostname => '',
  SSL_verify_mode => SSL_VERIFY_NONE,
  PeerAddr => '131.204.120.103',
  PeerPort => 993
 )
 or die "socket(): $@";

my $client = Mail::IMAPClient->new(
  Socket   => $socket,
  User     => $username,
  Password => $password,
 )
 or die "new(): $@";

if ($client->IsAuthenticated()) {
   my $msgct;

   $client->select("INBOX");
   $msgct = $client->unseen_count||'0';
   print "$msgct\n";
}
$client->logout();

