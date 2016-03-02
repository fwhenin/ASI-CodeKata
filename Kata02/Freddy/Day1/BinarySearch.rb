

def midpoint(haystack, min, max)
	# If min is greater than max, means that needle doesn't exist in haystack
	if min > max
		return -1
	end

	return (min + max) / 2

end


def chop(needle, haystack, min = nil, max = nil)
	# since this is recursive, this puts statement only runs when min and max are nil
	if min == nil && max == nil 
		puts "Looking for #{needle} in #{haystack.join(",")}"
	end

	# short circuit if haystack is empty
	if haystack.length == 0
		return -1
	end

	# set defaults to min and max
	if min == nil
		min = 0
	end
	if max == nil
		max = haystack.length - 1
	end

	# get midpoint index of haystack
	mid = midpoint(haystack,min,max)

	if mid == -1
		return -1
	end

	if needle < haystack[mid]
		return chop(needle,haystack, min, mid - 1)
	elsif needle > haystack[mid]
		return chop(needle,haystack, mid+1, max)
	elsif needle == haystack[mid]
		return mid
	else
		return -1
	end
end

# requires running `gem install minitest` from terminal
require 'minitest/autorun'

class TestChop < Minitest::Unit::TestCase

  def test_chop
	  assert_equal(-1, chop(3, []))
	  assert_equal(-1, chop(3, [1]))
	  assert_equal(0,  chop(1, [1]))
	  #
	  assert_equal(0,  chop(1, [1, 3, 5]))
	  assert_equal(1,  chop(3, [1, 3, 5]))
	  assert_equal(2,  chop(5, [1, 3, 5]))
	  assert_equal(-1, chop(0, [1, 3, 5]))
	  assert_equal(-1, chop(2, [1, 3, 5]))
	  assert_equal(-1, chop(4, [1, 3, 5]))
	  assert_equal(-1, chop(6, [1, 3, 5]))
	  #
	  assert_equal(0,  chop(1, [1, 3, 5, 7]))
	  assert_equal(1,  chop(3, [1, 3, 5, 7]))
	  assert_equal(2,  chop(5, [1, 3, 5, 7]))
	  assert_equal(3,  chop(7, [1, 3, 5, 7]))
	  assert_equal(-1, chop(0, [1, 3, 5, 7]))
	  assert_equal(-1, chop(2, [1, 3, 5, 7]))
	  assert_equal(-1, chop(4, [1, 3, 5, 7]))
	  assert_equal(-1, chop(6, [1, 3, 5, 7]))
	  assert_equal(-1, chop(8, [1, 3, 5, 7]))
	end
end
