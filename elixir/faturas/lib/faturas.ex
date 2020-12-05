defmodule Faturas do
@moduledoc """
  Este módulo executamos funções de faturas
"""
@doc """
  Ao receber `fatura`, retorna um array de fatura
    ## Exexmplos
    iex> Faturas.criar_fatura(["Telefone", "Agua", "Luz"])
"""
  def criar_fatura(fatura) do
    fatura
  end

  def ordenar_fatura(fatura) do
    Enum.sort(fatura)
  end
end
