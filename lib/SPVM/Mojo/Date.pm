package SPVM::Mojo::Date;



1;

=head1 Name

SPVM::Mojo::Date - HTTP date

=head1 Description

Mojo::Date class in L<SPVM> implements HTTP date and time functions, based on L<RFC 7230|https://tools.ietf.org/html/rfc7230>, L<RFC
7231|https://tools.ietf.org/html/rfc7231> and L<RFC 3339|https://tools.ietf.org/html/rfc3339>.

=head1 Usage

  use Mojo::Date;
  use Sys;

  # Parse
  my $date = Mojo::Date->new("Sun, 06 Nov 1994 08:49:37 GMT");
  say $date->epoch;

  # Build
  my $date = Mojo::Date->new(Sys->time + 60);
  say $date->to_string;

=head1 Fields

=head2 epoch

C<has epoch : rw long;>

Epoch seconds, defaults to the current time.

=head1 Class Methods



=head1 Instance Methods



=head1 See Also

=over 2

=item * L<SPVM::Mojolicious>

=back

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License

