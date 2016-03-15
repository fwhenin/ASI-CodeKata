/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package day2;

/**
 *
 * @author pmbea
 */
public class Day2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int[] testArray0 = {};
        int[] testArray1 = {1};
        int[] testArray2 = {1,3,5};
        int[] testArray3 = {1,3,5,7};
        
        System.out.println("Welcome to CodeKata 2: The Karate Chop!");
        System.out.printf("%n");
        Chop chop0 = new Chop(testArray0);
        Chop chop1 = new Chop(testArray1);
        Chop chop2 = new Chop(testArray2);
        Chop chop3 = new Chop(testArray3);
        System.out.printf("Test 1: chop 3, [1] = %d%n",chop0.findTarget(1));
        System.out.printf("Test 2: chop 3, [1] = %d%n",chop1.findTarget(3));
        System.out.printf("Test 3: chop 1, [1] = %d%n",chop1.findTarget(1));
        System.out.printf("%n");
        System.out.printf("Test 4: chop 1, [1, 3, 5] = %d%n",chop2.findTarget(1));
        System.out.printf("Test 5: chop 3, [1, 3, 5] = %d%n",chop2.findTarget(3));
        System.out.printf("Test 6: chop 5, [1, 3, 5] = %d%n",chop2.findTarget(5));
        System.out.printf("Test 7: chop 0, [1, 3, 5] = %d%n",chop2.findTarget(0));
        System.out.printf("Test 8: chop 2, [1, 3, 5] = %d%n",chop2.findTarget(2));
        System.out.printf("Test 9: chop 4, [1, 3, 5] = %d%n",chop2.findTarget(4));
        System.out.printf("Test 10: chop 6, [1, 3, 5] = %d%n",chop2.findTarget(6));
        System.out.printf("%n");
        System.out.printf("Test 11: chop 1, [1, 3, 5, 7] = %d%n",chop3.findTarget(1));
        System.out.printf("Test 12: chop 3, [1, 3, 5, 7] = %d%n",chop3.findTarget(3));
        System.out.printf("Test 13: chop 5, [1, 3, 5, 7] = %d%n",chop3.findTarget(5));
        System.out.printf("Test 14: chop 7, [1, 3, 5, 7] = %d%n",chop3.findTarget(7));
        System.out.printf("Test 15: chop 0, [1, 3, 5, 7] = %d%n",chop3.findTarget(0));
        System.out.printf("Test 16: chop 2, [1, 3, 5, 7] = %d%n",chop3.findTarget(2));
        System.out.printf("Test 17: chop 4, [1, 3, 5, 7] = %d%n",chop3.findTarget(4));
        System.out.printf("Test 18: chop 6, [1, 3, 5, 7] = %d%n",chop3.findTarget(6));
        System.out.printf("Test 19: chop 8, [1, 3, 5, 7] = %d%n",chop3.findTarget(8));
        

    }
    
}
