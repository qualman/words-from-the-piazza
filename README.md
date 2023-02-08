# Words from the Piazza
Author: Jason Qualman (@qualman)

## Setup
### Prerequisites
* Docker
* Ruby 3.2.0
* bundler 2.4.6

### Get ready
`cp .env.template .env`

### Start server
```
docker build -t wftp .
docker run -p 3000:3000 wftp
```

### Get a madlib
`curl 0.0.0.0:3000/madlib`

### Shutdown server
`Ctrl-C`

### Run tests
`bundle exec rspec`

### Run outside docker
`bundle exec rails s`

## Todo
### Short term
* Add/extend unit tests for
  * Madlib controller
  * Madlib model
  * Madlib fetcher requests
  * Madlib routing
* Add error handling for non-200 responses from Madlib word server
* Redirect visits to root address to `/madlib`

### Long term
* Add database/ActiveRecord usage, caching

# Thank you!
