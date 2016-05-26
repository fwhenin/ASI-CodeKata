package com.thedevbean;

import java.util.Scanner;
import murmur.MurmurHash;

public class Main {

    public static void main(String[] args) {
	    Scanner sc = new Scanner(System.in);
        String again = "y";
        System.out.printf("Welcome to my Bloom fliter%n%n");
        String getLength = "Please enter the filter length: ";
        int size = Validator.getInt(sc, getLength, 0, 100000);

        BloomFilter bloomFilter = new BloomFilter(size);

        while (!again.equalsIgnoreCase("n")) {
            String word = Validator.getString(sc, "Please enter a word: ");
            if (bloomFilter.checkWord(word)) {
                System.out.printf ("Word exists in list. %n");
                System.out.printf ("Murmur hash = %d%n",bloomFilter.getMurmurHash(word));
            } else {
                System.out.printf("%s is not in the list.%n",word);
                System.out.printf ("Murmur hash = %d%n%n",bloomFilter.getMurmurHash(word));
                String addWordAnswer = Validator.getString(sc,
                                        "Would you like to add " + word + "? (y/n)");
                System.out.println();
                if (addWordAnswer.equalsIgnoreCase("y")) {
                    bloomFilter.addWord(word);
                }
            }
            System.out.printf("Bitmap is : %s%n%n", bloomFilter);

            again = Validator.getString(sc, "Would you like to continue? (y/n)");
            System.out.println();
        }

    }

}
