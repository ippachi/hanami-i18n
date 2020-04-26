require 'dry/inflector'

module Hanami
  module I18n
    module Form
      def self.prepended(_klass)
        private :_i18n_content, :_model_name
      end

      def label(content = nil, **attributes, &blk)
        attributes[:for] ||= content
        super(_i18n_content(content), **attributes, &blk)
      end

      def _i18n_content(content)
        ::I18n.t("models.attributes.#{_model_name}.#{content}",
                 default: nil) || content
      end

      def _model_name
        model = @name.to_s
                     .gsub('[', '.')
                     .delete(']')
                     .split('.')
                     .last
        Dry::Inflector.new.singularize(model)
      end
    end
  end
end

module Hanami
  module Helpers
    module FormHelper
      class FormBuilder
        prepend Hanami::I18n::Form
      end
    end
  end
end
