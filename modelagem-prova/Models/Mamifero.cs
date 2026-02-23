namespace modelagem_prova.Models;

public class Mamifero : Animal, IApresentavel
{
    private string _habitatNatural;

    public string HabitatNatural
    {
        get => _habitatNatural;
        private set
        {
            if (string.IsNullOrWhiteSpace(value))
                throw new ArgumentException("Habitat natural não pode ser vazio");

            _habitatNatural = value;
        }
    }
    private string _atracao;

    public string Atracao
    {
        get => _atracao;
        private set
        {
            if (string.IsNullOrWhiteSpace(value))
                throw new ArgumentException("Atração não pode ser vazio");

            _atracao = value;
        }
    }

    public Mamifero(string nome, string especie, int idade, double peso, string habitatNatural, string atracao) : base(nome, especie, idade, peso)
    {
        HabitatNatural = habitatNatural;
        Atracao = atracao;
    }

    public override string EmitirSom()
    {
        return "rugido/grunhido grave";
    }

    public void Apresentar()
    {
        Console.WriteLine($"show de {Nome} - Mamífero em ação: {Nome} Interage com o público");
        Console.WriteLine();
    }

}
