# Mu::AuthSudo
ruby gem that provides a wrapper for sparql client that overrules access rights of queries in mu.semte.ch through a mu-auth-sudo header.

Intended usage is within the [mu-ruby-template](https://github.com/mu-semtech/mu-ruby-template). If used outside of that template, make sure to set the `MU_SPARQL_ENDPOINT` environment variable.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mu-auth-sudo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mu-auth-sudo

## Usage

```
require 'mu/auth-sudo'

# include as a module
class yourClass
  include Mu::AuthSudo::Helpers
  
  def some_function
    update_sudo(%(
      INSERT DATA { 
        GRAPH <http://example.com/foo> { 
          <http://example.com/foo> a void:Dataset
        }
      }
    ))
    query_sudo("ASK { ?s ?p ?o}")
  end
end

# use static function
Mu::AuthSudo.sparql_client(options)
Mu::AuthSudo.query(query)
Mu::AuthSudo.update(query)
```

## Logging

The verbosity of logging can be configured through following environment variables:

- `LOG_SPARQL_ALL`: Logging of all executed SPARQL queries, read as well as update (default `true`)
- `LOG_SPARQL_QUERIES`: Logging of executed SPARQL read queries (default: `undefined`). Overrules `LOG_SPARQL_ALL`.
- `LOG_SPARQL_UPDATES`: Logging of executed SPARQL update queries (default `undefined`). Overrules `LOG_SPARQL_ALL`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/redpencilio/mu-auth-sudo-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mu::Auth::Sudo project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/redpencilio/mu-auth-sudo-ruby/blob/master/CODE_OF_CONDUCT.md).
