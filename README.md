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

Copyright (C) 2014 Efren Aguirre <skeptoid@gmail.com>

This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See [License](https://github.com/countxyz/harmonize/blob/master/LICENSE.txt) for more details.

<hr>

<a href="http://www.wtfpl.net/"><img
       src="http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-4.png"
       width="80" height="15" alt="WTFPL" /></a>
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/countxyz/harmonize/trend.png)]
(https://bitdeli.com/free "Bitdeli Badge")


