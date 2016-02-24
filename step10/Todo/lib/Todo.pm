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

    my @items = schema->resultset('Item')->search(
        undef, { order_by => 'due' }
    )->all;

    my $now = DateTime->now;

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

post '/login' => sub {
    my $user = body_parameters->get('user');
    my $pass = body_parameters->get('password');

    # TODO: Make this better!
    if ($pass eq 'letmein') {
        session user => $user;
    }
    redirect '/';
};

get '/logout' => sub {
    session user => undef;
    redirect '/';
};

true;
