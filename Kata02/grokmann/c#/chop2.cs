using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeKata_02
{
    public class Chop2
    {
        public static int Chop(int target, int[] array)
        {
            var index = -1;
            var start = 0;
            var end = array.Length - 1;
            var searchIndex = array.Length / 2;

            while (array.Length > 0 && index != searchIndex)
            {
                searchIndex = start + ((end - start) / 2);

                if (array[searchIndex] == target)
                {
                    index = searchIndex;
                }
                else if (searchIndex == start)
                {
                    if (searchIndex + 1 == end && array[end] == target)
                    {
                        index = end;
                    }

                    break;
                }
                else if (array[searchIndex] > target)
                {
                    end = searchIndex;
                }
                else
                {
                    start = searchIndex;
                };
            }

            return index;
        }
    }
}
