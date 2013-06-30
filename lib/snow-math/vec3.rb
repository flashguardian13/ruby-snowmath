# This file is part of ruby-snowmath.
# Copyright (c) 2013 Noel Raymond Cower. All rights reserved.
# See COPYING for license details.

require 'snow-math/bindings'

module Snow ; end

if Snow.const_defined?(:Vec3Array)
  class Snow::Vec3Array
    class << self ; alias_method :[], :new ; end

    alias_method :[], :fetch
    alias_method :[]=, :store
  end
end

class Snow::Vec3

  # Shortcut through to new
  class << self ; alias_method :[], :new ; end

  alias_method :[], :fetch
  alias_method :[]=, :store

  def x
    self[0]
  end

  def x=(value)
    self[0] = value
  end

  def y
    self[1]
  end

  def y=(value)
    self[1] = value
  end

  def z
    self[2]
  end

  def z=(value)
    self[2] = value
  end

  def dup
    self.class.new(self)
  end

  def normalize!
    normalize self
  end

  def inverse!
    inverse self
  end

  def negate!
    negate self
  end

  def cross_product!(rhs)
    cross_product rhs, self
  end

  def multiply_vec3!(rhs)
    multiply_vec3 rhs, self
  end

  def multiply(rhs, output = nil)
    case rhs
    when Vec3 then multiply_vec3(rhs, output)
    when Numeric then scale(rhs, output)
    else raise TypeError, "Invalid type for RHS"
    end
  end

  def multiply!(rhs)
    multiply rhs, self
  end

  def add!(rhs)
    add rhs, self
  end

  def subtract!(rhs)
    subtract rhs, self
  end

  def scale!(rhs)
    scale rhs, self
  end

  def divide!(rhs)
    divide rhs, self
  end

  alias_method :-, :subtract
  alias_method :+, :add
  alias_method :^, :cross_product
  alias_method :**, :dot_product
  alias_method :*, :multiply
  alias_method :/, :divide
  alias_method :-@, :negate
  alias_method :~, :inverse

end
