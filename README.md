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

### Work in Progress

A project doesn't warrant your attention until the person(s) proposing it has, at least, started sketching it out.

Here are our sketches...

#### Hack Day 1
![Project Goals](https://raw.github.com/PasDeChocolat/HIdentify/master/work/whiteboard_hack_day_1.png)
From January 26, 2014

#### Hack Day 2
![Bespoke User Interface (for Doug)](https://raw.github.com/PasDeChocolat/HIdentify/master/work/whiteboard_hack_day_2.jpg)
From February 12, 2014

# LICENSE

HIdentify - An app for linking contributions to actual, IRL humans.
Copyright © 2014 Pas de Chocolat, LLC.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
