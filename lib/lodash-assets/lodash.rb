require 'execjs'

module LoDashAssets
  module LoDash
    extend self

    def compile(source, options = {})
      context.eval("_.template(#{source.chomp.inspect}).source")
    end

    private

    def context
      @context ||= ExecJS.compile(source)
    end

    def source
      @source ||= File.read(path)
    end

    def path
      @path ||= File.join(assets_path, 'javascripts', 'lodash.js')
    end

    def assets_path
      @assets_path ||= File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'vendor', 'assets'))
    end
  end
end
