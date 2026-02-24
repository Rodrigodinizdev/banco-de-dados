namespace poo_prova.Models;

public class Gato : Paciente, IViveEmApartamento
{
    public bool ViveEmApartamento { get; private set; }

    public Gato(string nome, string especie, int idade, double peso, bool viveEmApartamento) : base(nome, especie, idade, peso)
    {
        ViveEmApartamento = viveEmApartamento;
    }

    public void ViverEmApartamento()
    {
        if (ViveEmApartamento)
            Console.WriteLine("O gato vive em apartamento.");
        else
            Console.WriteLine("O gato não vive em apartamento.");
    }

    public override string EmitirSom()
    {
        return "Miau!";
    }

     public override void ExibirDados()
    {
        Console.WriteLine("=== Dados do animal ===");
        Console.WriteLine($"Nome: {Nome} | Espécie: {Especie} | Classificação: {classificacao} | Peso: {Peso} | Vive em apartamento: {(ViveEmApartamento ? "Sim" : "Não")}");
        Console.WriteLine($"{Especie} - {Nome} {EmitirSom()}");
    }
}
