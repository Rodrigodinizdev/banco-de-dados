using poo_prova.Models;

try
{
    Cachorro cachorro1 = new Cachorro("Rex", "Cachorro", 5, 20.5, PorteCachorro.Grande);
    Gato gato1 = new Gato("Mia", "Gato", 3, 4.2, true);
    AveExotica ave1 = new AveExotica("Loro", "Papagaio", 2, 0.5, 0.3);
    AveExotica ave2 = new AveExotica("Flamingo", "Flamingo", 4, 3.0, 0.5);

    List<Paciente> pacientes = new List<Paciente> { cachorro1, gato1, ave1, ave2 };

    foreach (var paciente in pacientes)
    {
        paciente.ExibirDados();
        Console.WriteLine();
    }

    System.Console.WriteLine($"Total de aves exóticas: {AveExotica.ContadorAves()}");
}
catch (ArgumentException ex)
{
    Console.WriteLine($"Erro: {ex.Message}");
}
