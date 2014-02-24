# Harmonize

## About

A CRM (Client-Relationship Manager) built on Rails.

## View Progress

http://harmonize.herokuapp.com/

## Install

```bash
git clone git@github.com:countxyz/harmonize.git
cd harmonize
cp config/database.postgres.yml config/database.yml
bundle install
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake assets:precompile
RAILS_ENV=production bundle exec rails server
```

## License

->DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE<-
->Version 2, December 2004<-

 Copyright (C) 2014 Efren Aguirre <skeptoid@gmail.com>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

 ->DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE<-
 ->TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION<-

  0. You just DO WHAT THE FUCK YOU WANT TO.

<a href="http://www.wtfpl.net/"><img
       src="http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-4.png"
       width="80" height="15" alt="WTFPL" /></a>
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/countxyz/harmonize/trend.png)]
(https://bitdeli.com/free "Bitdeli Badge")


