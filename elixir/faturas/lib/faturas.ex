defmodule Faturas do
@moduledoc """
  Este módulo executamos funções de faturas
"""
@doc """
  Ao receber `fatura`, retorna um array de fatura
    ## Exexmplos
    iex> Faturas.criar_faturas(["Telefone", "Agua", "Luz"])
"""
  def criar_faturas(faturas, _vencimentos) do
    for fatura <- faturas do
      fatura
    end
  end

@doc """
  Ao receber `fatura`, retorna um array de fatura
    ## Exexmplos
    iex> Faturas.ordenar_fatura(Faturas.criar_fatura(["Telefone", "Agua", "Luz"]))
    ["Agua", "Luz", "Telefone"]
"""

  def ordenar_fatura(fatura) do
    Enum.sort(fatura)
  end

@doc """
  Ao receber um objeto `faturas` e verifica se o elemento `fatura`, existe no
  objeto fatura
    ## Exexmplos
    iex> Faturas.fatura_existe?(Faturas.criar_fatura(["Telefone", "Agua", "Luz"]), "Luz")
    true
  """

  def fatura_existe?(faturas, fatura) do
    Enum.member?(faturas, fatura)
  end
end
