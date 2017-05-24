package Tab::File;
use base 'Tab::DBI';
Tab::File->table('file');
Tab::File->columns(All => qw/id label filename type published coach uploaded 
								tourn school event circuit webpage parent timestamp/);
Tab::File->has_a(school => 'Tab::School');
Tab::File->has_a(event => 'Tab::Event');
Tab::File->has_a(tourn => 'Tab::Tourn');
Tab::File->has_a(parent => 'Tab::File');
Tab::File->has_a(circuit => 'Tab::Circuit');
Tab::File->has_a(webpage => 'Tab::Webpage');

Tab::File->has_many(children => 'Tab::File', 'parent');

__PACKAGE__->_register_datetimes( qw/uploaded timestamp/);

