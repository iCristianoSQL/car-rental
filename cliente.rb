require "./erro_validacao.rb"
class Cliente
  @@Clientes = []

  attr_accessor :nome, :cpf

  def initialize(nome, cpf)
      raise ErroValidacao.new("Já existe um cliente com o nome #{nome}") if @@Clientes.any? { |cliente| cliente[:cpf] == cpf }
      @nome = nome
      @cpf = cpf
      @@Clientes << self.to_hash
  end

  def to_hash
      {
        nome: @nome,
        cpf: @cpf,
      }
  end

  def self.lista_de_clientes
      @@Clientes
  end

  def self.quantidade_de_clientes
      @@Clientes.count
  end

  def self.remover_um_cliente(cpf)
      indice = @@Clientes.find_index { |elemento| elemento[:cpf] == cpf }
      @@Clientes.delete_at(indice) if indice
  end

  def self.alterar_nome_do_cliente(cpf, nome_novo)
    indice = @@Clientes.find_index { |elemento| elemento[:cpf] == cpf }
    @@Clientes[indice][:nome] = nome_novo if indice
  end
end