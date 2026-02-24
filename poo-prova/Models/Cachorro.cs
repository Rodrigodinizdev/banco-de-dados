namespace poo_prova.Models;

public class Cachorro : Paciente, IPorteCachorro
{
    public PorteCachorro Porte { get; private set; }

    public Cachorro(string nome, string especie, int idade, double peso, PorteCachorro porte)
        : base(nome, especie, idade, peso)
    {
        Porte = porte;
    }

    public void SaberPorte()
    {
        Console.WriteLine($"Porte: {Porte}");
    }

    public override string EmitirSom()
    {
        return "Au Au!";
    }

    public override void ExibirDados()
    {
        Console.WriteLine("=== Dados do animal ===");
        Console.WriteLine($"Nome: {Nome} | Espécie: {Especie} | Porte: {Porte} | Peso: {Peso}");
        Console.WriteLine($"{Especie} - {Nome} {EmitirSom()}");
        Console.WriteLine();
    }
}
