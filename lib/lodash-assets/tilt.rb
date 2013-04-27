require 'tilt'

module LoDashAssets
  class Tilt < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def evaluate(scope, locals, &block)
      template_namespace = LoDashAssets.template_namespace
      template_name = scope.logical_path.gsub(%r{\A#{LoDashAssets.path_prefix}/}, '')

      compiled_template = LoDash.compile(data)

      <<-TEMPLATE
        this.#{template_namespace} || (this.#{template_namespace} = {});
        this.#{template_namespace}[#{template_name.inspect}] = #{compiled_template};
      TEMPLATE
    end

    def prepare; end
  end
end
