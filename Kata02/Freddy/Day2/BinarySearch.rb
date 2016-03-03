def chop(needle, haystack)
    puts "finding #{needle} in #{haystack.join(",")}"
    idx = nil
    if haystack.length == 0
        idx = -1
    end
    
    min = 0
    max = haystack.length - 1
    while idx == nil
    
        mid = (min + max) / 2
        if needle < haystack[mid]
            max = mid-1
        elsif needle > haystack[mid]
            min = mid+1
        elsif needle == haystack[mid]
            idx = mid
        end
    
        if (min > max)
            idx = -1
        end
    end
    
    return idx    
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