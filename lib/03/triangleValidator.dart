class TriangleValidator {
  bool isSideLengthValid(int sideA, int sideB, int sideC) {
    return sideA + sideB > sideC &&
        sideA + sideC > sideB &&
        sideB + sideC > sideA;
  }
}
