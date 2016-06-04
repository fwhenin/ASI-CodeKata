package com.thedevbean;

import murmur.MurmurHash;

/**
 * Created by pmbean on 5/25/2016.
 */
public class BloomFilter {
    private boolean[] mBitmap;
    private int mSlices;

    public BloomFilter (int length) {
        mBitmap = new boolean[length];
        if (length > 0) {
            mSlices = (int) (((long) Integer.MAX_VALUE - (long) Integer.MIN_VALUE) / length);
        } else {
            mSlices = 1;
        }
    }

    public boolean checkWord (String word) {
        boolean wordExists = false;
        if (wordExists == false){
            wordExists = mBitmap[getMurmurHash(word)];
        }
        return wordExists;
    }

    public void addWord (String word) {
        mBitmap[getMurmurHash(word)] = true;
    }

    public int getMurmurHash (String word) {
        long hash =  MurmurHash.hash32(word);
        long zeroedHash = (hash - Integer.MIN_VALUE);
        int sizedHash = (int) (zeroedHash/mSlices);
        return sizedHash;
    }

    @Override
    public String toString(){
        String print = "";
        for (int i = 0; i < mBitmap.length; i++) {
            if (mBitmap[i]) {
                print += "1 ";
            } else {
                print += "0 ";
            }
        }
        return print;
    }
}
