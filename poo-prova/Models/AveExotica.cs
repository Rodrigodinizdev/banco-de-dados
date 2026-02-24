namespace poo_prova.Models;

public class AveExotica : Paciente
{
    private double _envergadura;

    public double Envergadura
    {
        get => _envergadura;
        private set
        {
            if (value <= 0)
                throw new ArgumentException("Envergadura deve ser um valor positivo");

            _envergadura = value;
        }
    }

    private static int _totalAves = 0;
    public AveExotica(string nome, string especie, int idade, double peso, double envergadura) : base(nome, especie, idade, peso)
    {
        Envergadura = envergadura;
        _totalAves++;
    }

    public static int ContadorAves()
    {
        return _totalAves;
    }
    
    public override string EmitirSom()
    {
        return "Som de ave exótica!";
    }

    public override void ExibirDados()
    {
        Console.WriteLine("=== Dados do animal ===");
        Console.WriteLine($"Nome: {Nome} | Espécie: {Especie} | Classificação: {classificacao} | Peso: {Peso} | Envergadura: {Envergadura}");
        Console.WriteLine($"{Especie} - {Nome} {EmitirSom()}");
    }
}
