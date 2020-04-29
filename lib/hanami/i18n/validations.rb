module Hanami
  module I18n
    module Validations
      module Settings
        def self.prepended(klass)
          klass.singleton_class.alias_method :_included, :included
          klass.singleton_class.prepend ClassMethods
        end

        module ClassMethods
          def included(klass)
            _included(klass)

            klass.messages :i18n
          end
        end
      end

      module MessageCompiler
        def message_text(rule, template, tokens, opts)
          model_name = (opts.path - [rule]).last
          rule = ::I18n.t("models.attributes.#{model_name}.#{rule}", default: nil) ||
                 ::I18n.t("models.entities.#{rule}", default: nil) ||
                 rule

          super(rule, template, tokens, opts)
        end
      end
    end
  end
end

module Hanami
  module Validations
    prepend Hanami::I18n::Validations::Settings
  end
end

module Dry
  module Validation
    class MessageCompiler
      prepend Hanami::I18n::Validations::MessageCompiler
    end
  end
end
