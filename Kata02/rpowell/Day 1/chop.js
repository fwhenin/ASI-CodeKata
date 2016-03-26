function chop(n, srtArr) {
	var min = 0;
	var max = srtArr.length;
	// get the midpoint of the array.
	var mid = (min + max) / 2;
  
	// check mid first.
	if(srtArr[mid] === n) {
		return mid;
	}
  
	// the value isn't in mid, so continue to check both sides of the array.
	while((min < mid) && (max > mid)) {
		if(srtArr[min] === n) {
			return min;
		}
		else if(srtArr[max] === n) {
			return max;
		}
		// increment and decrement min and max indexes.
		min++;
		max--;
	}
	// we didn't find anything.
	return -1;
}

function testChop() {
	console.log(chop(3, []) === -1);
	console.log(chop(3, [1]) === -1);
	console.log(chop(1, [1]) === 0);
	console.log(chop(1, [1, 3, 5]) === 0);
	console.log(chop(3, [1, 3, 5]) === 1);
	console.log(chop(5, [1, 3, 5]) === 2);
	console.log(chop(0, [1, 3, 5]) === -1);
	console.log(chop(2, [1, 3, 5]) === -1);
	console.log(chop(4, [1, 3, 5]) === -1);
	console.log(chop(6, [1, 3, 5]) === -1);
	console.log(chop(1, [1, 3, 5, 7]) === 0);
	console.log(chop(3, [1, 3, 5, 7]) === 1);
	console.log(chop(5, [1, 3, 5, 7]) === 2);
	console.log(chop(7, [1, 3, 5, 7]) === 3);
	console.log(chop(0, [1, 3, 5, 7]) === -1);
	console.log(chop(2, [1, 3, 5, 7]) === -1);
	console.log(chop(4, [1, 3, 5, 7]) === -1);
	console.log(chop(6, [1, 3, 5, 7]) === -1);
	console.log(chop(8, [1, 3, 5, 7]) === -1);
}
 
testChop();