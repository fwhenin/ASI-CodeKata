function chop(n, srtArr) {
	var min = 0;
	var max = srtArr.length;
	// get the midpoint of the array.  I used a ternary here to cover arrays with one value.
	var mid = max === 1 ? 0 : (min + max) % 2;
  
	// check mid first.
	if(srtArr[mid] === n) {
		return mid;
	}
  
	// only iterate through the first half if n is less than mid.
	if(n < srtArr[mid]) {
		while(min < mid) {
			if(srtArr[min] === n) {
				return min;
			}
			min++;
		}
	}
  
	while(max > mid) {
		if(srtArr[max] === n) {
			return max;
		}
		max--;
	}
	// we didn't find anything.
	return -1;
}

function testChop() {
	console.log(chop(3, []) === -1);
	console.log(chop(3, [1]) === -1);
	console.log(chop(1, [1]) === 0);
	console.log(chop(1, [1, 3]) === 0);
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
	console.log(chop(7, [1, 3, 5, 7, 8]) === 3);
	console.log(chop(5, [1, 3, 5, 7, 8]) === 2);
}
 
testChop();