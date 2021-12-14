defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings.
  ## Exemple:
      iex> Cards.create_deck
      ["one of A", "one of B", "one of C", "two of A", "two of B", "two of C", "three of A", "three of B", "three of C"]
  """
  def create_deck do
    tab1 = ["one", "two", "three"]
    tab2 = ["A", "B", "C"]

    for t1 <- tab1, t2 <- tab2 do
      "#{t1} of #{t2}"
    end
  end

  @doc """
    Take `list` of deck, and reorganize the order of the items.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Return `true` if card exist in the deck, `false` if not.
  """
  def contains?(deck, item) do
    Enum.member?(deck, item)
  end

  @doc """
    Return a tuple
  """
  def deal(deck, size) do
    Enum.split(deck, size)
  end

  @doc """
    Create and save a list of cards into a file
  """
  def save(deck, file_name) do
    bin = :erlang.term_to_binary(deck)
    File.write(file_name, bin)
  end

  @doc """
    Read cards from file
  """
  def load(file_name) do
    case File.read(file_name) do
      {:ok, bin} -> :erlang.binary_to_term(bin)
      {:error, _} -> "File does not exist!"
    end
  end

  @doc """
    Create a hand with specific size.
  """
  def create_hand(size) do
    create_deck
    |> shuffle
    |> deal(size)
  end
end
