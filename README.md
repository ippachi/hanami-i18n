# Hanami::I18n

Hanamiとi18nを統合するgemです。

## Getting start

Gemfileに追加します。

```ruby
gem 'hanami-i18n'
```

次に `config/locale.rb` にI18nの初期化のファイルを設置します。
その後任意の場所にlocaleファイルを設置します。
重要: `config/initalizers` では動作しません。

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
        name: "Name"
        email: "E-mail"

  errors:
    filled?: "MUST be filled!"
```

そうすると以下のように使用できるようになります。

### form

```ruby
form_for :user, routes.users_path do
  label :email
end
```

```html
<form>
  <label>E-mail</label>
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

params.error_messages # => ["Name MUST be filled!", "E-mail MUST be filled!"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hanami-i18n. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Hanami::I18n project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hanami-i18n/blob/master/CODE_OF_CONDUCT.md).
