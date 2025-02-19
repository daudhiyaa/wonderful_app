bool isPalindrome(String text) {
  String cleanText = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
  String reversedText = cleanText.split('').reversed.join('');
  return cleanText == reversedText;
}

String palindromeRes(String text) =>
    isPalindrome(text)
        ? "Yes, it's a Palindrome! 🎉"
        : "No, it's not a Palindrome! ❌";
