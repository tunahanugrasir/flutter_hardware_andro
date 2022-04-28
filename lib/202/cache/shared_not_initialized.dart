class SharedNotInitializedException implements Exception{
  @override
  String toString() {
    return 'Shared not initialized';
  }
}