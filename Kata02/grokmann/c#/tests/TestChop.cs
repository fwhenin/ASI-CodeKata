using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Common;
using NUnit.Framework;

namespace CodeKata_02.tests
{
    [TestFixture]
    public class TestChop
    {
        [TestCase(3, new int[] { }, ExpectedResult = -1, TestName = "Chop2 Test01")]
        [TestCase(3, new int[] { 1 }, ExpectedResult = -1, TestName = "Chop2 Test02")]
        [TestCase(1, new int[] { 1 }, ExpectedResult = 0, TestName = "Chop2 Test03")]
        [TestCase(1, new int[] { 1, 3, 5 }, ExpectedResult = 0, TestName = "Chop2 Test04")]
        [TestCase(3, new int[] { 1, 3, 5 }, ExpectedResult = 1, TestName = "Chop2 Test05")]
        [TestCase(5, new int[] { 1, 3, 5 }, ExpectedResult = 2, TestName = "Chop2 Test06")]
        [TestCase(0, new int[] { 1, 3, 5 }, ExpectedResult = -1, TestName = "Chop2 Test07")]
        [TestCase(2, new int[] { 1, 3, 5 }, ExpectedResult = -1, TestName = "Chop2 Test08")]
        [TestCase(4, new int[] { 1, 3, 5 }, ExpectedResult = -1, TestName = "Chop2 Test09")]
        [TestCase(6, new int[] { 1, 3, 5 }, ExpectedResult = -1, TestName = "Chop2 Test10")]
        [TestCase(1, new int[] { 1, 3, 5, 7 }, ExpectedResult = 0, TestName = "Chop2 Test11")]
        [TestCase(3, new int[] { 1, 3, 5, 7 }, ExpectedResult = 1, TestName = "Chop2 Test12")]
        [TestCase(5, new int[] { 1, 3, 5, 7 }, ExpectedResult = 2, TestName = "Chop2 Test13")]
        [TestCase(7, new int[] { 1, 3, 5, 7 }, ExpectedResult = 3, TestName = "Chop2 Test14")]
        [TestCase(0, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Chop2 Test15")]
        [TestCase(2, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Chop2 Test16")]
        [TestCase(4, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Chop2 Test17")]
        [TestCase(6, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Chop2 Test18")]
        [TestCase(8, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Chop2 Test19")]
        public int Chop2Test(int index, int[] array)
        {
            return Chop2.Chop(index, array);
        }

        [TestCase(3, new int[] { }, ExpectedResult = -1, TestName = "Chop3 Test01")]
        [TestCase(3, new int[] { 1 }, ExpectedResult = -1, TestName = "Chop3 Test02")]
        [TestCase(1, new int[] { 1 }, ExpectedResult = 0, TestName = "Chop3 Test03")]
        [TestCase(1, new int[] { 1, 3, 5 }, ExpectedResult = 0, TestName = "Chop3 Test04")]
        [TestCase(3, new int[] { 1, 3, 5 }, ExpectedResult = 1, TestName = "Chop3 Test05")]
        [TestCase(5, new int[] { 1, 3, 5 }, ExpectedResult = 2, TestName = "Chop3 Test06")]
        [TestCase(0, new int[] { 1, 3, 5 }, ExpectedResult = -1, TestName = "Chop3 Test07")]
        [TestCase(2, new int[] { 1, 3, 5 }, ExpectedResult = -1, TestName = "Chop3 Test08")]
        [TestCase(4, new int[] { 1, 3, 5 }, ExpectedResult = -1, TestName = "Chop3 Test09")]
        [TestCase(6, new int[] { 1, 3, 5 }, ExpectedResult = -1, TestName = "Chop3 Test10")]
        [TestCase(1, new int[] { 1, 3, 5, 7 }, ExpectedResult = 0, TestName = "Chop3 Test11")]
        [TestCase(3, new int[] { 1, 3, 5, 7 }, ExpectedResult = 1, TestName = "Chop3 Test12")]
        [TestCase(5, new int[] { 1, 3, 5, 7 }, ExpectedResult = 2, TestName = "Chop3 Test13")]
        [TestCase(7, new int[] { 1, 3, 5, 7 }, ExpectedResult = 3, TestName = "Chop3 Test14")]
        [TestCase(0, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Chop3 Test15")]
        [TestCase(2, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Chop3 Test16")]
        [TestCase(4, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Chop3 Test17")]
        [TestCase(6, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Chop3 Test18")]
        [TestCase(8, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Chop3 Test19")]
        public int Chop3Test(int index, int[] array)
        {
            return Chop3.Chop(index, array);
        }
    }
}
