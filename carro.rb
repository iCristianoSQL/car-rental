require "./cliente.rb"
require "./erro_validacao.rb"
require 'date'
# require "./reserva.rb"

class Carro
    @@Carros = []

    attr_accessor :fabricante, :modelo, :ano, :placa, :reservado, :locacao

    def initialize(fabricante, modelo, ano, placa, reservado = false, locacao = false)
        raise ErroValidacao.new("Já existe um carro com a placa #{placa}") if @@Carros.any? { |carro| carro[:placa] == placa }
        @fabricante = fabricante
        @modelo = modelo
        @ano = ano
        @placa = placa
        @reservado = reservado
        @locacao = locacao
        @@Carros << self.to_hash
    end

    def to_hash
        {
          fabricante: @fabricante,
          modelo: @modelo,
          ano: @ano,
          placa: @placa,
          reservado: @reservado,
          locacao: @locacao
        }
    end

    def self.lista_de_carros
        @@Carros
    end

    def self.quantidade_de_carros
        @@Carros.count
    end

    def self.remover_um_carro(placa)
        indice = @@Carros.find_index { |elemento| elemento[:placa] == placa }
        @@Carros.delete_at(indice) if indice
    end
end