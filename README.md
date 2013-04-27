# LoDashAssets

**LoDashAssets** compiles your [Lo-Dash](http://lodash.com/docs#template) templates in your [Sprockets](https://github.com/sstephenson/sprockets) environment.

Templates are compiled using [lodash.js 1.2.0](https://raw.github.com/bestiejs/lodash/v1.2.0/dist/lodash.js).

## Installation

Add this line to your `Gemfile`:

    gem 'lodash-assets'

And then execute:

    $ bundle

## Usage

```ruby
LoDashAssets.configure do |config|
  config.path_prefix = 'templates'
  config.template_extensions = %w( lodash_template )
  config.template_namespace = 'LoDashTemplates'
end
```

```javascript
  LoDashTemplates['admin/setting'](data); // Renders templates/admin/settings.lodash_template
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
