use utf8;
package Todo::Schema::Result::Tag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Todo::Schema::Result::Tag

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<tag>

=cut

__PACKAGE__->table("tag");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'char'
  is_nullable: 1
  size: 30

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "char", is_nullable => 1, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<name>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("name", ["name"]);

=head1 RELATIONS

=head2 item_tags

Type: has_many

Related object: L<Todo::Schema::Result::ItemTag>

=cut

__PACKAGE__->has_many(
  "item_tags",
  "Todo::Schema::Result::ItemTag",
  { "foreign.tag_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 items

Type: many_to_many

Composing rels: L</item_tags> -> item

=cut

__PACKAGE__->many_to_many("items", "item_tags", "item");


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-02-27 10:41:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:frMbHSaVZIv7ASLtbys8TQ

use overload '""' => sub { shift->name }, fallback => 1;


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
