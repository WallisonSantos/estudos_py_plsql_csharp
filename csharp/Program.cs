/*

*/
using System;
namespace csharp
{
    class Program
    {
        static void Main(string[] args)
        {
            char gen  = '\u04b3';
            string str = "Maria Green";
            object obj1 = "alex brown";
            object obj2 = 5.5f;

            sbyte x = -119 ;
            byte y = 255 ;

            int num1  = 2147483647 ;
            long num2 = 2147483123999L ;
            double num3 = 4.5 ;
            float num4 = 4.5f ;

            y ++ ;
            x ++ ;
            
            System.Console.WriteLine("Valor para " + gen) ;

            Console.WriteLine("Valor para Sbyte " + x ) ;
            Console.WriteLine("Valor para byte " + y ) ;

            Console.WriteLine("Valor para int " + num1) ;
            Console.WriteLine("Valor para long " + num2) ;
            Console.WriteLine("Valor para double " + num3) ;
            Console.WriteLine("Valor para float " + num4) ;
        }
    }
}