namespace PooExercicios.Models;

public class Aluno
{
    private string _nome;
    private int _idade;
    private string _turma;

    public string Nome
    {
        get { return _nome; }
        set { _nome = value; }
    }

    public int Idade
    {
        get { return _idade; }
        set { _idade = value; }
    }

    public string Turma
    {
        get { return _turma; }
        set { _turma = value; }
    }

    public Aluno(string nome, int idade, string turma)
    {
        Nome = nome;
        Idade = idade;
        Turma = turma;
    }

    public void ApresentarSe()
    {
        Console.WriteLine($"Olá meu nome é {Nome}, tenho {Idade} anos e estudo na turma {Turma}");
    }
}
