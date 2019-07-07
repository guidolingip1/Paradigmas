# Conceitos da Linguagem Java
#### Programação Orientada a Objetos
Este tipo de programação trata os elementos da linguagem de maneira semelhante aos objetos reais.



#### Packages

É semelhante ao conceito de bibliotecas, sendo que um package (pacote) é um conjunto de classes, que ficam num diretório com o mesmo nome do pacote. 
Exemplo de como adicionar um Package para entrada de dados:

    import java.util.Scanner;

 

#### Classes

É um conjunto de objetos com características comuns. Uma classe é como um modelo para a criação de objetos.
Exemplo de Classe:

    public  class  Cachorro  {  
	    int idade;  
	    String nome;
	
	public Cachorro() {
		System.out.println("Construtor de Cachorro chamado"); 
		}
	     
	void latir()  {  
		System.out.println("Au Au");
		}

    }
    

#### Objetos

Um objeto é um elemento de uma classe.
Exemplo: 

    public  static  void main(String  []args)  {
	    Cachorro meuCachorro =  new  Cachorro();
	}
Na código acima Cachorro com C maiúsculo é a Classe e meuCachorro é o meu objeto criado.

#### Instância

Uma instância de uma classe é um novo objeto criado dessa classe.
Uma classe somente poderá ser utilizada após ser instanciada.

Exemplo: No código acima após eu ter criado um objeto do tipo cachorro, a eu instanciei esta classe, podendo agora utilizar seus métodos.

#### Métodos

Os métodos representam os estados e ações dos objetos e classes.
Aqui eu instanciei um objeto do tipo Cachorro e apliquei o método latir() nele.

       public  static  void main(String  []args)  {
	    Cachorro meuCachorro =  new  Cachorro();
	    meuCachorro.latir();
	}


#### Construtores

São usados para inicializar objetos. É o método que tem o mesmo nome da sua classe.

    public  Cachorro()  { 
	    System.out.println("Au Au");
    }

No código acima, temos um construtor Cachorro, e quando criarmos um objeto do tipo cachorro o construtor será chamado e imprimira na tela a mensagem ("Au Au")
#### Polimorfismo

É a capacidade de um método executar a ação adequada dependendo do tipo de objeto.

    public  class Animal { 
	    public void comer() { 
		    System.out.println( "Animal Comendo..." ); 
		} 
	}
	
	public  class Cao extends Animal { 
		public void comer() { 
			System.out.println( "Cão Comendo..." ); 
		} 
	} 
	
	public  class Tigre extends Animal { 
		public void comer() { 
			System.out.println( "Tirgre Comendo..." ); 
		} 
	}
	
#### Threads

São fluxos de execução paralelos, executando cada um tarefas diferentes. Em máquinas com dois ou mais processadores a execução pode ser simultânea e em máquinas com um único a execução será simulada, dividindo o tempo de processamento.

Exemplo de código onde duas Threads imprimem mensagens diferentes: 

    class SimpleThread extends Thread {
	    public SimpleThread(String str) {
	        super(str);
    }
    public void run() {
        for (int i = 0; i < 10; i++) {
            System.out.println(i + " " + getName());
            try {
                sleep((int)(Math.random() * 1000));
            } catch (InterruptedException e) {}
        }
        System.out.println("DONE! " + getName());
    }
    
    
    public static void main (String[] args) {
        new SimpleThread("Jamaica").start();
        new SimpleThread("Fiji").start();
	    }
    }





#### Herança

Quando a subclasse herda as características da superclasse. Denota especialização.

#### Encapsulamento

É o empacotamento (encapsulamento) de variáveis e métodos, ocultando a implementação do usuário. Representa reutilização, segurança e facilidade de manutenção.
