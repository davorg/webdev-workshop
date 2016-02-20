package Todo;
use Dancer2;

our $VERSION = '0.1';

use Dancer2::Plugin::DBIC;
use DateTime::Format::Strptime;
use DateTime;

get '/' => sub {
    my $dt_parser = DateTime::Format::Strptime->new(
        pattern => '%Y-%m-%d',
    );

    my @items = schema->resultset('Item')->all;

    my $now = DateTime->now;

    foreach my $item (@items) {
        # $item->{due} = $dt_parser->parse_datetime($item->{due});
        # $item->overdue} = $item->{due} <= $now;
    }

    template 'index', { items => \@items };
};

true;
