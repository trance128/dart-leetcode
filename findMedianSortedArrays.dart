// So, in the end I got it but it's not the right complexity cuz of the case where i needed to drop from the same list.


// There are two sorted arrays nums1 and nums2 of size m and n respectively.
// Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
// You may assume nums1 and nums2 cannot be both empty.

// Example 1:
// nums1 = [1, 3]
// nums2 = [2]
// The median is 2.0

import 'dart:math';

void main() {
  print(findMedianSortedArrays([1], [3]));
  print(findMedianSortedArrays([1, 10], [3]));
  print(findMedianSortedArrays([1, 10], [3, 30]));
  print(findMedianSortedArrays([1, 10, 20, 100, 101, 102, 103], [2, 3]));
  print(findMedianSortedArrays([1, 2, 3, 100, 120, 200], [10, 11]));
  print(findMedianSingleArray([1, 2, 3, 10, 11, 100, 120, 200]));
}

double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  /// takes two sorted Lists of ints
  /// returns the median (dbl) of both arrays
  
  // handle empty array cases
  if (nums1.length == 0) return findMedianSingleArray(nums2);
  if (nums2.length == 0) return findMedianSingleArray(nums1);

  if (nums1.length == 1 && nums2.length == 1) {
    return findMedianSingleArray([nums1[0], nums2[0]]);
  } else if ((nums1.length == 2 || nums1.length == 1) && (nums2.length == 1 || nums2.length == 2)){
    nums1.addAll(nums2);
    nums1.sort();
    return findMedianSingleArray(nums1);
  } else if (nums1[nums1.length-1] > nums2[nums2.length-1] && nums1[0] < nums2[0]) {
    return findMedianSortedArrays(nums1.sublist(1, nums1.length-1), nums2);
  } else if (nums2[nums2.length-1] > nums1[nums1.length-1] && nums2[0] < nums1[0] ) {
    return findMedianSortedArrays(nums2.sublist(1, nums2.length-1), nums1);
  }
  else {
    double ans1 = findMedianSingleArray(nums1);
    double ans2 = findMedianSingleArray(nums2);
    int dropLength = (min(nums1.length, nums2.length) / 2).ceil();

    if (ans1 == ans2) return ans1;

    // recursively return answer
    if (ans1 > ans2) {
      return findMedianSortedArrays(nums1.sublist(0, nums1.length - dropLength), nums2.sublist(dropLength));
    } else {
      return findMedianSortedArrays(nums2.sublist(0, nums2.length - dropLength), nums1.sublist(dropLength));
    }
  }
}

double findMedianSingleArray(List<int> nums) {
  /// takes a single sorted list of ints
  /// returns the median of that array, or null if array is empty
  
  // divide ans by 1 to quickly convert to double
  if (nums.length == 1) {
    return nums[0] / 1;
  } else if (nums.length == 0) {
    return null;
  } else if (nums.length % 2 == 0) {
    return (nums[nums.length ~/ 2 - 1] + nums[nums.length ~/ 2]) / 2;
  } else {
    return nums[(nums.length / 2 - 1).ceil()] / 1;
  }
}

void testFindMedianSingleArray() {
  print(findMedianSingleArray([1, 2, 100, 101, 102]));
  print(findMedianSingleArray([1, 3]));
  print(findMedianSingleArray([1, 2, 3]));
  print(findMedianSingleArray([1, 2]));
  print(findMedianSingleArray([1]));
  print(findMedianSingleArray([]));
}