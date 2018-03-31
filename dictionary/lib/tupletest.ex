defmodule TupleTest do
  def something({ a, b }) do
    { b, a }
  end

  def another(a, a) do
    true
  end

  def another(a, b) do
    false
  end
end