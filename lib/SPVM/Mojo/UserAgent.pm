package SPVM::Mojo::UserAgent;



1;

=head1 Name

SPVM::Mojo::UserAgent - User Agent

=head1 Description

Mojo::UserAgent class in L<SPVM> has methods to do someting.

=head1 Usage

  use Mojo::UserAgent;
  
  my $url = "http://google.com";
  
  my $ua = Mojo::UserAgent->new;
  
  my $res = $ua->get($url)->result;
  
  my $body = $res->body;
  
  my $code = $res->code;
  
=head1 Super Class



=head1 Interfaces



=head1 Enumerations



=head1 Fields



=head1 Class Methods



=head1 Instance Methods



=head1 See Also




=head1 Repository



=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License

