using System;
using System.Globalization;
namespace csharp
{
    class Program
    {
        static void Main(string[] args)
        {
            /*
                Interpolação de strings
            */
            int idade = 32;
            double saldo = 10.8920;
            string nome = "Maria";

            System.Console.WriteLine("A {0} tem {1} anos e saldo em conta de {2:F2} reais ", nome, idade, saldo);
            System.Console.WriteLine($"A {nome} tem {idade} anos e saldo em conta de {saldo:F2} reais ");
            System.Console.WriteLine("A " + nome + " tem " + idade + " anos e saldo em conta de " + saldo.ToString());
        }
    }
}