require_relative './field'

module Avocado
  module Fields
    class HasManyField < Field
      def initialize(name, **args)
        super(name, args)

        @component = 'has-many-field'
      end

      def fetch_for_resource(resource, view)
        return if [:create, :index].include? view

        fields = super(resource)

        target_resource = App.get_resources.find { |r| r.class == "Avocado::Resources::#{name.to_s.singularize}".safe_constantize }
        fields[:relation_class] = target_resource.class.to_s
        fields[:path] = target_resource.url
        fields[:has_many_relationship] = target_resource.class.to_s

        fields
      end
    end
  end
end
