using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace Anagrams
{
    class Program
    {
        private const string filepath = @"..\..\wordlist.txt";

        static void Main(string[] args)
        {
            var wordlist = File.ReadAllLines(filepath).ToList();
            var anagrams = Anagrammer.GetListOfAnagrams(wordlist);

            string anagramsOutput = @"anagrams.txt";

            using (StreamWriter sr = new StreamWriter(anagramsOutput))
            {
                foreach (var anagramList in anagrams)
                {
                    foreach (var word in anagramList)
                    {
                        sr.Write(word + ",");
                    }
                    sr.WriteLine();
                }

                File.SetAttributes(anagramsOutput, FileAttributes.Normal);
            }
        }
    }
}
