# Compass Quiz

App for managing question banks and delivering quizzes to Lighthouse 
Labs students.

Compass Quiz is a Ruby on Rails app, and uses mostly conventional 
features to provide an interface to CRUD operations for managing data
related to building and delivering quizzes.

## Setup

Run `bin/bundle install`.

Create a `config/database.yml` file that points to your desired 
development and test databases. For example:

```yaml
default: &default
  adapter: postgresql
  database: compass_quiz
  pool: 5
  timeout: 5000

development:
  <<: *default

test:
  <<: *default
  database: compass_quiz_test
```

Run `bin/rake db:setup` to load the schema.

Run `bin/rake db:seed` and a default administrator user will be 
created.

Run `bin/rails s` to start the Rails server or `bin/guard` to run the
app with automated tests.

Confirm that the app is running on `http://localhost:3000/` and sign in
with email address `admin@example.com` and password `admin`.

## Running the tests

Tests use RSpec and are configured to run using `bin/rspec` or
[Guard](https://github.com/guard/guard#readme). Run `bin/guard` during
development to watch files and run tests automatically.

## Contributing

Submit pull requests to 
[this repository](https://github.com/lighthouse-labs/compass-quiz).

Issues and enhancements are tracked via GitHub Issues. Please see the 
[Issues page](https://github.com/lighthouse-labs/compass-quiz/issues) 
to discuss contributions.

## License

Compass Quiz - Academic Quiz Management and Delivery Software

Copyright (C) 2016  Lighthouse Labs

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
