defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  def bank(balance) do
    receive do
      { sender, :balance } ->
        send sender, { :ok, balance }
        bank(balance)
      { :update, amount } ->
        bank(balance + amount)
      { :shutdown } ->
        exit(:normal)
    end
  end

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    spawn(BankAccount, :bank, [ 0 ])
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    send account, { :shutdown }
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    send account, { self, :balance }
    receive do
      { :ok, balance } ->
        balance
    end
  end
  
  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    send account, { :update, amount }
  end
end
