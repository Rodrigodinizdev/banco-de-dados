namespace modelagem_prova.Models;

public abstract class Animal
{
    private string _nome;

    public string Nome
    {
        get => _nome;
        private set
        {
            if (string.IsNullOrWhiteSpace(value))
                throw new ArgumentException("nome não pode ser vazio");

            _nome = value;
        }
    }
    private string _especie;

    public string Especie
    {
        get => _especie;
        private set
        {
            if (string.IsNullOrWhiteSpace(value))
                throw new ArgumentException("espécie não pode ser vazia");

            _especie = value;
        }
    }
    private int _idade;

    public int Idade
    {
        get => _idade;
        private set
        {
            if (value < 0)
                throw new ArgumentException("Idade não pode ser negativa");

            _idade = value;
        }
    }

    private double _peso;
    public double Peso
    {
        get => _peso;
        private set
        {
            if (value <= 0)
                throw new ArgumentException("Peso deve ser maior que zero");

            _peso = value;
        }
    }

    public SituacaoAnimal Situacao
    {
        get
        {
            if (Idade < 2)
                return SituacaoAnimal.Filhote;

            else if (Idade <= 4)
                return SituacaoAnimal.Jovem;

            else
                return SituacaoAnimal.Adulto;
        }
    }

    protected Animal(string nome, string especie, int idade, double peso)
    {
        Nome = nome;
        Especie = especie;
        Idade = idade;
        Peso = peso;
    }

    public abstract string EmitirSom();

    public void ExibirFicha()
    {
        Console.WriteLine("=== Ficha do animal ===");
        Console.WriteLine($"Nome: {Nome} | Espécie: {Especie} | Situação: {Situacao} | Peso: {Peso} Kg");
        Console.WriteLine($"{Nome} {EmitirSom()}");
        Console.WriteLine();
    }

}
