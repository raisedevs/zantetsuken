# Zantetsuken

The Content Security Policy (CSP) initializer in Rails can get cluttered
fast. Break it down with the help of this gem.

## Installation

Add `gem 'zantetsuken'` to your Gemfile and run `bundle install`.
Alternatively, install the gem directly by calling `gem install
zantetsuken` in your shell.

## Usage

Update `config/initializer/content_security_policy` to include the
following:

```ruby
Dir[Rails.root.join('app/lib/zantetsuken/**/*.rb').to_s].sort.each { |file| require file }
Rails.application.config.content_security_policy do |policy|
  Zantetsuken.load(policy)
end
```

This will compose any rulesets you've defined under the
`Zantetsuken::Ruleset` module into a single
`ActionDispatch::ContentSecurityPolicy`, which is what Rails uses under
the hood to build your CSP.

### Defining rulesets

You should define your rulesets under
`app/lib/zantetsuken/ruleset`. Here's an example:

```ruby
# app/lib/zantetsuken/ruleset/stripe/js.rb

# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    module Stripe
      # Used for loading Stripe's JS library.
      class Js < Base
        ruleset do
          self.connect_src = 'https://api.stripe.com'
          self.frame_src   = 'https://js.stripe.com', 'https://hooks.stripe.com'
          self.script_src  = 'https://js.stripe.com'
        end
      end
    end
  end
end
```

You should inherit from `Zantetsuken::Ruleset::Base` so that the ruleset can be
composed with others.

## Contributing

Contributions are welcome by way of a pull request. Pull requests with
failing test cases are preferable to issues, if you feel comfortable
doing that.
