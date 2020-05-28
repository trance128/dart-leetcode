// The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
// The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
// If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
// If no valid conversion could be performed, a zero value is returned.

int MAX_INT = 2147483647;
int MIN_INT = -2147483648;

void main() {
  // if function is correct, we'll see no output
  assert(myAtoi('42') == 42);
  assert(myAtoi('-42') == -42);
  assert(myAtoi('   -594') == -594);
  assert(myAtoi('  234 is a great number') == 234);
  assert(myAtoi('No int') == 0);
  assert(myAtoi('1234567898765432123456789876543') == MAX_INT);
  assert(myAtoi('-12345678998876543334567') == MIN_INT);
}

int myAtoi(String s) {
  /// expets a string s, which will be converted to number
  /// returns numeric part of string, or MAX_INT or MIN_INT if 
  /// int is over 32-bit signed 
  /// does not support doubles
  String returnString = '';
  int returnInt;
  s = s.trim();

  for (int i = 0; i < s.length; i++) {
    // handles negative
    if (i == 0) {
      if (s.substring(i, i + 1) == '-') {
        returnString += '-';
        continue;
      }
    }

    // breaks when encountering first non-numeric char
    if (isNumeric(s.substring(i, i + 1))) {
      returnString += s.substring(i, i + 1);
    } else
      break;
  }

  if (returnString.length == 0) return 0;

  // dart's int is 64 bit, so we're returning 32-bit as per problem spec, or int overflow
  try {
    returnInt = int.parse(returnString);
    if (returnInt > MAX_INT) return MAX_INT;
    if (returnInt < MIN_INT) return MIN_INT;
    return returnInt;
  } on FormatException {
    if (int.parse(returnString.substring(0, 3)) < 0) return MIN_INT;
    return MAX_INT;
  }
}

bool isNumeric(String s) {
  /// expects a String of length 1
  /// returns true if s is numeric, false otherwise

  return s.compareTo('0') >= 0 && s.compareTo('9') <= 0;
}
