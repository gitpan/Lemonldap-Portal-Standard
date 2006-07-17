package Lemonldap::Portal::LogoutDAC;
use strict;
use warnings;
use Apache2::Const;
use Data::Dumper;
use Template;
use CGI ':cgi-lib';
use Apache2::ServerRec();
our $VERSION = '3.0.0';

sub handler {	

	my $r = shift;
	my $Template = Template->new('ABSOLUTE' => 1);
	my $LogoutPage = $r->dir_config('LemonldapLogoutPage');
	my $domain = $r->dir_config('LemonldapDomain');
	my $cookie = $r->dir_config('LemonldapCookie'); 
my $Data = {'message' => "Votre deconnexion est effective. Veuillez fermer la fenetre"};

                print CGI::header();
                $Template->process( $LogoutPage , $Data ) or die($Template->error());




my $entete = $r->headers_in();
	my $Cookies = $entete->{'Cookie'};		
#	my %input = Vars ;
#	my $LogoutPage = $r->dir_config('LemonldapLogoutPage');
#	my $domain = $input{'domain'};
#	my $cookie = $input{'cookie'};
			
	my $LogoutCookie = CGI::cookie(
            	    -name   => $cookie,
	            -value  => '0',
                    -domain => ".".$domain,
               	    -path   => '/',
		    -expires => 'now'
               	);  		
	$r->headers_out->add( 'Set-Cookie' => $LogoutCookie );
#	my $Data = {'message' => "Votre deconnexion est effective. Veuillez fermer la fenetre"};

  #              print CGI::header();
 #                $Template->process( $LogoutPage , $Data ) or die($Template->error());
 	
	
	return Apache2::Const::DONE ;		
}
1;
