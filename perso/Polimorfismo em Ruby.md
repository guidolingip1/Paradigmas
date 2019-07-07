## Exemplo de OOP em outra Linguagem (Ruby)

## Algorítimo Simples

Algorítimo simples em ruby, uma classe um método e um objeto
    #Criação da minha Classe
    class Animal
	
		#Criação do método mugir
		def mugir
			puts("Mugindo")
		end
	end
	
	#Criação do objeto vaca da classe Animal
	vaca = Animal.new()
	
	#Aplicando o método mugir no objeto vaca
	vaca.mugir


    
   ## Algorítimo com Polimorfismo

    #Criação da minha Classe
    class Animal
	    
	    #Criação do método falar
	    def falar
		    puts("Muu")
		end
	end
	
	#Aqui eu crio uma Classe Cachorro que é um Animal, se eu mandar o Cachorro Falar sem alterar o método falar, ele irá mugir
	class Cachorro < Animal
	    
	    #Alteração do método Falar
	    def falar
		    puts("Au Au")
		end
