#!/usr/bin/perl

# This file is part of Koha.
#
# Koha is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# Koha is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Koha; if not, see <http://www.gnu.org/licenses>.

use Modern::Perl;
use CGI qw ( -utf8 );
use C4::Output;
use C4::Auth;
use C4::Koha;

my $query = new CGI;

my ( $template, $loggedinuser, $cookie, $flags ) = get_template_and_user(
    {
        template_name   => "how-to.tt",
        query           => $query,
        type            => "intranet",
        authnotrequired => 0,
        flagsrequired   => { catalogue => 1, },
    }
);

my @messages;
my $step = C4::Context->preference('HowToHackKoha') || 1;
my $next_step = $step;

my $patron = Koha::Patrons->find( $loggedinuser );
unless ( $patron ) {
    push @messages, { type => 'error', code => 'using_db_user' };
}

if ( $step == 1 ) {
    $next_step = 2;
} elsif ( $step == 2 ) {
    $next_step = 2; # unless all_finish = 1
} else {

}

C4::Context->set_preference('HowToHackKoha', $next_step);
$template->param(
    step => $step,
    next_step => $next_step,
    messages => \@messages,
);
output_html_with_http_headers $query, $cookie, $template->output;
