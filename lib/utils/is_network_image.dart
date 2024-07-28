bool isNetworkImage(String imagePath) {
  return imagePath.startsWith('http://') || imagePath.startsWith('https://');
}
