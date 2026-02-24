namespace poo_prova.Models;

public abstract class Paciente
{
    private string _nome;

    public string Nome
    {
        get => _nome;
        private set
        {
            if (string.IsNullOrWhiteSpace(value))
                throw new ArgumentException("Nome não pode ser vazio");

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
                throw new ArgumentException("Especie não pode ser vazia");

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

    public ClassificacaoIdade classificacao
    {
        get
        {
            if (Idade <= 1)
                return ClassificacaoIdade.Filhote;

            if (Idade <= 7)
                return ClassificacaoIdade.Adulto;

            return ClassificacaoIdade.Idoso;
        }
    }

    protected Paciente(string nome, string especie, int idade, double peso)
    {
        Nome = nome;
        Especie = especie;
        Idade = idade;
        Peso = peso;
    }

    public abstract string EmitirSom();

    public virtual void ExibirDados()
    {
        Console.WriteLine("=== Dados do animal ===");
        Console.WriteLine($"Nome: {Nome} | Espécie: {Especie} | Classificação: {classificacao} | Peso: {Peso}");
        Console.WriteLine($"{Especie} - {Nome} {EmitirSom()}");
    }

}
