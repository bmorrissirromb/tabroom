package Tab::CircuitMembership;
use base 'Tab::DBI';
Tab::CircuitMembership->table('circuit_membership');
Tab::CircuitMembership->columns(Primary => qw/id/);
Tab::CircuitMembership->columns(Essential => qw/name circuit description approval_required region_required timestamp/);
Tab::CircuitMembership->has_a(circuit => "Tab::Circuit");
Tab::CircuitMembership->has_many(chapter_circuit_memberships => "Tab::ChapterCircuit", "circuit_membership");
__PACKAGE__->_register_datetimes( qw/timestamp/);
