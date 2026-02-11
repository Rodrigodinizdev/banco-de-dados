using conceitos_basicos2.Models;

Produto produto1 = new Produto();
produto1.Nome = "Caneta";
produto1.Preco = 2.50m;
produto1.Quantidade = 100;
produto1.ExibirInfo();
produto1.RemoverEstoque(30);
produto1.AdicionarEstoque(10);
produto1.ExibirInfo();
