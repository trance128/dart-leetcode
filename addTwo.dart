// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

// You may assume the two numbers do not contain any leading zero, except the number 0 itself.

// Example:

// Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
// Output: 7 -> 0 -> 8
// Explanation: 342 + 465 = 807.

void main() {
  print(addTwoNumbers([0, 0, 1], [1, 1, 1]));
  print(addTwoNumbers([2, 4, 3], [5, 6, 4]));
  print(addTwoNumbers([4, 4, 5], [5, 5, 5]));
}

List<int> addTwoNumbers(List<int> l1, List<int> l2) {
  List<int> solution = List<int>.filled(l1.length, 0, growable: true);
  int placeholder;
  int index;

  for (int i = 0; i < l1.length; i++) {
    index = i;
    placeholder = l1[i] + l2[i];

    if (placeholder >= 10) {
      solution[index] = solution[index] + placeholder % 10;
      solution[index - 1] = solution[index - 1] + placeholder ~/ 10;

      // corrects for placeholder > 10
      while (solution[index - 1] >= 10) {
        index--;
        solution[index] = solution[index] % 10;

        // if we reached the end of the list
        if (index == 0) {
          solution.add(1);
          break;
        } else {
          solution[index - 1] = solution[index - 1] + 1;
        }
      }

    } else {
      solution[index] = placeholder;
    }
  }

  return List.from(solution.reversed);
}
