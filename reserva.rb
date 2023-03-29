require "./cliente.rb"
require "./erro_validacao.rb"
require "./carro.rb"
require "date"

class Reserva 
    @@Reservas = []

    attr_accessor :carro, :cliente, :data_inicio, :data_fim

    def initialize(carro, cliente, data_inicio, data_fim)
        @cliente = cliente
        @data_inicio = data_inicio
        @data_fim = data_fim
        @carro = carro
        @@Reservas << self.to_hash
    end

    def to_hash
        {
          carro: @carro,
          cliente: @cliente,
          data_inicio: @data_inicio,
          data_fim: @data_fim  
        }
    end

    def self.ver_reservas
        @@Reservas
    end

    def self.quantidade_de_reservas
        @@Reservas.count
    end

    def self.reservar(cpf_do_cliente, carro, data_inicio, data_fim)
        lista_de_carros = Carro.lista_de_carros
        lista_de_clientes = Cliente.lista_de_clientes

        indice_carro = lista_de_carros.find_index { |elemento| elemento[:placa] == carro }
        indice_cliente = lista_de_clientes.find_index { |elemento| elemento[:cpf] == cpf_do_cliente }
        raise ErroValidacao.new("Não existe um cliente cadastrado com o documento #{cpf_do_cliente}") if indice_cliente == nil
        raise ErroValidacao.new("Não existe um carro cadastrado com a placa #{carro}") if indice_carro == nil
        raise ErroValidacao.new("Já existe uma reserva para este veiculo") if lista_de_carros[indice_carro][:reservado] == true
        lista_de_carros[indice_carro][:reservado] = true
        lista_de_carros[indice_carro][:locacao] = false
        Reserva.new(lista_de_carros[indice_carro], lista_de_clientes[indice_cliente], data_inicio, data_fim).to_hash
    end

    def self.alugar(carro)
       p indice_carro = @@Reservas.find_index { |elemento| elemento[:placa] == carro }
        @@Reservas[indice_carro][:reservado] = false if indice_carro
        @@Reservas[indice_carro][:locacao] = true if indice_carro
    end
end

Carro.new('Honda', 'Fit', 2018, 'RAR-2803')
Cliente.new("Klaus", "68547125365")

Reserva.reservar("68547125365", "RAR-2803", "data_inicio", "data_fim")