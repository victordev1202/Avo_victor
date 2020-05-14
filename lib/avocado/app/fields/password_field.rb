require_relative './field'

module Avocado
  module Fields
    class PasswordField < TextField
      def initialize(name, **args, &block)
        super(name, **args, &block)

        @component = 'password-field'
      end
    end
  end
end
