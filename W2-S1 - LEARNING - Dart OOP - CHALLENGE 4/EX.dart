class Distance {
  final double _distanceInCms;

  // Private constructor
  const Distance._(this._distanceInCms);

  // Named constructors for various units
  Distance.cms(double cms) : this._(cms);
  Distance.meters(double meters) : this._(meters * 100);
  Distance.kms(double kms) : this._(kms * 100000);

  // Getters for various units
  double get cms => _distanceInCms;
  double get meters => _distanceInCms / 100;
  double get kms => _distanceInCms / 100000;

  // Operator overloading for adding two distances
  Distance operator +(Distance other) {
    return Distance.cms(this._distanceInCms + other._distanceInCms);
  }
}

void main() {
  Distance d1 = Distance.kms(3.4);
  Distance d2 = Distance.meters(1000);

  // Adding two distances and getting result in kms
  print((d1 + d2).kms); // Output: 4.4
}
