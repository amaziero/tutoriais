defmodule Fatura do
  def criar_fatura do
    ["Telefone", "Lux", "Agua"]
  end

  def ordenar_faturas(fatura) do
    Enum.sort(fatura)
  end
end
