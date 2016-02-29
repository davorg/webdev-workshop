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

sub find_item_by_id {
    my ($id) = @_;
    my $item = schema->resultset('Item')->find($id);

    unless ($item) {
        status 404;
        return;
    }
    return $item;
}

post '/done/:id' => sub {
    my $id = route_parameters->get('id');
    my $item = find_item_by_id($id)
      or return "Item $id not found";

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

get '/edit/:id' => sub {
    my $id = route_parameters->get('id');
    my $item = find_item_by_id($id)
      or return "Item $id not found";

    template 'add', { item => $item };
};

post '/edit/:id' => sub {
    my $id = route_parameters->get('id');
    my $item = find_item_by_id($id)
      or return "Item $id not found";

    my $new_item;
    my @errors;
    my %cols = (
        title       => 'Title',
        description => 'Description',
        due         => 'Due Date',
    );
    foreach (qw[title description due]) {
        unless ($new_item->{$_} = body_parameters->get($_)) {
            push @errors, $cols{$_};
        }
    }

    if (@errors) {
        return template 'add', { errors => \@errors, item => $new_item };
    }

    $item->update($new_item);
    redirect('/');
};

get '/delete/:id' => sub {
    my $id = route_parameters->get('id');
    my $item = find_item_by_id($id)
      or return "Item $id not found";

    template 'delete', { item => $item };
};

post '/delete/:id' => sub {
    my $id = route_parameters->get('id');
    my $item = find_item_by_id($id)
      or return "Item $id not found";

    $item->delete;
    redirect '/';
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
