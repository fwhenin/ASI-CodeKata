using System;
using System.Text;
using HashDepot;

namespace BloomFilter
{
    class Program
    {
        private const uint filterSize = 32;
        private const uint seed = 9;

        static void Main(string[] args)
        {
            var buffer = Encoding.ASCII.GetBytes("some string");
            uint murmurHashResult = MurmurHash3.Hash32(buffer, seed);
            var murmurValue = murmurHashResult % filterSize;

            buffer = Encoding.ASCII.GetBytes("some string");
            uint fnvHashResult = Fnv1a.Hash32(buffer); // 32-bit hash
            var fnvValue = fnvHashResult % filterSize;

            Console.WriteLine("Murmur Result:" + murmurValue);
            Console.WriteLine("FNV Result:" + fnvValue);
            Console.ReadKey();
        }
    }
}
