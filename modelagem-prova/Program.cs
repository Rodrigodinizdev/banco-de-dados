using modelagem_prova.Models;

try
{
    Mamifero mamifero1 = new Mamifero("Simba", "Leão", 3, 180.5, "Selva", "Rugido pro público");
    Ave ave1 = new Ave("Blu", "Arara-Azul", 1, 1.2, 0.6);
    Ave ave2 = new Ave("Zazu", "Calau", 8, 0.8, 0.8);

    List<Animal> animais = new List<Animal> { mamifero1, ave1, ave2 };

    foreach (var animal in animais)
        animal.ExibirFicha();
    
    System.Console.WriteLine($"\nTotal de aves cadastradas: {Ave.ObterTotalAves()}");

    foreach (var animal in animais)
    {
        if(animal is IApresentavel apresentavel)
            apresentavel.Apresentar();
    }

    Mamifero erro = new Mamifero( "", "Tigre", 4, 200, "Floresta", "Show do Tigre");
        
}
catch (ArgumentException ex)
{
    System.Console.WriteLine($"Erro: {ex.Message}");   
}
