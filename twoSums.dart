void main() {
  print(twoSums([2, 7, 11, 15], 18));
  
}

List<int> twoSums(List<int> nums, int target) {
  List<int> solution = [];
  
  for (int i = 0; i < nums.length; i++) {
    if (nums.contains(target - nums[i])) {
      solution.add(i);
      solution.add(nums.indexOf(target - nums[i]));
      break;
    }
  }
  
  return solution;
}