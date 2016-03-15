package day1;


public class day1 {

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
        System.out.printf("Test 2: chop 3, [1] = %d%n",chop(3,testArray0));
        System.out.printf("Test 2: chop 3, [1] = %d%n",chop(3,testArray1));
        System.out.printf("Test 3: chop 1, [1] = %d%n",chop(1,testArray1));
        System.out.printf("%n");
        System.out.printf("Test 4: chop 1, [1, 3, 5] = %d%n",chop(1,testArray2));
        System.out.printf("Test 5: chop 3, [1, 3, 5] = %d%n",chop(3,testArray2));
        System.out.printf("Test 6: chop 5, [1, 3, 5] = %d%n",chop(5,testArray2));
        System.out.printf("Test 7: chop 0, [1, 3, 5] = %d%n",chop(0,testArray2));
        System.out.printf("Test 8: chop 2, [1, 3, 5] = %d%n",chop(2,testArray2));
        System.out.printf("Test 9: chop 4, [1, 3, 5] = %d%n",chop(4,testArray2));
        System.out.printf("Test 10: chop 6, [1, 3, 5] = %d%n",chop(6,testArray2));
        System.out.printf("%n");
        System.out.printf("Test 11: chop 1, [1, 3, 5, 7] = %d%n",chop(1,testArray3));
        System.out.printf("Test 12: chop 3, [1, 3, 5, 7] = %d%n",chop(3,testArray3));
        System.out.printf("Test 13: chop 5, [1, 3, 5, 7] = %d%n",chop(5,testArray3));
        System.out.printf("Test 14: chop 7, [1, 3, 5, 7] = %d%n",chop(7,testArray3));
        System.out.printf("Test 15: chop 0, [1, 3, 5, 7] = %d%n",chop(0,testArray3));
        System.out.printf("Test 16: chop 2, [1, 3, 5, 7] = %d%n",chop(2,testArray3));
        System.out.printf("Test 17: chop 4, [1, 3, 5, 7] = %d%n",chop(4,testArray3));
        System.out.printf("Test 18: chop 6, [1, 3, 5, 7] = %d%n",chop(6,testArray3));
        System.out.printf("Test 19: chop 8, [1, 3, 5, 7] = %d%n",chop(8,testArray3));
        
    }
    
    private static int chop(int target, int[] field){
        if(field.length==0){
            return -1;
        }
        int bottom = 0;
        int top = field.length-1;
        do {
            int mid = (bottom + top)/2;
            if(target == field[mid]){
                return mid;
            }else if(target < field[mid]) {
                top = mid-1;
            }else if(target > field[mid]) {
                bottom = mid+1;
            }
        }while(bottom <= top);
        return -1;
    }
}
