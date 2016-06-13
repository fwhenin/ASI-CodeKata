using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Anagrams
{
    public static class Anagrammer
    {
        public static List<String> MakeAnagrams(string word)
        {
            var result = new List<String>();
            result.Add(word);
            for (var i = 0; i < word.Length; i++)
            {
                word.Split();
            }

            return result;
        }

        public static bool AreAnagrams(string word1, string word2)
        {
            var result = false;

            return result;
        }
    }
}
