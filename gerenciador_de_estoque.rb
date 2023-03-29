require "./erro_validacao.rb"
class GerenciadorDeEstoque
    def initialize
        @estoque = []
    end

    def cadastrar_veiculos(carro)
        raise ErroValidacao.new("Já existe um veículo cadastrado - Placa do veículo:#{carro.placa}") if @estoque.any? { |elemento| elemento[:placa] == carro.placa }
        @estoque << carro.to_hash
    end

    def ver_estoque
        @estoque.count
    end
end