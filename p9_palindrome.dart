// Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

// Example 1:

// Input: 121
// Output: true

void main() {
  assert(isPalindrome(123) == false);
  assert(isPalindrome(121) == true);
  assert(isPalindrome(-121) == false);
  assert(isPalindrome(12121) == true);
  assert(isPalindrome(2222) == true);
  assert(isPalindrome(2121) == false);
  assert(isPalindrome(123456) == false);
}

bool isPalindrome(int x) {
  /// exepcts an int x as input.
  /// returns true if x is a palindrome, false otherwise
  
  // all negative values cannot be pal because of - sign
  if (x < 0) return false;
  return _recursivePal(x.toString());
}

bool _recursivePal(String s) {
  /// expects string s representing an int
  /// returns true if s is a palindrome, false otherwise
  if (s.length == 1) return true;
  if (s.length == 2) return s[0] == s[1];
  return s[0] == s[s.length - 1] && _recursivePal(s.substring(1, s.length - 1));
}
