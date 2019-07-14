public class Animal {
    String animal;
    String raca;
    String idade;
    String peso;
    
    
    public String getAnimal() {
        return animal;
    }

    public void setAnimal(String animal) {
        this.animal = animal;
    }

    public String getRaca() {
        return raca;
    }

    public void setRaca(String raca) {
        this.raca = raca;
    }

    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public String getIdade() {
        return idade;
    }

    public void setIdade(String idade) {
        this.idade = idade;
    }
    
    public Animal(String animal, String raca, String peso, String idade) {
      this.animal = animal;
      this.raca = raca;
      this.peso = peso;
      this.idade = idade;
    }
}