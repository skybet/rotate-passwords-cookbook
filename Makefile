default : check kitchen

check : rubocop foodcritic

test : rubocop foodcritic kitchen

travis : check
	/opt/chefdk/bin/kitchen verify

rubocop :
	/opt/chefdk/embedded/bin/rubocop .

foodcritic :
	/opt/chefdk/embedded/bin/foodcritic -P -f any .

kitchen :
	/opt/chefdk/bin/kitchen test

.PHONY:
	travis test check rubocop foodcritic kitchen
