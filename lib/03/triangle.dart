class Triangle {
  Triangle(int sideA, int sideB, int sideC) {
    if (!siteRelationValid(sideA, sideB, sideC)) {
      throw new ArgumentError();
    }
  }

  bool siteRelationValid(int sideA, int sideB, int sideC) {
    return sideA + sideB > sideC &&
        sideA + sideC > sideB &&
        sideB + sideC > sideA;

  }
}