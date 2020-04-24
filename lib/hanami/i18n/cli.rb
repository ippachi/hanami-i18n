require 'fileutils'

module Hamami
  module I18n
    module CLI
      class Install < Hanami::CLI::Command
        def call(*)
          root = ::Hanami.root
          FileUtils.cp('../../../templates/locale.rb', root.join('config/locale.rb'))
        end
      end
    end
  end
end

::Hanami::CLI.register "i18n install", ::Hanami::I18n::CLI::Install
