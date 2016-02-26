# Kata13: Counting Code Lines
Counting lines of code in Java source is not quite as simple as it seems.

This week let’s write something vaguely useful: a utility that counts the number of lines of actual code in a Java source file. For the purpose of this exercise, a line is counted if it contains something other than whitespace or text in a comment. Some simple examples:

```Java
-   // This file contains 3 lines of code
1   public interface Dave {
-     /**
-      * count the number of lines in a file
-      */
2     int countLines(File inFile); // not the real signature!
3   }
```
and…

```Java
-   /*****
-   * This is a test program with 5 lines of code
-   *  \/* no nesting allowed!
-   //*****//***/// Slightly pathological comment ending...
-
1  public class Hello {
2      public static final void main(String [] args) { // gotta love Java
-          // Say hello
3        System./*wait*/out./*for*/println/*it*/("Hello/*");
4      }
-
5  }
```
Remember that Java comments are either // to the end of line, or /\* to the next \*/. The block comments do not nest. There may be multiple /\* … \*/ comments on a line. Whitespace includes tabs, spaces, carriage returns, and vertical tabs. Oh, and remember that comment start sequences that appear inside Java strings should be ignored.

## Goals of the Kata
The mixture of line-based things (single line comments, blank lines, and so on) with the stream-based block comments can make solutions slightly ugly. While coding your solution, consider the structure of your code, and see how well it fits the structure of the problem. As with most of these kata, consider coding multiple alternative implementations. Does what you learned on the first tries affect your approach to subsequent ones?
