// Phil's first attempt at a binary chop
// in dlang
// 03/16/2016

module main;

import std.stdio;

void main(string[] args)
{
	int[] intArray = [0,1,2,3,5,8,13,21,77];
	int[] testValues = [0,1,4,7,8,9,11,13,14,15,20,21,22];
	//int[] testValues = [21];

	int chop(int needle, int[] _intArray, int position = 0){
		int split = _intArray.length / 2;	//take the array, split in half

		if(needle < _intArray[split]){
			if(_intArray.length > 1){
				return chop(needle, _intArray[0..split], 0);
			}
		}

		position = split + position;	//increment the position

		if(needle > _intArray[split]){
			if(_intArray.length > 1){
				return chop(needle, _intArray[split.._intArray.length], position);
			}
		}

		if(needle == _intArray[split]){
			return position;
		}

		return -1;
	}

	writefln("Array %s", intArray);
	writefln("Test Values: %s", testValues);

	foreach(int index, int i; testValues){
		int chopped = chop(i, intArray);
		writefln("Attempt: %s Searching: %s Chopped Position: %s", index, i, chopped);
	}

	writeln("Press a key to exit");
	stdin.readln();
}