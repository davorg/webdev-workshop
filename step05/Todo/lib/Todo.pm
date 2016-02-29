package Todo;
use Dancer2;

our $VERSION = '0.1';

use Dancer2::Plugin::DBIC;
use DateTime::Format::Strptime;
use DateTime;

get '/' => sub {
    my @items = schema->resultset('Item')->all;

    template 'index', { items => \@items };
};

true;
