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
        [TestCase(3, new int[] { }, ExpectedResult = -1, TestName = "Test1")]
        [TestCase(3, new int[] { 1 }, ExpectedResult = -1, TestName = "Test2")]
        [TestCase(1, new int[] { 1 }, ExpectedResult = 0, TestName = "Test3")]
        [TestCase(1, new int[] { 1, 3, 5 }, ExpectedResult = 0, TestName = "Test4")]
        [TestCase(3, new int[] { 1, 3, 5 }, ExpectedResult = 1, TestName = "Test5")]
        [TestCase(5, new int[] { 1, 3, 5 }, ExpectedResult = 2, TestName = "Test6")]
        [TestCase(0, new int[] { 1, 3, 5 }, ExpectedResult = -1, TestName = "Test7")]
        [TestCase(2, new int[] { 1, 3, 5 }, ExpectedResult = -1, TestName = "Test8")]
        [TestCase(4, new int[] { 1, 3, 5 }, ExpectedResult = -1, TestName = "Test9")]
        [TestCase(6, new int[] { 1, 3, 5 }, ExpectedResult = -1, TestName = "Test10")]
        [TestCase(1, new int[] { 1, 3, 5, 7 }, ExpectedResult = 0, TestName = "Test11")]
        [TestCase(3, new int[] { 1, 3, 5, 7 }, ExpectedResult = 1, TestName = "Test12")]
        [TestCase(5, new int[] { 1, 3, 5, 7 }, ExpectedResult = 2, TestName = "Test13")]
        [TestCase(7, new int[] { 1, 3, 5, 7 }, ExpectedResult = 3, TestName = "Test14")]
        [TestCase(0, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Test15")]
        [TestCase(2, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Test16")]
        [TestCase(4, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Test17")]
        [TestCase(6, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Test18")]
        [TestCase(8, new int[] { 1, 3, 5, 7 }, ExpectedResult = -1, TestName = "Test19")]
        public int ChopTest(int index, int[] array)
        {
            return Chop2.Chop(index, array);
        }
    }
}
