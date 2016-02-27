#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

use Plack::Builder;

use Todo;

builder {
  enable 'Plack::Middleware::Static',
    path => qr{^/(javascripts|css)/} , root => './public/';
  Todo->to_app;
};

