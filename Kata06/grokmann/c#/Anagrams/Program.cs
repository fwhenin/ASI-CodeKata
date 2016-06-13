using System.IO;

namespace Anagrams
{
    class Program
    {
        private const string filepath = @"..\..\data\wordlist.txt";

        static void Main(string[] args)
        {
            var wordlist = File.ReadAllLines(filepath);

            foreach (var word in wordlist)
            {
                
            }
        }

    }
}
