# Iter Module

defmodule Iter do
  @author "Meox"
  @email "glmeocci@gmail.com"

  #len on list
  def len([]), do: 0
  def len([_h | t]), do: 1 + len(t)
  def len(x..y), do: 1 + y - x

  #map
  def map([], _fun), do: []
  def map([h | t], fun), do: [fun.(h) | map(t, fun)]
  def map(x..y, fun), do: map(Enum.to_list(x..y), fun)

  #filter
  def filter([], _fun), do: []
  def filter([h | t], fun) do
    if fun.(h) do
      [h | filter(t, fun)]
    else
      filter(t, fun)
    end
  end

  #foldl and foldr
  def fold(l, f, c\\0)
  def fold([], _fun, c), do: c
  def fold([h | t], fun, c), do: fold(t, fun, fun.(h, c))

  def foldr(l, f, c\\0)
  def foldr([], _fun, c), do: c
  def foldr([h | t], fun, c), do: fun.(h, foldr(t, fun, c))


  def min([]), do: 0
  def min([h | t]), do: foldr([h|t], &(if &1 < &2, do: &1, else: &2), h)

  def max([]), do: 0
  def max([h | t]), do: foldr([h|t], &(if &1 > &2, do: &1, else: &2), h)


  def span(x, y) do
    if x <= y do
      [x | span(x+1, y)]
    else
      []
    end
  end

end


