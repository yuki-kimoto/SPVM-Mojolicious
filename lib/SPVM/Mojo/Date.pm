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

C<method parse : void ($date_value : object of string|Long = undef)>

Construct a new L<Mojo::Date> object and L</"parse"> date if necessary.

Examples:

  my $date = Mojo::Date->new;
  my $date = Mojo::Date->new("Sun Nov  6 08:49:37 1994");
  my $date = Mojo::Date->new(Sys->time + 60);

=head1 Instance Methods

=head2 parse

C<method parse : void ($date : string);>

=head2 to_datetime

C<method to_datetime : string ();>

Render L<RFC 3339|https://tools.ietf.org/html/rfc3339> date and time.

  # "1994-11-06T08:49:37Z"
  Mojo::Date->new(784111777)->to_datetime;

  # "1994-11-06T08:49:37.21Z"
  Mojo::Date->new(784111777.21)->to_datetime;

=head2 to_string

C<method to_string : string ();>

Render date suitable for HTTP messages.

  # "Sun, 06 Nov 1994 08:49:37 GMT"
  Mojo::Date->new(784111777L)->to_string;

=head1 See Also

=over 2

=item * L<SPVM::Mojolicious>

=back

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License

