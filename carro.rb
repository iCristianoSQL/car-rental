class Carro
    @@Carros = []

    attr_accessor :fabricante, :modelo, :ano, :placa, :reservado

    def initialize(fabricante, modelo, ano, placa)
        @fabricante = fabricante
        @modelo = modelo
        @ano = ano
        @placa = placa
        @reservado = false
        @@Carros << self.to_hash
    end

    def to_hash
        {
          fabricante: @fabricante,
          modelo: @modelo,
          ano: @ano,
          placa: @placa,
          reservado: @reservado
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

    def reservar 
        @reservado = true
    end
end

Carro.new('Honda', 'Fit', 2018, 'RAR-2803').reservar
Carro.new('Renault', 'Duster', 2016, 'ACA-1981')
Carro.new('Volkswagen', 'Kombi', 2000, 'SOF-5505')
Carro.new('Nissan', 'kicks', 2017, 'JAV-0101')
Carro.new('Toyota', 'Corolla', 2020, 'SCR-1010')

p Carro.lista_de_carros