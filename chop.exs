defmodule Chop do

  def guess(guessed \\ :none, to_guess, ranges)

  def guess(guessed, to_guess, ranges) when guessed == :none do
    generic_guess(to_guess, ranges)
  end

  def guess(guessed, to_guess, _) when guessed == to_guess do
    IO.puts "Yuppi: #{guessed}"
  end

  def guess(guessed, to_guess, ranges) when guessed > to_guess do
    min.._ = ranges
    generic_guess(to_guess, min..guessed)
  end

  def guess(guessed, to_guess, ranges) when guessed < to_guess do
    _..max = ranges
    generic_guess(to_guess, guessed..max)
  end

  defp generic_guess(to_guess, ranges) do
    min..max = ranges
    v = min + div(max - min, 2)
    IO.puts "Is it #{v}"
    guess(v, to_guess, min..max)
   end

end

