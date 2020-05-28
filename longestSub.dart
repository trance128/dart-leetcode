// Given a string, find the length of the longest substring without repeating characters.
// Input: "abcabcbb"
// Output: 3 
// Explanation: The answer is "abc", with the length of 3. 

main() {
  print(longestSubString('abcabcbb'));
  print(longestSubString('bbbbb'));
  print(longestSubString('pwwkew'));
  print(longestSubString('Ovidius'));
  print(longestSubString('Ovid'));
  print(longestSubString('The quick brown fox jumped over the lazy dog'));
  print(longestSubString("I'm typing a random string"));
}

int longestSubString(String s) {
  String substring, longestSub;
  var endIndex = 0, maxSubstringLength = 0, repeatFound = false;

  for (int i = 0; i < s.length -1; i++) {
    // reset
    repeatFound = false;
    endIndex = i + 1;

    while(!repeatFound) {
      substring = s.substring(i, endIndex);

      if (substring.length > maxSubstringLength) {
        maxSubstringLength = substring.length;
        longestSub = s.substring(i, endIndex);
      };

      // break if reached end of s.length
      endIndex++;
      if (endIndex > s.length) {
        break;
      }

      // if next char is already in substring, break while loop
      if (substring.contains(s.substring(endIndex-1, endIndex))) {
        repeatFound = true;

        // skip unneccessary iterations
        i = endIndex - 1;
      };
      
    }
  }

  print('Longest sub $longestSub');
  return maxSubstringLength;
}