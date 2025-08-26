package SPVM::Mojo::UserAgent;



1;

=head1 Name

SPVM::Mojo::UserAgent - Non-blocking I/O HTTP and WebSocket user agent

=head1 Description

Mojo::UserAgent class in L<SPVM> is a full featured non-blocking I/O HTTP and WebSocket user agent, with IPv6, TLS, SNI, IDNA,
HTTP proxy, UNIX domain socket, Comet (long polling), Promises/A+, keep-alive, connection pooling, timeout,
cookie, multipart, gzip compression and multiple event loop support.

=head1 Usage

  use Mojo::UserAgent;

  # Fine grained response handling (dies on connection errors)
  my $ua  = Mojo::UserAgent->new;
  my $res = $ua->get("docs.mojolicious.org")->result;
  if    ($res->is_success)  { say $res->body }
  elsif ($res->is_error)    { say $res->message }
  elsif ($res->code == 301) { say $res->headers->location }
  else                      { say "Whatever..." }

  # Say hello to the Unicode snowman and include an Accept header
  say $ua->get("www.☃.net?hello=there" => {Accept => "*/*"})->result->body;

  # IPv6 PUT request with Content-Type header and content
  my $tx = $ua->put("[::1]:3000" => {"Content-Type" => "text/plain"} => "Hi!");

  # Quick JSON API request with Basic authentication
  my $url = Mojo::URL->new("https://example.com/test.json")->userinfo("sri:☃");
  my $value = $ua->get($url)->result->json;

  # JSON POST (application/json) with TLS certificate authentication
  my $tx = ($ua->set_cert("tls.crt"), $ua->set_key("tls.key"), $ua->post("https://example.com" => [(object)json => {top => "secret"}]));

  # Form POST (application/x-www-form-urlencoded)
  my $tx = $ua->post("https://metacpan.org/search" => [(object)form => {q => "mojo"}]);

  # Search DuckDuckGo anonymously through Tor
  $ua->proxy->http("socks://127.0.0.1:9050");
  say $ua->get("api.3g2upl4pq6kufc4m.onion/?q=mojolicious&format=json")->result->json("/Abstract");

  # GET request via UNIX domain socket "/tmp/myapp.sock" (percent encoded slash)
  say $ua->get("http+unix://%2Ftmp%2Fmyapp.sock/test")->result->body;

  # Follow redirects to download Mojolicious from GitHub
  ($ua->set_max_redirects(5),
    $ua->get("https://www.github.com/mojolicious/mojo/tarball/main")
    ->result->save_to("/home/sri/mojo.tar.gz"));

=head1 Author

Yuki Kimoto C<kimoto.yuki@gmail.com>

=head1 Copyright & License

Copyright (c) 2025 Yuki Kimoto

MIT License

