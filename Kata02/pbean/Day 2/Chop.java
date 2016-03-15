package day2;

import java.util.Arrays;

public class Chop {
 
    private int[] mArray;
    private int mCenter;
    private int mTop;
    private int mBottom;
    private int mIndex;
    
    public Chop (int[] array) {
        mArray = array;
    }
    
    public int findTarget(int target) {
        mBottom = 0;
        mTop = mArray.length - 1;
        mIndex = -1;
        while (mBottom <= mTop) {
            find(target, Arrays.copyOfRange(mArray, mBottom, mTop+1));
        }
        return mIndex;
    }
    
    private void find(int target, int[] array) {
        int center = array.length/2;
        if (target == array[center]) {
            mIndex = center + mBottom;
            mTop = -1;
            return;
        } else if (target < array[center]) {
            mTop = center - 1;
            return;
        } else if (target > array[center]) {
            mBottom = mBottom + center + 1;
            return;
        }
            
    }

}
