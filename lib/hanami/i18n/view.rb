# frozen_string_literal: true

module Hanami::I18n
  module View
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
