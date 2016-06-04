package com.thedevbean;

import java.util.Scanner;

/**
 * The <code>Validator</code> class represents a collection of methods to
 * verify that the input from the user is correct.
 * This is used by <code>MovieSelector</code> class.
 * @author Patrick Bean (pbean01)
 * @version 1.0.0
 */
public class Validator {

    /**
     * Prints out the provided prompt, returns the string entered by the user
     * and clears the rest of the Scanner.
     * @param sc a <code>Scanner</code> used to parse input from user
     * @param prompt a <code>String</code> printed out in the console before
     * user enters their response
     * @return a <code>String</code> that was provided by user
     */
    public static String getString(Scanner sc, String prompt) {
        System.out.print(prompt);
        String s = sc.next();
        sc.nextLine();
        return s;
    }

    /**
     * Prints out the provided prompt, validates that the user provided a
     * integer within the range and returns the string entered by the user
     * and clears the rest of the Scanner.
     * @param sc a <code>Scanner</code> used to parse input from user
     * @param prompt a <code>String</code> printed out in the console before
     * user enters their response
     * @param low a <code>int</code> representing the lowest acceptable value
     * @param high a <code>int</code> representing the highest acceptable value
     * @return a <code>int</code> provided by the user within the range provided
     */
    public static int getInt(Scanner sc, String prompt, int low, int high) {
        int i = -1;
        boolean isValid = false;
        while (isValid == false) {
            System.out.print(prompt);
            if (sc.hasNextInt()) {
                i = sc.nextInt();
                if (i >= low && i <= high) {
                    isValid = true;
                } else {
                    System.out.println("Invalid entry. Please try again.");
                }
            } else {
                System.out.println("Invalid entry. Please try again.");
            }
            sc.nextLine();
        }
        System.out.println();
        return i;
    }
}

