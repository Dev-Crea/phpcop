# encoding: utf-8
# frozen_string_literal: true

require 'phpcop/version'

require 'phpcop/configloader'
require 'phpcop/configstore'
require 'phpcop/cli'
require 'phpcop/runner'
require 'phpcop/rule'
require 'phpcop/cop'

require 'phpcop/cop/cop'
require 'phpcop/cop/psr-1/files/phptags'
require 'phpcop/cop/psr-1/files/phpencoding'
require 'phpcop/cop/psr-1/ccpm/methods'
require 'phpcop/cop/psr-1/ccpm/constants'
