require "./carro.rb"
require "./cliente.rb"
require "./reserva.rb"
require "./erro_validacao.rb"

describe "Locação de veiculos" do
    ##Carros Disponiveis
    Carro.new('Honda', 'Fit', 2018, 'RAR-2803')
    Carro.new('Renault', 'Duster', 2016, 'ACA-1981')
    Carro.new('Volkswagen', 'Kombi', 2000, 'SOF-5505')
    Carro.new('Nissan', 'kicks', 2017, 'JAV-0101')
    Carro.new('Toyota', 'Corolla', 2020, 'SCR-1010') #Este carro está reservado

    Cliente.new("Cristiano", "97045824632")
    Cliente.new("Klaus", "68547125365")
    Cliente.new("Daniel", "27693174925")
    Cliente.new("Samuel", "13572750990")
    Cliente.new("Xita", "46228302534")

    data_inicio = Date.today.strftime("%d/%m/%Y")
    date = Date.today + 15
    data_fim = date.strftime("%d/%m/%Y")

    context "Cadastro de veiculo" do
        it "Devo poder cadastrar um veiculo no estoque" do
            expect(Carro.quantidade_de_carros).to eq(5)
        end

        it "Devo poder remover um veiculo no estoque" do
            Carro.remover_um_carro('ACA-1981')
            expect(Carro.quantidade_de_carros).to eq(4)
        end

        it "Devo poder reservar um carro disponivel" do
            Reserva.reservar("97045824632", "SCR-1010", data_inicio, data_fim)
            expect(Reserva.quantidade_de_reservas). to eq(1)
        end

        it "Não devo conseguir reservar um veiculo já reservado" do
            expect { Reserva.reservar("97045824632", "SCR-1010", data_inicio, data_fim) }.to raise_error(ErroValidacao)
        end
    end

    context "Cadastro de clientes" do
        it "Devo poder cadastrar um cliente no sistema" do
            expect(Cliente.quantidade_de_clientes). to eq(5)
        end

        it "Devo poder remover um cliente no sistema" do
            Cliente.remover_um_cliente("13572750990")
            expect(Cliente.quantidade_de_clientes). to eq(4)
        end

        it "Devo poder alterar o nome de um cliente já existente" do
            lista_atualizada = [
                {:nome=>"Fernando", :cpf=>"97045824632"},
                {:nome=>"Klaus", :cpf=>"68547125365"},
                {:nome=>"Daniel", :cpf=>"27693174925"},
                {:nome=>"Xita", :cpf=>"46228302534"},
                {:nome=>"Samuel", :cpf=>"13572750990"}
            ]
            Cliente.new("Samuel", "13572750990")
            Cliente.alterar_nome_do_cliente("97045824632", "Fernando")
            expect(Cliente.lista_de_clientes). to eq(lista_atualizada)
        end
    end
end