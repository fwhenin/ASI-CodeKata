using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeKata_02
{
    public class Chop3
    {
        public static int Chop(int target, int[] array)
        {
            var index = -1;
            var offset = 0;

            if (array.Length > 0)
            {
                if (array.Length == 1)
                {
                    if (array[0] == target)
                    {
                        index = 0;
                    }
                }
                else {
                    offset = array.Length / 2;
                    var newLength = 0;
                    var newArray = new int[0];

                    if (array[offset] > target)
                    {
                        newArray = new int[offset];
                        Array.Copy(array, newArray, offset);
                        offset = 0;
                    }
                    else
                    {
                        newLength = array.Length - offset;
                        newArray = new int[newLength];
                        Array.Copy(array, offset, newArray, 0, newLength);
                    };

                    var newResult = Chop(target, newArray);

                    if (newResult == -1)
                    {
                        index = -1;
                    }
                    else {
                        index = offset + newResult;
                    }
                }
            }

            return index;
        }
    }
}
