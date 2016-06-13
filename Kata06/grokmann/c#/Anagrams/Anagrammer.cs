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

            if (word1.Length == word2.Length)
            {
                var alphabetizedWord1 = new string(word1.ToArray().OrderBy(x => x.ToString()).ToArray());
                var alphabetizedWord2 = new string(word2.ToArray().OrderBy(x => x.ToString()).ToArray());
                if (alphabetizedWord1 == alphabetizedWord2)
                {
                    result = true;
                }
            }

            return result;
        }

        public static List<string> FindAnagramsInList(string word, List<string> wordlist)
        {
            var result = new List<string>();

            if (wordlist != null)
            {
                result = wordlist.Where(x => AreAnagrams(word, x)).ToList();
            }

            return result;
        }
    }
}
