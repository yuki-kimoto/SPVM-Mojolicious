package SPVM::Mojo::Headers;



1;

=head1 Name

SPVM::Mojo::Headers - HTTP headers

=head1 Description

Mojo::Headers class in L<SPVM> is a container for HTTP headers, based on L<RFC 7230|https://tools.ietf.org/html/rfc7230> and L<RFC
7231|https://tools.ietf.org/html/rfc7231>.

=head1 Usage

  use Mojo::Headers;
  
  # Parse
  my $headers = Mojo::Headers->new;
  $headers->parse("Content-Length: 42\x0d\x0a");
  $headers->parse("Content-Type: text/html\x0d\x0a\x0d\x0a");
  say $headers->content_length;
  say $headers->content_type;
  
  # Build
  my $headers = Mojo::Headers->new;
  $headers->set_content_length(42);
  $headers->set_content_type("text/plain");
  say $headers->to_string;

=head1 Fields

=head2 max_line_size

C<has max_line_size : rw int;>

Maximum header line size in bytes, defaults to the value of the C<SPVM_MOJO_MAX_LINE_SIZE> environment variable or C<8192>
(8KiB).

Examples:

  my $size = $headers->max_line_size;
  $headers->set_max_line_size(1024);

=head2 max_lines

C<has max_lines : rw int;>

Maximum number of header lines, defaults to the value of the C<SPVM_MOJO_MAX_LINES> environment variable or C<100>.

Examples:

  my $num  = $headers->max_lines;
  $headers->set_max_lines(200);

=head1 Class Methods

=head2 new

C<static method new : L<Mojo::Headers|SPVM::Mojo::Headers> ();>

Creates a new L<Mojo::Headers|SPVM::Mojo::Headers> object, and returns it.

=head1 Instance Methods

=head2 add

C<method add : void ($name : string, $value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 append
  
C<method append : void ($name : string, $value : string);>

=head2 clone
  
C<method clone : Mojo::Headers ();>

=head2 dehop
  
C<method dehop : void ();>

=head2 every_header
  
C<method every_header : string[] ($name : string);>

=head2 from_hash
  
C<method from_hash : Mojo::Headers ($hash : Hash);>

=head2 header
  
C<method header : string ($name : string);>

=head2 set_header
  
C<method set_header : void ($name : string, $value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 is_finished
  
C<method is_finished : int ();>

=head2 is_limit_exceeded
  
C<method is_limit_exceeded : int ();>

=head2 leftovers
  
C<method leftovers : string ();>

=head2 links
  
C<method links : Hash of Hash of string ();>

=head2 set_links
  
C<method set_links : void ($links : object[]);>

=head2 names
  
C<method names : string[] ();>

=head2 parse
  
C<method parse : void ($chunk : string);>

=head2 referer
  
C<method referer : string ();>

=head2 set_referer
  
C<method set_referer : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 referrer
  
C<method referrer : string ();>

=head2 set_referrer
  
C<method set_referrer : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 remove
  
C<method remove : void ($name : string);>

=head2 to_hash
  
C<method to_hash : Hash ();>

=head2 to_string
  
C<method to_string : string ();>

=head2 accept
  
C<method accept : string ();>

=head2 set_accept

C<method set_accept : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 accept_charset

C<method accept_charset : string ();>

=head2 set_accept_charset

C<method set_accept_charset : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 accept_encoding

C<method accept_encoding : string ();>

=head2 set_accept_encoding

C<method set_accept_encoding : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 accept_language

C<method accept_language : string ();>

=head2 set_accept_language

C<method set_accept_language : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 accept_ranges

C<method accept_ranges : string ();>

=head2 set_accept_ranges

C<method set_accept_ranges : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 access_control_allow_origin

C<method access_control_allow_origin : string ();>

=head2 set_access_control_allow_origin

C<method set_access_control_allow_origin : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 allow

C<method allow : string ();>

=head2 set_allow

C<method set_allow : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 authorization

C<method authorization : string ();>

=head2 set_authorization

C<method set_authorization : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 cache_control

C<method cache_control : string ();>

=head2 set_cache_control

C<method set_cache_control : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 connection

C<method connection : string ();>

=head2 set_connection

C<method set_connection : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_disposition

C<method content_disposition : string ();>

=head2 set_content_disposition

C<method set_content_disposition : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_encoding

C<method content_encoding : string ();>

=head2 set_content_encoding

C<method set_content_encoding : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_language

C<method content_language : string ();>

=head2 set_content_language

C<method set_content_language : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_length

C<method content_length : string ();>

=head2 set_content_length

C<method set_content_length : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_location

C<method content_location : string ();>

=head2 set_content_location

C<method set_content_location : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_range

C<method content_range : string ();>

=head2 set_content_range

C<method set_content_range : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_security_policy

C<method content_security_policy : string ();>

=head2 set_content_security_policy

C<method set_content_security_policy : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_type

C<method content_type : string ();>

=head2 set_content_type

C<method set_content_type : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 cookie

C<method cookie : string ();>

=head2 set_cookie

C<method set_cookie : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 dnt

C<method dnt : string ();>

=head2 set_dnt

C<method set_dnt : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 date

C<method date : string ();>

=head2 set_date

C<method set_date : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 etag

C<method etag : string ();>

=head2 set_etag

C<method set_etag : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 expect

C<method expect : string ();>

=head2 set_expect

C<method set_expect : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 expires

C<method expires : string ();>

=head2 set_expires

C<method set_expires : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 host

C<method host : string ();>

=head2 set_host

C<method set_host : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 if_modified_since

C<method if_modified_since : string ();>

=head2 set_if_modified_since

C<method set_if_modified_since : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 if_none_match

C<method if_none_match : string ();>

=head2 set_if_none_match

C<method set_if_none_match : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 last_modified

C<method last_modified : string ();>

=head2 set_last_modified

C<method set_last_modified : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 link

C<method link : string ();>

=head2 set_link

C<method set_link : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 location

C<method location : string ();>

=head2 set_location

C<method set_location : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 origin

C<method origin : string ();>

=head2 set_origin

C<method set_origin : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 proxy_authenticate

C<method proxy_authenticate : string ();>

=head2 set_proxy_authenticate

C<method set_proxy_authenticate : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 proxy_authorization

C<method proxy_authorization : string ();>

=head2 set_proxy_authorization

C<method set_proxy_authorization : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 range

C<method range : string ();>

=head2 set_range

C<method set_range : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 sec_websocket_accept

C<method sec_websocket_accept : string ();>

=head2 set_sec_websocket_accept

C<method set_sec_websocket_accept : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 sec_websocket_extensions

C<method sec_websocket_extensions : string ();>

=head2 set_sec_websocket_extensions

C<method set_sec_websocket_extensions : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 sec_websocket_key

C<method sec_websocket_key : string ();>

=head2 set_sec_websocket_key

C<method set_sec_websocket_key : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 sec_websocket_protocol

C<method sec_websocket_protocol : string ();>

=head2 set_sec_websocket_protocol

C<method set_sec_websocket_protocol : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 sec_websocket_version

C<method sec_websocket_version : string ();>

=head2 set_sec_websocket_version

C<method set_sec_websocket_version : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 server

C<method server : string ();>

=head2 set_server

C<method set_server : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 server_timing

C<method server_timing : string ();>

=head2 set_server_timing

C<method set_server_timing : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 get_set_cookie

C<method get_set_cookie : string ();>

=head2 set_set_cookie

C<method set_set_cookie : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 status

C<method status : string ();>

=head2 set_status

C<method set_status : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 strict_transport_security

C<method strict_transport_security : string ();>

=head2 set_strict_transport_security

C<method set_strict_transport_security : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 te

C<method te : string ();>

=head2 set_te

C<method set_te : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 trailer

C<method trailer : string ();>

=head2 set_trailer

C<method set_trailer : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 transfer_encoding

C<method transfer_encoding : string ();>

=head2 set_transfer_encoding

C<method set_transfer_encoding : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 upgrade

C<method upgrade : string ();>

=head2 set_upgrade

C<method set_upgrade : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 user_agent

C<method user_agent : string ();>

=head2 set_user_agent

C<method set_user_agent : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 vary

C<method vary : string ();>

=head2 set_vary

C<method set_vary : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 www_authenticate

C<method www_authenticate : string ();>

=head2 set_www_authenticate

C<method set_www_authenticate : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head1 See Also

=over 2

=item * L<SPVM::Mojolicious>

=back

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License
