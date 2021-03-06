defmodule Faturas do
  @moduledoc """
    Este módulo executamos funções de faturas
  """
  @doc """
    Ao receber `fatura`, retorna um array de fatura
      ## Exexmplos
      iex> Faturas.criar_faturas(["Telefone", "Agua", "Luz"], [5, 10])
      [["Telefone", "Agua", "Luz"], ["Telefone", "Agua", "Luz"]]
  """
  def criar_faturas(faturas, vencimentos) do
    for vencimento <- vencimentos, fatura <- faturas do
      %Fatura.Conta{vencimento: vencimento, fatura: fatura}
    end
  end

  @doc """
    Ao receber `faturas` (faturas a serem pagas), e a `quantidade` de faturas
    a serem pagas, retorna uma lista com as faturas a serem pagas, com valor e 
    data de vencimento
      ## Exexmplos
      iex> faturas = Faturas.criar_faturas(["Telefone", "Agua", "Luz"], [5, 10])
      iex> Faturas.faturas_a_pagar(faturas, 1)
      ["Fatura: Telefone, com vencimento: 5"]
  """

  def faturas_a_pagar(faturas, quantidade) do
    {a_pagar, _restante_das_contas} = Enum.split(faturas, quantidade)
    a_pagar
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

  def pagar_faturas(faturas, vencimento, quantidade) do
    criar_faturas(faturas, vencimento)
    |> ordenar_fatura
    |> faturas_a_pagar(quantidade)
  end

  @doc """
    
  """
  def save(n_arquivo, faturas) do
    binario = :erlang.term_to_binary(faturas)
    File.write(n_arquivo, binario)
  end

  @doc """
    
  """
  def load(nome_arquivo) do
    case File.read(nome_arquivo) do
      { :ok, binario } -> :erlang.binary_to_term binario
      { :error, _status } -> "Não foi possível abrir o arquivo especificado"
    end
  end
end
