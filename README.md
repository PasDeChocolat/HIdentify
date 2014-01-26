# HIdentify - A Hawai‘i community tech project.

### I'm just here for the JSON data.

OK, you can just [download a gzipped version](https://github.com/PasDeChocolat/HIdentity/raw/master/data/contributions.json.gz) (4.7M, just under 82,000 records). This is taken directly from the Data.Hawaii.gov's [Campaign Contributions Received By Hawaii State and County Candidates From November 8, 2006 Through December 31, 2013](https://data.hawaii.gov/Community/Campaign-Contributions-Received-By-Hawaii-State-an/jexd-xbcg) dataset.

### Things you need to run this Rails app:
* Ruby 2.1.0 (I suggest you use [RBEnv](https://github.com/sstephenson/rbenv))
* Bundle install all the gems

```` bash
$ bundle install
````

* All the data is in the "data" directory, you need to ungzip it

```` bash
$ gunzip data/contributions.json.gz
````

* You should have Postgres running
* Database creation and setup

````
$ rake db:create
$ rake db:migrate
$ rake import:contributions
````


### Help Wanted

* We need to prototype the UI used to associate "aliases" to "persons."
* We need an algorithm to rank prospective "aliases" as probably matches to "persons."
* We need volunteers with an interest in the data to associate contributions with aliases and unique persons. This is a research task, requiring people to use alternative forms of verification (name, address, occupation, etc.).
* We need to webify this application (adding users, authentication, logging, undo, etc.).

# LICENSE

I'm using the [WTFPL](http://www.wtfpl.net "WTF Public License") for now. 

Copyright © 2014 Pas de Chocolat, LLC.
This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See the COPYING file for more details.

This program is free software. It comes without any warranty, to
* the extent permitted by applicable law. You can redistribute it
* and/or modify it under the terms of the Do What The Fuck You Want
* To Public License, Version 2, as published by Sam Hocevar. See
* http://www.wtfpl.net/ for more details.