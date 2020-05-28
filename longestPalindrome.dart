// Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

// Example 1:

// Input: "babad"
// Output: "bab"
// Note: "aba" is also a valid answer.

void main() {
  isPalindromeTest();
  findLongestPalSubTest();

  // testing speed of isPalindrome vs recursiveIsPalindrome
  // the difference is insignificant - recursive is about 0.1% faster 
  // but the first test (no matter which type) is significantly slower 
  recursiveSpeedTest();
  speedTest();
  recursiveSpeedTest();
  speedTest();
  recursiveSpeedTest();
}

String findLongestPalSub(String s) {
  /// Expects a string as input
  /// return a string, the longest palindrome substring

  if (s.length <= 1) return s;

  String longestSub = '';

  // find longestsub via double loop, where j = startindex and i = endindex
  for (int j = 0; j < s.length; j++) {
    for (int i = j; i <= s.length; i++) {
      if (recursiveIsPalindrome(s.substring(j, i))) {
        if (s.substring(j, i).length > longestSub.length) {
          longestSub = s.substring(j, i);
        }
      }
    }
  }

  return longestSub;
}

bool isPalindrome(String s) {
  /// Expects a string as input
  /// returns true if String is palindrome, false if not

  if (s.length == 1) return true;

  int halfLength = (s.length / 2).ceil();
  for (int i = 0; i < halfLength; i++) {
    if (s[i] != s[s.length - 1 - i]) return false;
  }

  return true;
}

bool recursiveIsPalindrome(String s) {
  /// Expects a string as input
  /// returns true if string is palindrome, false if not

  if (s.length <= 1) return true;
  if (s.length == 2) return s[0] == s[1];

  return (s[0] == s[s.length - 1] &&
      recursiveIsPalindrome(s.substring(1, s.length - 1)));
}

void isPalindromeTest() {
  /// test the isPalindrome function.
  /// If the function works correctly, there should be no output

  // test true cases, varying lengths
  assert(isPalindrome('s') == true);
  assert(isPalindrome('ss') == true);
  assert(isPalindrome('sss') == true);
  assert(isPalindrome('ssss') == true);
  assert(isPalindrome('sbbs') == true);
  assert(isPalindrome('sbs') == true);
  assert(isPalindrome('svbvs') == true);
  assert(isPalindrome('ssvbbvss') == true);

  // expect false
  assert(isPalindrome('sb') == false);
  assert(isPalindrome('sbsb') == false);
  assert(isPalindrome('ssbbs') == false);
  assert(isPalindrome('ssbbsb') == false);
}

void recursiveIsPalindromeTest() {
  /// test the isPalindrome function.
  /// If the function works correctly, there should be no output

  // test true cases, varying lengths
  assert(recursiveIsPalindrome('s') == true);
  assert(recursiveIsPalindrome('ss') == true);
  assert(recursiveIsPalindrome('sss') == true);
  assert(recursiveIsPalindrome('ssss') == true);
  assert(recursiveIsPalindrome('sbbs') == true);
  assert(recursiveIsPalindrome('sbs') == true);
  assert(recursiveIsPalindrome('svbvs') == true);
  assert(recursiveIsPalindrome('ssvbbvss') == true);

  // expect false
  assert(recursiveIsPalindrome('sb') == false);
  assert(recursiveIsPalindrome('sbsb') == false);
  assert(recursiveIsPalindrome('ssbbs') == false);
  assert(recursiveIsPalindrome('ssbbsb') == false);
}

void findLongestPalSubTest() {
  /// test the findLongestPalSub function
  /// if func works correctly, there should be no output

  // testing findLongest Pal Sub -- there should be no output
  // test subs of varied lengths
  assert(findLongestPalSub('') == '');
  assert(findLongestPalSub('s') == 's');
  assert(findLongestPalSub('ss') == 'ss');
  assert(findLongestPalSub('sss') == 'sss');

  // function finds sub at beginning, end, and middle of string of string
  assert(findLongestPalSub('ssbssedskj') == 'ssbss');
  assert(findLongestPalSub('sdfl;kjssbss') == 'ssbss');
  assert(findLongestPalSub('sssasdfjhessbbssbbsssdaflkjwe') == 'ssbbssbbss');

  // returns correct single letter when no palindrome > length 1 exists
  assert(findLongestPalSub('qwertyuiopasdfghklzxcvbnm') == 'q');

  assert(findLongestPalSub('babad') == 'bab');
}

void speedTest() {
  Stopwatch sw = Stopwatch()..start();
  for (int i = 0; i < 10000000000; i++) {
    isPalindromeTest();
  }
  print('Non-recurive executed in ${sw.elapsed}');
  sw.stop();
}

void recursiveSpeedTest() {
  Stopwatch sw = Stopwatch()..start();
  for (int i = 0; i < 10000000000; i++) {
    recursiveIsPalindromeTest();
  }
  print('Recurive executed in ${sw.elapsed}');
  sw.stop();
}
