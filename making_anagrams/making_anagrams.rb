require 'pry'
# https://www.hackerrank.com/challenges/ctci-making-anagrams
# aka the deletion problem

# take two string inputs
# compare the strings - return characters they do not have in common
# count those characters

def difference(str1, str2)
  #turn to arrays
  arr1 = str1.split('')
  arr2 = str2.split('')

  return 0 if both_blank?(arr1, arr2)

  freq1 = frequencies(arr1)
  freq2 = frequencies(arr2)
  binding.pry
  compare(freq1, freq2)
end

def both_blank?(arr1, arr2)
  if arr1.empty? && arr2.empty?
    true
  else
    false
  end
end

def frequencies(array)
  array.reduce(Hash.new(0)) do |ac, v|
    ac[v] += 1 ; ac
  end
end

def compare(freq1, freq2)
  #compares two frequency hashes and returns a count
  freq_count = freq1.reduce(0) do |count, (k, v)|
      if freq2[k] == 0
        count += 1
      elsif freq2[k] != v
        count += (freq2[k] - v).abs
      elsif freq2[k] == v
        freq2.delete(k)
      end
    count
  end
  freq_count + freq2.values.reduce(:+)
end