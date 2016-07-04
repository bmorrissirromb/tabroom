package Tab::Student;
use base 'Tab::DBI';
Tab::Student->table('student');
Tab::Student->columns(Primary => qw/id/);
Tab::Student->columns(Essential => qw/person first middle last chapter novice grad_year retired gender person_request diet/);
Tab::Student->columns(Other => qw/timestamp phonetic race birthdate school_sid ualt_id/);
Tab::Student->columns(TEMP => qw/code entry event school region/);

Tab::Student->has_a(chapter => 'Tab::Chapter');
Tab::Student->has_a(person => 'Tab::Person');
Tab::Student->has_a(person_request => 'Tab::Person');

Tab::Student->has_many(entries => [Tab::EntryStudent => 'entry']);
Tab::Student->has_many(entry_students => 'Tab::EntryStudent', 'student');

__PACKAGE__->_register_datetimes( qw/timestamp/);
__PACKAGE__->_register_dates( qw/birthdate/);


sub housing { 
	my ($self, $tourn, $day) = @_;
	my @housings = Tab::Housing->search( student => $self->id, tourn => $tourn->id, night => $day->ymd ) if $day;
	@housings = Tab::Housing->search( student => $self->id, tourn => $tourn->id ) unless $day;
	return shift @housings if $day;
	return @housings;
}

sub fullname { 
	my $self = shift;
	return $self->first." ".$self->middle." ".$self->last if $self->middle;
	return $self->first." ".$self->last;
}
