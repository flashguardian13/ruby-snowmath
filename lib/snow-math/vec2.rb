# This file is part of ruby-snowmath.
# Copyright (c) 2013 Noel Raymond Cower. All rights reserved.
# See COPYING for license details.

require 'snow-math/bindings'

module Snow ; end

if Snow.const_defined?(:Vec2Array)
  #
  # A contiguous array of Vec2s. Allocated as a single block of memory so that
  # it can easily be passed back to C libraries (like OpenGL) and to aid with
  # cache locality.
  #
  # Useful also to represent texture coordinates and 2D positions and
  # displacements.
  #
  class Snow::Vec2Array
    class << self ; alias_method :[], :new ; end

    alias_method :[], :fetch
    alias_method :[]=, :store
  end
end

#
# A 2-component vector class.
#
class Snow::Vec2

  class << self ; alias_method :[], :new ; end

  alias_method :[], :fetch
  alias_method :[]=, :store
  alias_method :dup, :copy
  alias_method :clone, :copy


  def to_vec2
    Vec2.new(self)
  end

  def to_vec3
    Vec3.new(self)
  end

  def to_vec4
    Vec4.new(self)
  end

  def to_quat
    Quat.new(self)
  end

  # Returns the X component of the vector.
  #
  # call-seq: x -> float
  def x
    self[0]
  end

  # Sets the X component of the vector.
  #
  # call-seq: x = value -> value
  def x=(value)
    self[0] = value
  end

  # Returns the Y component of the vector.
  #
  # call-seq: y -> float
  def y
    self[1]
  end

  # Sets the Y component of the vector.
  #
  # call-seq: y = value -> value
  def y=(value)
    self[1] = value
  end

  # Calls #normalize(self)
  #
  # call-seq: normalize! -> self
  def normalize!
    normalize self
  end

  # Calls #inverse(self)
  #
  # call-seq: inverse! -> self
  def inverse!
    inverse self
  end

  # Calls #negate(self)
  #
  # call-seq: negate! -> self
  def negate!
    negate self
  end

  # Calls #multiply_vec2(rhs, self)
  #
  # call-seq: multiply_vec2!(rhs) -> self
  def multiply_vec2!(rhs)
    multiply_vec2 rhs, self
  end

  # Calls #multiply_vec2 and #scale, respectively.
  #
  # call-seq:
  #     multiply(vec2, output = nil) -> output or new vec2
  #     multiply(scalar, output = nil) -> output or new vec2
  def multiply(rhs, output = nil)
    case rhs
    when ::Snow::Vec2, ::Snow::Vec3, ::Snow::Vec4, ::Snow::Quat then multiply_vec2(rhs, output)
    when Numeric then scale(rhs, output)
    else raise TypeError, "Invalid type for RHS"
    end
  end

  # Calls #multiply(rhs, self)
  #
  # call-seq: multiply!(rhs) -> self
  def multiply!(rhs)
    multiply rhs, self
  end

  # Calls #add(rhs, self)
  #
  # call-seq: add!(rhs) -> self
  def add!(rhs)
    add rhs, self
  end

  # Calls #subtract(rhs, self)
  #
  # call-seq: subtract!(rhs) -> self
  def subtract!(rhs)
    subtract rhs, self
  end

  # Calls #scale(rhs, self)
  #
  # call-seq: scale!(rhs) -> self
  def scale!(rhs)
    scale rhs, self
  end

  # Calls #divide(rhs, self)
  #
  # call-seq: divide!(rhs) -> self
  def divide!(rhs)
    divide rhs, self
  end


  alias_method :-, :subtract
  alias_method :+, :add
  alias_method :*, :multiply
  alias_method :/, :divide
  alias_method :**, :dot_product
  alias_method :-@, :negate
  alias_method :~, :inverse

end
