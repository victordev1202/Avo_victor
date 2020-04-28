module Avocado
  module Fields
    class Field
      attr_reader :name
      attr_reader :component
      attr_reader :can_be_updated

      def initialize(*args)
        @name = args.first
        @component = 'field'
        @can_be_updated = true
      end

      def id
        name.to_s.parameterize
      end

      def fetch_for_resource(resource)
        fetch_fields resource
      end

      # def fetch_for_resource_model(resource_model)
      #   fetch_fields resource_model
      # end

      def fetch_fields(resource)
        is_class = false
        is_model = false

        if resource.class == String
          is_class = true
        else
          is_model = true
        end

        fields = {
          id: id,
          name: name,
          component: component,
          can_be_updated: can_be_updated
        }

        fields[:value] = resource[id] if is_model

        fields
      end
    end
  end
end
