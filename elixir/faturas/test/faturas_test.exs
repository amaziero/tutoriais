defmodule FaturaTest do
  use ExUnit.Case
  doctest Faturas

  test "deve criar uma lista de faturas" do
    faturas = Faturas.criar_fatura(["Agua", "Telefone", "Luz"])
    assert faturas == ["Agua", "Telefone", "Luz"]
  end

  test "deve devolver uma lista ordenada de faturas" do
    faturas = Faturas.criar_fatura(["Agua", "Telefone", "Luz"])
    refute Faturas.ordenar_fatura(faturas) == ["Agua", "Telefone", "Luz"]
  end
end
