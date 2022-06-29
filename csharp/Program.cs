/*

*/
using System;
namespace csharp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World !");
            Console.WriteLine("Bom dia !");
            Console.ReadLine();

            int i;
            int i2 = i = 2;
            Console.WriteLine("i2 " + i2);
            Console.WriteLine("i " + i);

            i = i2 == 42 ?  10  :  20;
            Console.WriteLine(i);



        }
    }
}