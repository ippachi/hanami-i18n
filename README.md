# Hanami::I18n

It is a gem that integrates Hanami and i18n.

## Getting start

Add Gemfile

```ruby
gem 'hanami-i18n'
```

Next, put the initialization file of I18n in `config/locale.rb`.
Then place the locale file in any location.
*Important: `config/initalizers` will not work.*

例:

```ruby
# config/locale.rb
I18n.load_path << Dir[File.expand_path("config/locales") + "/*.yml"]
I18n.default_locale = :en # (note that `en` is already the default!)
```


```yaml
# config/locales/en.yml

en:
  models:
    attributes:
      user:
        name: "My name"
        email: "My E-mail"

  errors:
    filled?: "MUST be filled!"
```

Then it can be used as follows.

### form

```ruby
form_for :user, routes.users_path do
  label :name
  label :email
end
```

```html
<form>
  <label>My name</label>
  <label>My E-mail</label>
</form>
```

### validation

```ruby
params do
  required(:user).schema do
    required(:name).filled(:str?)
    required(:email).filled(:str?)
  end
end



params.errors(full: true) # => { user: {:email=>["My name MUST be filled!"], :post=>{:title=>["My E-mail MUST be filled!"]}} }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hanami-i18n. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Hanami::I18n project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hanami-i18n/blob/master/CODE_OF_CONDUCT.md).
