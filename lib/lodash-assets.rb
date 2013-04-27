require 'lodash-assets/version'

module LoDashAssets
  extend self

  require 'lodash-assets/lodash'
  require 'lodash-assets/tilt'

  DEFAULT_PATH_PREFIX = 'templates'.freeze
  DEFAULT_TEMPLATE_NAMESPACE = 'LoDashTemplates'.freeze
  DEFAULT_TEMPLATE_EXTENTIONS = %w( lodash_template ).freeze

  attr_writer :path_prefix, :template_extensions, :template_namespace

  def configure
    yield(self)
  end

  def path_prefix
    @path_prefix ||= DEFAULT_PATH_PREFIX
  end

  def template_namespace
    @template_namespace ||= DEFAULT_TEMPLATE_NAMESPACE
  end

  def template_extensions
    @template_extensions ||= DEFAULT_TEMPLATE_EXTENTIONS
  end

  ##
  # Register template extention(s) with Sprockets
  require 'sprockets'
  LoDashAssets.template_extensions.each do |ext|
    Sprockets.register_engine ".#{ext}", Tilt
  end
end
