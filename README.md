# eslintrb
[![Build Status](https://secure.travis-ci.org/zendesk/eslintrb.png?branch=master)](http://travis-ci.org/zendesk/eslintrb)

Forked from [jshintrb](https://github.com/stereobooster/jshintrb) who did all the hard work.

Ruby wrapper for [ESLint](https://github.com/eslint/eslint/). The main difference from [eslint](https://github.com/liquid/eslint_on_rails) it does not depend on Java. Instead it uses [ExecJS](https://github.com/sstephenson/execjs).

## Installation

`eslintrb` is available as ruby gem.

    $ gem install eslintrb

Ensure that your environment has a JavaScript interpreter supported by [ExecJS](https://github.com/sstephenson/execjs). Usually, installing `therubyracer` gem is the best alternative.

## Usage

```ruby
require 'eslintrb'

Eslintrb.lint(File.read("source.js"), :defaults)
# => array of warnings

Eslintrb.report(File.read("source.js"), :defaults)
# => string
```

Or you can use it with rake

```ruby
require "eslintrb/eslinttask"
Eslintrb::EslintTask.new :eslint do |t|
  t.pattern = 'javascript/**/*.js'
  t.options = :defaults
end
```

When initializing `eslintrb`, you can pass options

```ruby
Eslintrb::Lint.new('no-undef' => true).lint(source)
# Or
Eslintrb.lint(source, 'no-undef' => true)
```

[List of all available options](http://eslint.org/docs/rules/)

If you pass `:defaults` as option, it is the same as if you pass following

```
{
  rules: {
    'no-bitwise' => 2,
    'curly' => 2,
    'eqeqeq' => 2,
    'guard-for-in' => 2,
    'no-use-before-define' => 2,
    'no-caller' => 2,
    'no-new-func' => 2,
    'no-plusplus' => 2,
    'no-undef' => 2,
    'strict' => 2
  },
  env: {
    'browser' => true
  }
}
```

If you pass `:eslintrc` as option, `.eslintrc` file is loaded as option.

## TODO

 - add more tests
 - add color reporter. Maybe [colorize](https://github.com/fazibear/colorize)
 - add cli. Support same options as [eslint/eslint](https://github.com/eslint/eslint/blob/master/lib/cli.js)
