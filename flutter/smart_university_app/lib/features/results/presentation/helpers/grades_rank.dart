String getGradeLetter(int value) {
  if (value < 90) return 'F';
  if (value <= 110) return 'C';
  if (value <= 119) return 'C+';
  if (value <= 129) return 'B';
  if (value <= 139) return 'B+';
  return 'A';
}
