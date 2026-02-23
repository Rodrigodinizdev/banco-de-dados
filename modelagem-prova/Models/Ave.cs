namespace modelagem_prova.Models;

public class Ave : Animal
{
    private double _envergadura;

    public double Envergadura
    {
        get => _envergadura;
        private set
        {
            if(value <= 0)
                throw new ArgumentException("Valor não pode ser zero ou negativo");

            _envergadura = value;
        }
    }

    private static int _totalAves = 0;

    public Ave(string nome, string especie, int idade, double peso, double envergadura ) : base(nome, especie, idade, peso)
    {
        Envergadura = envergadura;
        _totalAves++;
    }

    public override string EmitirSom()
    {
        return "Emite um canto melodioso";
    }

    public static int ObterTotalAves()
    {
        return _totalAves;
    }

}