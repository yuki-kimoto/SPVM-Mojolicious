use Test::More;

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
BEGIN { $ENV{SPVM_BUILD_DIR} = "$FindBin::Bin/.spvm_build"; }

use SPVM 'TestCase::Mojo::Template';

use SPVM 'Mojolicious';
use SPVM::Mojolicious;
use SPVM 'Fn';

my $api = SPVM::api();

my $start_memory_blocks_count = $api->get_memory_blocks_count;

ok(SPVM::TestCase::Mojo::Template->basic);
ok(SPVM::TestCase::Mojo::Template->xml_escape);
ok(SPVM::TestCase::Mojo::Template->comment);
ok(SPVM::TestCase::Mojo::Template->escape_line_ending);

SPVM::Fn->destroy_runtime_permanent_vars;

my $end_memory_blocks_count = $api->get_memory_blocks_count;
is($end_memory_blocks_count, $start_memory_blocks_count);

done_testing;
