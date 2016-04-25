# encoding: utf-8
# frozen_string_literal: true

require 'phpcop/version'

require 'phpcop/configloader'
require 'phpcop/configstore'
require 'phpcop/cli'
require 'phpcop/runner'
require 'phpcop/rule'

require 'phpcop/cop/cop.rb'
require 'phpcop/cop/files/phptags.rb'
require 'phpcop/cop/files/phpencoding.rb'
require 'phpcop/cop/ccpm/methods.rb'
require 'phpcop/cop/ccpm/constants.rb'
