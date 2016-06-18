using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace Anagrams
{
    class Program
    {
        private const string filepath = @"..\..\data\wordlist.txt";

        static void Main(string[] args)
        {
            var wordlist = File.ReadAllLines(filepath).ToList();
            var alphabeticalCharsAndWords = new List<Tuple<string, string>>();
            var anagrams = new List<List<string>>();

            alphabeticalCharsAndWords = Anagrammer.PairAlphabeticalCharsWithWords(wordlist);
            var result = alphabeticalCharsAndWords.GroupBy(x => x.Item1);
        }
    }
}
