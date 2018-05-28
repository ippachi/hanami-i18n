# frozen_string_literal: true

module Hanami::I18n
  module View
    # Translate specific word
    #
    # @param object_str [String] i18n string you want translate
    # @param options [Hash] i18n options
    #
    # @return [String] translated word
    #
    # @example
    # # apps/web/templates/users/index.html.erb
    # # en:
    # #   users:
    # #     index:
    # #       title: hello
    #
    # <%= t('.title') %> # => 'hello'
    # <%= t('users.index.title') %>  # => 'hello'
    #
    def t(object_str, options = {})
      if object_str[0] == '.'
        file_path = template.instance_variable_get(:@_template).file

        dir_structure = file_path.gsub(/\.html\..*/, '').split('/')

        index = dir_structure.index('templates')
        translation_path = dir_structure[index + 1..-1].join('.')
        options[:scope] = translation_path
      end

      I18n.t(object_str, options)
    end
  end
end
