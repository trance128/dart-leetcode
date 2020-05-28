// Write the code that will take a string and make this conversion given a number of rows:

// string convert(string s, int numRows);

// Example 1:

// Input: s = "PAYPALISHIRING", numRows = 3
// Output: "PAHNAPLSIIGYIR"

void main() {
  // testing -- we should see no output
  assert(ziggzagg('PAYPALISHIRING', 3) == 'PAHNAPLSIIGYIR');
  assert(ziggzagg('01234567890123456789', 1) == '01234567890123456789');
  assert(ziggzagg('012345678', 2) == '024681357');
  assert(ziggzagg('012345678901', 3) == '048135791261');
  assert(ziggzagg('0123456789012345678', 4) == '0628157137248046395');
  assert(ziggzagg('01234567890123456789', 5) == '08617957260483513942');
}

String ziggzagg(String s, int numRows) {
  /// expects 2 positional args, string s and int numRows
  /// returns a string, ziggzagged version of input

  // handles fringe cases, numRows = 1 or 2
  if (numRows == 1) return s;
  if (numRows == 2) {
    String returnString = '';
    for (int j = 0; j < 2; j++) {
      for (int i = 0; i < s.length; i++) {
        if (i % 2 == j) {
          returnString += s.substring(i, i + 1);
        }
      }
    }

    return returnString;
  }

  // Non-fringe cases start here

  // create a list of list, with first list moving straight down, normally
  // second list represents diagonal (zag) movement, with first and last
  // values = null
  List rootList = [];
  int listIndex = -1;
  bool straight = true;
  int iteration = 0;

  for (int i = 0; i < s.length; i++) {
    if (straight) {
      if (iteration == 0) {
        rootList.add(List(numRows));
        listIndex++;
      }

      rootList[listIndex][iteration] = s.substring(i, i + 1);
      iteration++;

      // when straight is done, reset iteration to build diagonal list
      if (iteration == numRows) {
        straight = false;
        iteration = 0;
      }
    } else {
      if (iteration == 0) {
        rootList.add(List(numRows));
        listIndex++;
      }

      iteration++;
      rootList[listIndex][numRows - iteration - 1] = s.substring(i, i + 1);
      if (iteration == numRows - 2) {
        iteration = 0;
        straight = true;
      }
    }
  }

  // reset needed values and build return string
  String returnString = '';
  straight = true;

  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < rootList.length; j++) {
      if (rootList[j][i] != null) {
        returnString += rootList[j][i];
      }
    }
  }
  return returnString;
}
