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

  $headers = $headers->add(Foo => 'one value');
  $headers = $headers->add(Foo => 'first value', 'second value');

Add header with one or more lines.

  # "Vary: Accept
  #  Vary: Accept-Encoding"
  $headers->add(Vary => 'Accept')->add(Vary => 'Accept-Encoding')->to_string;

=head2 append
  
C<method append : void ($name : string, $value : string);>

  $headers = $headers->add(Foo => 'one value');
  $headers = $headers->add(Foo => 'first value', 'second value');

Add header with one or more lines.

  # "Vary: Accept
  #  Vary: Accept-Encoding"
  $headers->add(Vary => 'Accept')->add(Vary => 'Accept-Encoding')->to_string;

=head2 clone
  
C<method clone : Mojo::Headers ();>

  my $clone = $headers->clone;

Return a new L<Mojo::Headers> object cloned from these headers.

=head2 dehop
  
C<method dehop : void ();>

  $headers = $headers->dehop;

Remove hop-by-hop headers that should not be retransmitted.

=head2 every_header
  
C<method every_header : string[] ($name : string);>

  my $all = $headers->every_header('Location');

Similar to L</"header">, but returns all headers sharing the same name as an array reference.

  # Get first header value
  say $headers->every_header('Location')->[0];

=head2 from_hash
  
C<method from_hash : Mojo::Headers ($hash : Hash);>

  $headers = $headers->from_hash({'Cookie' => 'a=b'});
  $headers = $headers->from_hash({'Cookie' => ['a=b', 'c=d']});
  $headers = $headers->from_hash({});

Parse headers from a hash reference, an empty hash removes all headers.

=head2 header
  
C<method header : string ($name : string);>

  my $value = $headers->header('Foo');
  $headers  = $headers->header(Foo => 'one value');
  $headers  = $headers->header(Foo => 'first value', 'second value');

Get or replace the current header values.

=head2 set_header
  
C<method set_header : void ($name : string, $value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 is_finished
  
C<method is_finished : int ();>

  my $value = $headers->header('Foo');
  $headers  = $headers->header(Foo => 'one value');
  $headers  = $headers->header(Foo => 'first value', 'second value');

Get or replace the current header values.

=head2 is_limit_exceeded
  
C<method is_limit_exceeded : int ();>

  my $bool = $headers->is_limit_exceeded;

Check if headers have exceeded L</"max_line_size"> or L</"max_lines">.

=head2 leftovers
  
C<method leftovers : string ();>

  my $bytes = $headers->leftovers;

Get and remove leftover data from header parser.

=head2 names
  
C<method names : string[] ();>

  my $names = $headers->names;

Return an array reference with all currently defined headers.

  # Names of all headers
  say for @{$headers->names};

=head2 parse
  
C<method parse : void ($chunk : string);>

  $headers = $headers->parse("Content-Type: text/plain\x0d\x0a\x0d\x0a");

Parse formatted headers.

=head2 remove
  
C<method remove : void ($name : string);>

  $headers = $headers->remove('Foo');

Remove a header.

=head2 to_hash
  
C<method to_hash : Hash ();>

  my $single = $headers->to_hash;
  my $multi  = $headers->to_hash(1);

Turn headers into hash reference, array references to represent multiple headers with the same name are disabled by
default.

  say $headers->to_hash->{DNT};

=head2 to_string
  
C<method to_string : string ();>

  my $str = $headers->to_string;

Turn headers into a string, suitable for HTTP messages.


=head2 accept
  
C<method accept : string ();>

  my $accept = $headers->accept;
  $headers   = $headers->accept('application/json');

Get or replace current header value, shortcut for the C<Accept> header.

=head2 set_accept

C<method set_accept : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 accept_charset

C<method accept_charset : string ();>

  my $charset = $headers->accept_charset;
  $headers    = $headers->accept_charset('UTF-8');

Get or replace current header value, shortcut for the C<Accept-Charset> header.

=head2 set_accept_charset

C<method set_accept_charset : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 accept_encoding

C<method accept_encoding : string ();>

  my $encoding = $headers->accept_encoding;
  $headers     = $headers->accept_encoding('gzip');

Get or replace current header value, shortcut for the C<Accept-Encoding> header.

=head2 set_accept_encoding

C<method set_accept_encoding : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 accept_language

C<method accept_language : string ();>

  my $language = $headers->accept_language;
  $headers     = $headers->accept_language('de, en');

Get or replace current header value, shortcut for the C<Accept-Language> header.

=head2 set_accept_language

C<method set_accept_language : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 accept_ranges

C<method accept_ranges : string ();>

  my $ranges = $headers->accept_ranges;
  $headers   = $headers->accept_ranges('bytes');

Get or replace current header value, shortcut for the C<Accept-Ranges> header.

=head2 set_accept_ranges

C<method set_accept_ranges : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 access_control_allow_origin

C<method access_control_allow_origin : string ();>

=head2 set_access_control_allow_origin

C<method set_access_control_allow_origin : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

  my $origin = $headers->access_control_allow_origin;
  $headers   = $headers->access_control_allow_origin('*');

Get or replace current header value, shortcut for the C<Access-Control-Allow-Origin> header from L<Cross-Origin
Resource Sharing|https://www.w3.org/TR/cors/>.

=head2 allow

C<method allow : string ();>

  my $allow = $headers->allow;
  $headers  = $headers->allow('GET, POST');

Get or replace current header value, shortcut for the C<Allow> header.

=head2 set_allow

C<method set_allow : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 authorization

C<method authorization : string ();>

  my $authorization = $headers->authorization;
  $headers          = $headers->authorization('Basic Zm9vOmJhcg==');

Get or replace current header value, shortcut for the C<Authorization> header.

=head2 set_authorization

C<method set_authorization : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 cache_control

C<method cache_control : string ();>

  my $cache_control = $headers->cache_control;
  $headers          = $headers->cache_control('max-age=1, no-cache');

Get or replace current header value, shortcut for the C<Cache-Control> header.

=head2 set_cache_control

C<method set_cache_control : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 connection

C<method connection : string ();>

  my $connection = $headers->connection;
  $headers       = $headers->connection('close');

Get or replace current header value, shortcut for the C<Connection> header.

=head2 set_connection

C<method set_connection : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_disposition

C<method content_disposition : string ();>

  my $disposition = $headers->content_disposition;
  $headers        = $headers->content_disposition('foo');

Get or replace current header value, shortcut for the C<Content-Disposition> header.

=head2 set_content_disposition

C<method set_content_disposition : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_encoding

C<method content_encoding : string ();>

  my $encoding = $headers->content_encoding;
  $headers     = $headers->content_encoding('gzip');

Get or replace current header value, shortcut for the C<Content-Encoding> header.

=head2 set_content_encoding

C<method set_content_encoding : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_language

C<method content_language : string ();>

  my $language = $headers->content_language;
  $headers     = $headers->content_language('en');

Get or replace current header value, shortcut for the C<Content-Language> header.

=head2 set_content_language

C<method set_content_language : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_length

C<method content_length : string ();>

  my $len  = $headers->content_length;
  $headers = $headers->content_length(4000);

Get or replace current header value, shortcut for the C<Content-Length> header.

=head2 set_content_length

C<method set_content_length : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_location

C<method content_location : string ();>

  my $location = $headers->content_location;
  $headers     = $headers->content_location('http://127.0.0.1/foo');

Get or replace current header value, shortcut for the C<Content-Location> header.

=head2 set_content_location

C<method set_content_location : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_range

C<method content_range : string ();>

  my $range = $headers->content_range;
  $headers  = $headers->content_range('bytes 2-8/100');

Get or replace current header value, shortcut for the C<Content-Range> header.

=head2 set_content_range

C<method set_content_range : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_security_policy

C<method content_security_policy : string ();>

  my $policy = $headers->content_security_policy;
  $headers   = $headers->content_security_policy('default-src https:');

Get or replace current header value, shortcut for the C<Content-Security-Policy> header from L<Content Security Policy
1.0|https://www.w3.org/TR/CSP/>.

=head2 set_content_security_policy

C<method set_content_security_policy : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 content_type

C<method content_type : string ();>

  my $type = $headers->content_type;
  $headers = $headers->content_type('text/plain');

Get or replace current header value, shortcut for the C<Content-Type> header.

=head2 set_content_type

C<method set_content_type : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 cookie

C<method cookie : string ();>

  my $cookie = $headers->cookie;
  $headers   = $headers->cookie('f=b');

Get or replace current header value, shortcut for the C<Cookie> header from L<RFC
6265|https://tools.ietf.org/html/rfc6265>.

=head2 set_cookie

C<method set_cookie : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 date

C<method date : string ();>

  my $date = $headers->date;
  $headers = $headers->date('Sun, 17 Aug 2008 16:27:35 GMT');

Get or replace current header value, shortcut for the C<Date> header.

=head2 set_date

C<method set_date : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 dnt

C<method dnt : string ();>

  my $dnt  = $headers->dnt;
  $headers = $headers->dnt(1);

Get or replace current header value, shortcut for the C<DNT> (Do Not Track) header, which has no specification yet, but
is very commonly used.

=head2 set_dnt

C<method set_dnt : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 etag

C<method etag : string ();>

  my $etag = $headers->etag;
  $headers = $headers->etag('"abc321"');

Get or replace current header value, shortcut for the C<ETag> header.

=head2 set_etag

C<method set_etag : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 expect

C<method expect : string ();>

  my $expect = $headers->expect;
  $headers   = $headers->expect('100-continue');

Get or replace current header value, shortcut for the C<Expect> header.

=head2 set_expect

C<method set_expect : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 expires

C<method expires : string ();>

  my $expires = $headers->expires;
  $headers    = $headers->expires('Thu, 01 Dec 1994 16:00:00 GMT');

Get or replace current header value, shortcut for the C<Expires> header.

=head2 set_expires

C<method set_expires : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 host

C<method host : string ();>

  my $host = $headers->host;
  $headers = $headers->host('127.0.0.1');

Get or replace current header value, shortcut for the C<Host> header.

=head2 set_host

C<method set_host : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 if_modified_since

C<method if_modified_since : string ();>

=head2 set_if_modified_since

  my $date = $headers->if_modified_since;
  $headers = $headers->if_modified_since('Sun, 17 Aug 2008 16:27:35 GMT');

Get or replace current header value, shortcut for the C<If-Modified-Since> header.

C<method set_if_modified_since : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 if_none_match

C<method if_none_match : string ();>

  my $etag = $headers->if_none_match;
  $headers = $headers->if_none_match('"abc321"');

Get or replace current header value, shortcut for the C<If-None-Match> header.

=head2 set_if_none_match

C<method set_if_none_match : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 last_modified

C<method last_modified : string ();>

  my $date = $headers->last_modified;
  $headers = $headers->last_modified('Sun, 17 Aug 2008 16:27:35 GMT');

Get or replace current header value, shortcut for the C<Last-Modified> header.

=head2 set_last_modified

C<method set_last_modified : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 link

C<method link : string ();>

  my $link = $headers->link;
  $headers = $headers->link('<http://127.0.0.1/foo/3>; rel="next"');

Get or replace current header value, shortcut for the C<Link> header from L<RFC
5988|https://tools.ietf.org/html/rfc5988>.

=head2 set_link

C<method set_link : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 links
  
C<method links : Hash of Hash of string ();>

  my $links = $headers->links;
  $headers  = $headers->links({next => 'http://example.com/foo', prev => 'http://example.com/bar'});

Get or set web links from or to C<Link> header according to L<RFC 5988|http://tools.ietf.org/html/rfc5988>.

  # Extract information about next page
  say $headers->links->{next}{link};
  say $headers->links->{next}{title};

=head2 set_links
  
C<method set_links : void ($links : object[]);>

=head2 location

C<method location : string ();>

  my $location = $headers->location;
  $headers     = $headers->location('http://127.0.0.1/foo');

Get or replace current header value, shortcut for the C<Location> header.

=head2 set_location

C<method set_location : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 origin

C<method origin : string ();>

  my $origin = $headers->origin;
  $headers   = $headers->origin('http://example.com');

Get or replace current header value, shortcut for the C<Origin> header from L<RFC
6454|https://tools.ietf.org/html/rfc6454>.

=head2 set_origin

C<method set_origin : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 proxy_authenticate

C<method proxy_authenticate : string ();>

  my $authenticate = $headers->proxy_authenticate;
  $headers         = $headers->proxy_authenticate('Basic "realm"');

Get or replace current header value, shortcut for the C<Proxy-Authenticate> header.

=head2 set_proxy_authenticate

C<method set_proxy_authenticate : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 proxy_authorization

C<method proxy_authorization : string ();>

  my $authorization = $headers->proxy_authorization;
  $headers          = $headers->proxy_authorization('Basic Zm9vOmJhcg==');

Get or replace current header value, shortcut for the C<Proxy-Authorization> header.

=head2 set_proxy_authorization

C<method set_proxy_authorization : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 range

C<method range : string ();>

  my $range = $headers->range;
  $headers  = $headers->range('bytes=2-8');

Get or replace current header value, shortcut for the C<Range> header.

=head2 set_range

C<method set_range : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 referer
  
C<method referer : string ();>

  my $referrer = $headers->referer;
  $headers     = $headers->referer('http://example.com');

Alias for L</"referrer">.

=head2 set_referer
  
C<method set_referer : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 referrer
  
C<method referrer : string ();>

  my $referrer = $headers->referrer;
  $headers     = $headers->referrer('http://example.com');

Get or replace current header value, shortcut for the C<Referer> header, there was a typo in L<RFC
2068|https://tools.ietf.org/html/rfc2068> which resulted in C<Referer> becoming an official header.

=head2 set_referrer
  
C<method set_referrer : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 sec_websocket_accept

C<method sec_websocket_accept : string ();>

  my $accept = $headers->sec_websocket_accept;
  $headers   = $headers->sec_websocket_accept('s3pPLMBiTxaQ9kYGzzhZRbK+xOo=');

Get or replace current header value, shortcut for the C<Sec-WebSocket-Accept> header from L<RFC
6455|https://tools.ietf.org/html/rfc6455>.

=head2 set_sec_websocket_accept

C<method set_sec_websocket_accept : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 sec_websocket_extensions

C<method sec_websocket_extensions : string ();>

  my $extensions = $headers->sec_websocket_extensions;
  $headers       = $headers->sec_websocket_extensions('foo');

Get or replace current header value, shortcut for the C<Sec-WebSocket-Extensions> header from L<RFC
6455|https://tools.ietf.org/html/rfc6455>.

=head2 set_sec_websocket_extensions

C<method set_sec_websocket_extensions : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 sec_websocket_key

C<method sec_websocket_key : string ();>

  my $key  = $headers->sec_websocket_key;
  $headers = $headers->sec_websocket_key('dGhlIHNhbXBsZSBub25jZQ==');

Get or replace current header value, shortcut for the C<Sec-WebSocket-Key> header from L<RFC
6455|https://tools.ietf.org/html/rfc6455>.

=head2 set_sec_websocket_key

C<method set_sec_websocket_key : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 sec_websocket_protocol

C<method sec_websocket_protocol : string ();>

  my $proto = $headers->sec_websocket_protocol;
  $headers  = $headers->sec_websocket_protocol('sample');

Get or replace current header value, shortcut for the C<Sec-WebSocket-Protocol> header from L<RFC
6455|https://tools.ietf.org/html/rfc6455>.

=head2 set_sec_websocket_protocol

C<method set_sec_websocket_protocol : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 sec_websocket_version

C<method sec_websocket_version : string ();>

  my $version = $headers->sec_websocket_version;
  $headers    = $headers->sec_websocket_version(13);

Get or replace current header value, shortcut for the C<Sec-WebSocket-Version> header from L<RFC
6455|https://tools.ietf.org/html/rfc6455>.

=head2 set_sec_websocket_version

C<method set_sec_websocket_version : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 server

C<method server : string ();>

  my $server = $headers->server;
  $headers   = $headers->server('Mojo');

Get or replace current header value, shortcut for the C<Server> header.

=head2 set_server

C<method set_server : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 server_timing

C<method server_timing : string ();>

  my $timing = $headers->server_timing;
  $headers   = $headers->server_timing('app;desc=Mojolicious;dur=0.0001');

Get or replace current header value, shortcut for the C<Server-Timing> header from L<Server
Timing|https://www.w3.org/TR/server-timing/>.

=head2 set_server_timing

C<method set_server_timing : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 get_set_cookie

C<method get_set_cookie : string ();>

  my $cookie = $headers->set_cookie;
  $headers   = $headers->set_cookie('f=b; path=/');

Get or replace current header value, shortcut for the C<Set-Cookie> header from L<RFC
6265|https://tools.ietf.org/html/rfc6265>.

=head2 set_set_cookie

C<method set_set_cookie : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 status

C<method status : string ();>

  my $status = $headers->status;
  $headers   = $headers->status('200 OK');

Get or replace current header value, shortcut for the C<Status> header from L<RFC
3875|https://tools.ietf.org/html/rfc3875>.

=head2 set_status

C<method set_status : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 strict_transport_security

C<method strict_transport_security : string ();>

  my $policy = $headers->strict_transport_security;
  $headers   = $headers->strict_transport_security('max-age=31536000');

Get or replace current header value, shortcut for the C<Strict-Transport-Security> header from L<RFC
6797|https://tools.ietf.org/html/rfc6797>.

=head2 set_strict_transport_security

C<method set_strict_transport_security : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 te

C<method te : string ();>

  my $te   = $headers->te;
  $headers = $headers->te('chunked');

Get or replace current header value, shortcut for the C<TE> header.

=head2 set_te

C<method set_te : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 trailer

C<method trailer : string ();>

  my $trailer = $headers->trailer;
  $headers    = $headers->trailer('X-Foo');

Get or replace current header value, shortcut for the C<Trailer> header.

=head2 set_trailer

C<method set_trailer : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 transfer_encoding

C<method transfer_encoding : string ();>

  my $encoding = $headers->transfer_encoding;
  $headers     = $headers->transfer_encoding('chunked');

Get or replace current header value, shortcut for the C<Transfer-Encoding> header.

=head2 set_transfer_encoding

C<method set_transfer_encoding : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 upgrade

C<method upgrade : string ();>

  my $upgrade = $headers->upgrade;
  $headers    = $headers->upgrade('websocket');

Get or replace current header value, shortcut for the C<Upgrade> header.

=head2 set_upgrade

C<method set_upgrade : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 user_agent

C<method user_agent : string ();>

  my $agent = $headers->user_agent;
  $headers  = $headers->user_agent('Mojo/1.0');

Get or replace current header value, shortcut for the C<User-Agent> header.

=head2 set_user_agent

C<method set_user_agent : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head2 vary

C<method vary : string ();>

=head2 set_vary

C<method set_vary : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

  my $vary = $headers->vary;
  $headers = $headers->vary('*');

Get or replace current header value, shortcut for the C<Vary> header.

=head2 www_authenticate

C<method www_authenticate : string ();>

  my $authenticate = $headers->www_authenticate;
  $headers         = $headers->www_authenticate('Basic realm="realm"');

Get or replace current header value, shortcut for the C<WWW-Authenticate> header.

=head2 set_www_authenticate

C<method set_www_authenticate : void ($value : object of string|L<Stringable|SPVM::Stringable>|string[]);>

=head1 See Also

=over 2

=item * L<SPVM::Mojolicious>

=back

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License
