using System;
using System.Text;
using HashDepot;
using System.IO;
using System.Threading.Tasks;
using System.Collections;

namespace BloomFilter
{
    class Program
    {
        private const int filterSize = 1024;
        private const string filename = @"..\..\data\wordlist.txt";

        static void Main(string[] args)
        {
            var bitArray = new BitArray(filterSize);

            var wordlist = File.ReadAllLines(filename);

            foreach (var word in wordlist)
            {
                var murmurValue = (int)(GetMurmurHashValue(word) % filterSize);
                bitArray.Set(murmurValue, true);

                var fnvValue = (int)(GetFnvHashValue(word) % filterSize);
                bitArray.Set(fnvValue, true);
            }

            while (true)
            {
                Console.WriteLine("Enter a word to check:");
                var testWord = Console.ReadLine();

                if (bitArray.Get((int)(GetMurmurHashValue(testWord) % filterSize)) && bitArray.Get((int)(GetFnvHashValue(testWord) % filterSize)))
                {
                    Console.WriteLine("That word is _probably_ in the dictionary already.");
                }
                else
                {
                    Console.WriteLine("Huh. That's a new one.");
                }
            }

            Console.ReadKey();
        }

        private static uint GetMurmurHashValue(string word)
        {
            const uint seed = 9;
            var encodedWord = Encoding.ASCII.GetBytes(word);
            uint hashResult = MurmurHash3.Hash32(encodedWord, seed);
            return hashResult;
        }

        private static uint GetFnvHashValue(string word)
        {
            var encodedWord = Encoding.ASCII.GetBytes(word);
            uint hashResult = Fnv1a.Hash32(encodedWord);
            return hashResult;
        }
    }
}
