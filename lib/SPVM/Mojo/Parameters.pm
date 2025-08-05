package SPVM::Mojo::Parameters;



1;

=encoding utf8

=head1 Name

SPVM::Mojo::Parameters - Parameters

=head1 Description

Mojo::Parameters class in L<SPVM> is a container for form parameters used by L<Mojo::URL|SPVM::Mojo::URL>, based on L<RFC
3986|https://tools.ietf.org/html/rfc3986> and the L<HTML Living Standard|https://html.spec.whatwg.org>.

=head1 Usage

  use Mojo::Parameters;
  
  # Parse
  my $params = Mojo::Parameters->new("foo=bar&baz=23");
  $params->param("baz");
  say $params->to_string;
  
  # Build
  my $params = Mojo::Parameters->new([foo => "bar", baz => 23]);
  $params->pairs->push_([i => "♥ mojolicious"]);
  say $params->to_string;

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

