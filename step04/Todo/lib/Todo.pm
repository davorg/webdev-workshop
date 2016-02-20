package Todo;
use Dancer2;

our $VERSION = '0.1';

use DateTime::Format::Strptime;
use DateTime;

get '/' => sub {
    my $dt_parser = DateTime::Format::Strptime->new(
        pattern => '%Y-%m-%d',
    );

    my @items = ({
        title       => 'Todo item 1',
        description => 'Do something interesting',
        due         => '2016-02-10',
        done        => 1,
    }, {
        title       => 'Todo item 2',
        description => 'Do something useful',
        due         => '2016-02-19',
        done        => 0,
    }, {
        title       => 'Todo item 3',
        description => 'Do something exciting',
        due         => '2016-02-29',
        done        => 0,
    }, {
        title       => 'Todo item 4',
        description => 'Do something lucrative',
        due         => '2016-03-04',
        done        => 0,
    });

    my $now = DateTime->now;

    foreach my $item (@items) {
        $item->{due} = $dt_parser->parse_datetime($item->{due});
        $item->{overdue} = $item->{due} <= $now;
    }

    template 'index', { items => \@items };
};

true;
