require "./carro.rb"
require "./cliente.rb"

describe "Locação de veiculos" do
    Carro.new('Honda', 'Fit', 2018, 'RAR-2803')
    Carro.new('Renault', 'Duster', 2016, 'ACA-1981')
    Carro.new('Volkswagen', 'Kombi', 2000, 'SOF-5505')
    Carro.new('Nissan', 'kicks', 2017, 'JAV-0101')
    Carro.new('Toyota', 'Corolla', 2020, 'SCR-1010')

    Cliente.new("Cristiano", "97045824632")
    Cliente.new("Klaus", "68547125365")
    Cliente.new("Daniel", "27693174925")
    Cliente.new("Samuel", "13572750990")
    Cliente.new("Xita", "46228302534")

    context "Cadastro de veiculo" do
        it "Devo poder cadastrar um veiculo no estoque" do
            expect(Carro.quantidade_de_carros).to eq(5)
        end
        it "Devo poder remover um veiculo no estoque" do
            Carro.remover_um_carro('ACA-1981')
            expect(Carro.quantidade_de_carros).to eq(4)
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
                {:nome=>"Samuel", :cpf=>"13572750990"},
                {:nome=>"Xita", :cpf=>"46228302534"}
            ]
            Cliente.alterar_nome_do_cliente("97045824632", "Fernando")
            expect(Cliente.lista_de_clientes). to eq(lista_atualizada)
        end
    end
end