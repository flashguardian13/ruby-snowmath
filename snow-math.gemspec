# This file is part of ruby-snowmath.
# Copyright (c) 2013 Noel Raymond Cower. All rights reserved.
# See COPYING for license details.

Gem::Specification.new { |s|
  s.name        = 'snow-math'
  s.version     = '0.0.1'
  s.date        = '2013-06-25'
  s.summary     = 'Snow Math Types'
  s.description = 'Math types built on the SnowPalm math code'
  s.authors     = [ 'Noel Raymond Cower' ]
  s.email       = 'ncower@gmail.com'
  s.files       = Dir.glob('lib/**/*.rb') +
                  Dir.glob('ext/**/*.{c,h,rb}')# +
                  # [ 'COPYING', 'README.md' ]
  s.extensions << 'ext/extconf.rb'
  s.homepage    = 'https://github.com/nilium/ruby-snowmath'
  s.license     = 'Simplified BSD'
  s.rdoc_options << '--title' << 'snowmath -- 3D Math Types' <<
                    '--main' << 'README.md' <<
                    '--line-numbers'
}
