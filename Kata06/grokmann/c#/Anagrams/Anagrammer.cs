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

            if (word1.Length == word2.Length && word1 != word2)
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

        public static List<List<string>> ProcessList(List<string> wordlist)
        {
            var result = new List<List<string>>();

            result = ProcessListHelper(wordlist.FirstOrDefault(), wordlist, result);

            return result;
        }

        private static List<List<string>> ProcessListHelper(string word, List<string> wordlist, List<List<string>> result)
        {
            if (wordlist.Any())
            {
                var tempList = new List<string> { word };
                var testedWord = wordlist.First();
                wordlist.Remove(testedWord);

                if (AreAnagrams(testedWord, word))
                {
                    tempList.Add(testedWord);
                }

                result = ProcessListHelper(word, wordlist, result);

                result.Add(tempList);
            }

            return result;
        }

        public static List<Tuple<string, string>> PairAlphabeticalCharsWithWords(List<string> wordlist)
        {
            var result = new List<Tuple<string, string>>();

            foreach (var word in wordlist)
            {
                var alphabeticalCharString = new string(word.ToArray().OrderBy(x => x.ToString()).ToArray());
                result.Add(new Tuple<string, string>(alphabeticalCharString, word));
            }

            return result;
        }

        public static string AlphabetizeByChar(string word)
        {
            return new string(word.ToArray().OrderBy(y => y.ToString()).ToArray());
        }

        public static List<List<string>> GetListOfAnagrams(List<string> wordlist)
        {
            var result = new List<List<string>>();
            result = wordlist.OrderBy(x => x).GroupBy(word => new string(word.ToArray().OrderBy(y => y.ToString()).ToArray()), x => x, (key, words) => words.OrderBy(x => x).ToList()).ToList();
            return result;
        }
    }
}
