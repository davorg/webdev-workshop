use utf8;
package Todo::Schema::Result::ItemTag;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Todo::Schema::Result::ItemTag

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

=head1 TABLE: C<item_tag>

=cut

__PACKAGE__->table("item_tag");

=head1 ACCESSORS

=head2 item_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 tag_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "item_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "tag_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</item_id>

=item * L</tag_id>

=back

=cut

__PACKAGE__->set_primary_key("item_id", "tag_id");

=head1 RELATIONS

=head2 item

Type: belongs_to

Related object: L<Todo::Schema::Result::Item>

=cut

__PACKAGE__->belongs_to(
  "item",
  "Todo::Schema::Result::Item",
  { id => "item_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 tag

Type: belongs_to

Related object: L<Todo::Schema::Result::Tag>

=cut

__PACKAGE__->belongs_to(
  "tag",
  "Todo::Schema::Result::Tag",
  { id => "tag_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07045 @ 2016-02-27 10:29:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Uizh7IUJES65uIIduckVQA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
