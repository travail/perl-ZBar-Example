#!/bin/env perl

use strict;
use warnings;
use Data::Dumper;
use Barcode::ZBar;
use Image::Magick;

use constant IMAGE_PATH =>
    'https://s3-ap-northeast-1.amazonaws.com/static.mercari.jp/photos/m352744386_2.jpg';

main();
exit;

sub main {
    my $scanner = Barcode::ZBar::ImageScanner->new;
    $scanner->parse_config('enable');

    my $magick = Image::Magick->new;
    $magick->Read(IMAGE_PATH);
    my $raw = $magick->ImageToBlob( magick => 'GRAY', depth => 8 );

    my $image = Barcode::ZBar::Image->new();
    $image->set_format('Y800');
    $image->set_size( $magick->Get(qw( columns rows )) );
    $image->set_data($raw);

    my $n = $scanner->scan_image($image);

    foreach my $symbol ( $image->get_symbols ) {
        warn Dumper($symbol->get_type);
        warn Dumper($symbol->get_data);
        warn Dumper($symbol->get_loc);
    }
}
