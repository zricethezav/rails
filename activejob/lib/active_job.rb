# frozen_string_literal: true

#--
# Copyright (c) 2014-2022 David Heinemeier Hansson
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

require "active_support"
require "active_support/rails"
require "global_id"
require "zeitwerk"

Zeitwerk::Loader.for_gem.tap do |loader|
  loader.ignore(
    "#{__dir__}/rails",
    "#{__dir__}/active_job/errors.rb",
    "#{__dir__}/active_job/gem_version.rb",
    "#{__dir__}/active_job/railtie.rb"
  )

  loader.do_not_eager_load(
    "#{__dir__}/active_job/queue_adapters",
    "#{__dir__}/active_job/test_helper.rb",
    "#{__dir__}/active_job/test_case.rb"
  )
end.setup

module ActiveJob
  require_relative "active_job/errors"
end
