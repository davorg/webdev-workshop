package Todo;
use Dancer2;

our $VERSION = '0.1';

use Dancer2::Plugin::DBIC;
use DateTime::Format::Strptime;
use DateTime;

get '/' => sub {

    my @items = schema->resultset('Item')->search(
        undef, { order_by => 'due' }
    )->all;

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

get '/add' => sub {
    template 'add';
};

post '/add' => sub {
    my $item;
    my @errors;
    my %cols = (
        title       => 'Title',
        description => 'Description',
        due         => 'Due Date',
    );
    foreach (qw[title description due]) {
        unless ($item->{$_} = body_parameters->get($_)) {
            push @errors, $cols{$_};
        }
    }

    if (@errors) {
        return template 'add', { errors => \@errors, item => $item };
    }

    resultset('Item')->create($item);
    redirect('/');
};

true;
