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
        [TestCase("cat", "cat", true)]
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
        public void WhenWordListContainsOnlyGivenWord_FindAnagramsInList_ReturnsListWithThatWord()
        {
            string word = "right";
            List<string> wordlist = new List<string> { "right" };
            var result = Anagrammer.FindAnagramsInList(word, wordlist);
            Assert.AreEqual(wordlist, result);
        }
    }
}
