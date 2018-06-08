# Hanami::I18n

This gem provide i18n for hanami

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hanami-i18n'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hanami-i18n

## Usage

### Prepare locales file

In your hanami application, you should prepare locales file to `config/locale`.

```yml
ja: # config/locale/ja.yml
  model:
    entities:
      user: ユーザー
      book: 本
    attributes:
      user:
        name: 名前
        email: メールアドレス
      book:
        title: タイトル
        auther: 著者

```

### Initialize I18n

In your initializers, you should set available locales and load path.

```ruby
# config/initializers/i18n.rb

I18n.available_locales = [:ja, :en]
I18n.default_locale = :ja
I18n.load_path += Dir[Hanami.root.join('config', 'locale', '*.{rb,yml}')]

```

and you can use i18n in your application!

## Form

In your view, if you defined yml file above, you can use translation in your form label.

```rhtml
<%=
  form_for :user routes.user_path do
    label :name # => 名前
    text_field :name

    label :email # => メールアドレス
    text_field :email
  end
%>
```

## View

```rhtml
<%= Book.t %> <% # => 本 %>
<%= Book.t(:title) %> <% # => タイトル %>
<%= Book.t(:auther) %> <% # => 著者 %>

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hanami-i18n. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Hanami::I18n project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hanami-i18n/blob/master/CODE_OF_CONDUCT.md).
