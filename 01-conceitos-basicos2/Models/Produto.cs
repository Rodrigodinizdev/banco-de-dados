namespace conceitos_basicos2.Models;

public class Produto
{
    private string _nome;
    private decimal _preco;
    private int _quantidade;

    public string Nome
    {
        get { return _nome; }
        set { _nome = value; }
    }

    public decimal Preco
    {
        get { return _preco; }
        set { _preco = value; }
    }

    public int Quantidade
    {
        get { return _quantidade; }
        set { _quantidade = value; }
    }

    public void AdicionarEstoque(int quantidade)
    {
        Quantidade += quantidade;
        Console.WriteLine($"{quantidade} unidades adicionadas com sucesso");
    }

    public void RemoverEstoque(int quantidade)
    {
        if (quantidade <= 0)
            throw new ArgumentException("A quantidade deve ser maior que zero");

        if (quantidade > Quantidade)
            throw new ArgumentException("Não é possivel remover mais do que o estoque disponível");

        Quantidade -= quantidade;
        Console.WriteLine($"{quantidade} unidades removidas com sucesso");
    }

    public void ExibirInfo()
    {
        Console.WriteLine($"Produto: {Nome} | Preço: {Preco:C} | Quantidade: {Quantidade}");
    }
}
