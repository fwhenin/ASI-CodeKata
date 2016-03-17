// Phil's second attempt at a binary chop
// in dlang
// 03/16/2016

module main;

import std.stdio;

void main(string[] args)
{
	int[] intArray = [0,1,2,3,5,8,13,21,77];
	int[] testValues = [0,1,4,7,8,9,11,13,14,15,20,21,22];
	//int[] testValues = [21];
	
	int chop(int needle, int lowerPosition = 0, int higherPosition = intArray.length, int previousPosition = 0){

		int halvedPosition = (higherPosition + lowerPosition) / 2;

		if(intArray[halvedPosition] == needle){
			return halvedPosition;
		}

		if(previousPosition == halvedPosition){
			return -1;
		}

		if(needle > intArray[halvedPosition]){
			return chop(needle, halvedPosition, higherPosition, halvedPosition);
		}

		if(needle < intArray[halvedPosition]){
			return chop(needle, 0, halvedPosition, halvedPosition);
		}

		return -1;
	}
	
	writefln("Array %s", intArray);
	writefln("Test Values: %s", testValues);
	
	foreach(int index, int i; testValues){
		int chopped = chop(i);
		writefln("Attempt: %s Searching: %s Chopped Position: %s", index, i, chopped);
	}
	
	writeln("Press a key to exit");
	stdin.readln();
}