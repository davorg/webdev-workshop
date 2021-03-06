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

post '/done/:id' => sub {
    my $id = route_parameters->get('id');
    my $item = schema->resultset('Item')->find($id);

    unless ($item) {
        status 404;
        return "Item $id not found";
    }

    $item->update({ done => 1 });
    redirect('/');
};

true;
