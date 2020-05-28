// Given a 32-bit signed integer, reverse digits of an integer.

// Example 1:

// Input: 123
// Output: 321

import 'dart:math';

void main() {
  // testing recursive vs regular
  // verdict -- recursive is exponentially faster when x is low
  // however, recursive is slightly slower when x has maximum digits

  // no difference between recursive and nostring.  Values identical.
  testRecursive();
  testNoString();
  testRecursive();
  testNoString();  
  testRecursive();
}

int reverse(int x) {
  /// expects an int x as input
  /// returns that int reversed eg x = 21; return 12;
  
  String returnString = x < 0 ? '-' : '';
  String s = x.abs().toString();
  returnString += s.split('').reversed.join('');
  return int.parse(returnString);
}

// recursive version of the above
int recursiveReverse(int x) {
  if (x < 10 && x >= 0) return x;
  if (x < 0) return (0 - recursiveReverse(x.abs()));
  return (x%10 * pow(10, x.toString().length - 1) + recursiveReverse(x~/10));
}

// curious how expensive .toString() is, so redoing above fucntion without it
int recursiveNoString(int x) {
  if (x < 10 && x >= 0) return x;
  if (x < 0) return (0 - recursiveReverse(x.abs()));

  int length = 0;
  int copy = x;
  while (copy > 9) {
    length++;
    copy = copy ~/ 10;
  }
  return (x%10 * pow(10, length) + recursiveReverse(x~/10));
}

void testRecursive() {
  Stopwatch sw = Stopwatch()..start();
  for(int i=0; i<10000000; i++) {
    recursiveReverse(-5371);
    recursiveReverse(-5371);
    recursiveReverse(-5371);
    recursiveReverse(-5371);
    recursiveReverse(-5371);
    recursiveReverse(-5371);
    recursiveReverse(-5371);
    recursiveReverse(-5371);
    recursiveReverse(-5371);
    recursiveReverse(-5371);
  }
  print('Recursive -- ${sw.elapsed}');
  sw.stop();
}

void testNoString() {
  Stopwatch sw = Stopwatch()..start();
  for(int i=0; i<10000000; i++) {
    recursiveNoString(-5371);
    recursiveNoString(-5371);
    recursiveNoString(-5371);
    recursiveNoString(-5371);
    recursiveNoString(-5371);
    recursiveNoString(-5371);
    recursiveNoString(-5371);
    recursiveNoString(-5371);
    recursiveNoString(-5371);
    recursiveNoString(-5371);
  }
  print('Regular -- ${sw.elapsed}');
  sw.stop();
}