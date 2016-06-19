using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;

namespace Anagrams
{
    [TestFixture]
    public class Tests
    {
        public string fileResourceName;

        [SetUp]
        public void Setup()
        {
            fileResourceName = "Anagrams.WordsTest.txt";
        }

        [Test]
        public void LoadFile()
        {
            var result = new List<String>();
            var assembly = Assembly.GetExecutingAssembly();

            using (Stream stream = assembly.GetManifestResourceStream(fileResourceName))
            {
                using (StreamReader reader = new StreamReader(stream))
                {
                    string line = reader.ReadLine();
                    result.Add(line);
                }
            }

            Assert.AreEqual(result.First(), "test");
        }

        [TestCase("", 1)]
        [TestCase("ra", 2)]
        [Ignore("Using a different algorithm.")]
        public void AllAnagramPermutationsAreCreated(string testWord, int expectedCount)
        {
            var result = Anagrammer.MakeAnagrams(testWord);
            Assert.AreEqual(expectedCount, result.Count);
        }

        [TestCase("cat", "act", true)]
        [TestCase("cat", "cat", false)]
        [TestCase("cat", "dog", false)]
        public void WordsAreAnagramsReturnsExpectedResult(string word1, string word2, bool expectedResult)
        {
            var result = Anagrammer.AreAnagrams(word1, word2);

            Assert.AreEqual(expectedResult, result);
        }

        [Test]
        public void WhenWordIsNull_FindAnagramsInList_ReturnsEmptyList()
        {
            string word = null;
            var wordlist = new List<string>();
            var result = Anagrammer.FindAnagramsInList(word, wordlist);
            Assert.AreEqual(new List<string>(), result);
        }

        [Test]
        public void WhenWordListIsNull_FindAnagramsInList_ReturnsEmptyList()
        {
            string word = String.Empty;
            List<string> wordlist = null;
            var result = Anagrammer.FindAnagramsInList(word, wordlist);
            Assert.AreEqual(new List<string>(), result);
        }

        [Test]
        public void WhenWordListHasNoAnagrams_FindAnagramsInList_ReturnsEmptyList()
        {
            string word = "right";
            List<string> wordlist = new List<string> { "wrong" };
            var result = Anagrammer.FindAnagramsInList(word, wordlist);
            Assert.AreEqual(new List<string>(), result);
        }

        [Test]
        public void WhenWordListContainsOnlyGivenWord_FindAnagramsInList_ReturnsAnEmptyList()
        {
            string word = "right";
            List<string> wordlist = new List<string> { "right" };
            var expectedResult = new List<string>();

            var result = Anagrammer.FindAnagramsInList(word, wordlist);
            Assert.AreEqual(expectedResult, result);
        }

        [Test]
        public void WhenWordListContainsAnagrams_FindAnagramsInList_ReturnsCorrectList()
        {
            string word = "cat";
            List<string> wordlist = new List<string> { "tac", "act", "wrong", "excellent" };
            List<string> expectedWordlist = new List<string> { "act", "tac" };

            var result = Anagrammer.FindAnagramsInList(word, wordlist).OrderBy(x => x);
            Assert.AreEqual(expectedWordlist, result);
        }

        [Test]
        public void AreEqualWorksAsExpectedOnLists()
        {
            List<string> wordlist = new List<string> { "act", "tac" };
            List<string> expectedWordlist = new List<string> { "tac", "act" };

            Assert.AreNotEqual(expectedWordlist, wordlist);
            //have to order by elements or it fails
            Assert.AreEqual(expectedWordlist.OrderBy(x => x), wordlist.OrderBy(x => x));
        }

        [Test]
        public void GivenAnEmptyWordList_ProcessList_ReturnsAnEmptyListOfListsOfWords()
        {
            var wordlist = new List<string>();
            var expectedResult = new List<List<string>>();

            var result = Anagrammer.ProcessList(wordlist);

            Assert.AreEqual(expectedResult, result);
        }

        [Ignore("Going a different direction.")]
        public void ProcessList_ReturnsListOfListsOfWordsAsExpected()
        {
            var wordlist = new List<string>
            {
                "act",
                "cat",
                "rate",
                "tare",
                "tear",
                "zephyr"
            };

            var expectedResult = new List<List<string>>
            {
                new List<string> {
                    "act", "cat"
                },
                new List<string> {
                    "rate", "tare", "tear"
                },
                new List<string> {
                    "zephyr"
                }
            };

            var result = Anagrammer.ProcessList(wordlist);

            Assert.AreEqual(expectedResult, result);
        }

        [Test]
        public void GivenAnEmptyList_PairAlphabetizedWords_ReturnsAnEmptyList()
        {
            var wordlist = new List<string>();

            var expectedResult = new List<Tuple<string, string>>();

            var result = Anagrammer.PairAlphabeticalCharsWithWords(wordlist);

            Assert.AreEqual(expectedResult, result);
        }

        [Test]
        public void PairAlphabetizedWords()
        {
            var wordlist = new List<string>
            {
                "act", "cat", "dog"
            };

            var expectedResult = new List<Tuple<string, string>>
            {
                new Tuple<string, string>("act", "act"),
                new Tuple<string, string>("act", "cat"),
                new Tuple<string, string>("dgo", "dog")
            };

            var result = Anagrammer.PairAlphabeticalCharsWithWords(wordlist);

            Assert.AreEqual(expectedResult, result);
        }

        [TestCase("", "")]
        public void AllAnagramPermutationsAreCreated(string testWord, string expectedResult)
        {
            var result = Anagrammer.AlphabetizeByChar(testWord);
            Assert.AreEqual(expectedResult, result);
        }

        [Test]
        public void GetListOfAnagrams()
        {
            var wordlist = new List<string>
            {
                "act", "cat", "dog", "eat", "tea"
            };

            var expectedResult = new List<List<string>>
            {
                new List<string> { "act", "cat" },
                new List<string> { "dog" },
                new List<string> { "eat", "tea" }
            };

            var result = Anagrammer.GetListOfAnagrams(wordlist);

            Assert.AreEqual(expectedResult.First().First(), result.First().First());
            Assert.AreEqual(expectedResult.Last().Last(), result.Last().Last());
        }
    }
}
