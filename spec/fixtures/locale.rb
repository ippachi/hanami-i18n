require 'i18n'

I18n.load_path << Dir[File.expand_path("spec/fixtures/locales") + "/*.yml"]
I18n.default_locale = :en
