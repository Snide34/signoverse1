// lib/models/dictionary_item.dart

class DictionaryItem {
  final String letter;
  final String imagePath;

  DictionaryItem({required this.letter, required this.imagePath});
}

final List<DictionaryItem> alphabetSigns = [
  // IMPORTANT: You need to save 26 images (A.png, B.png, etc.)
  // into your assets/images/ folder based on the screenshot (image_d76e9a.png).
  DictionaryItem(letter: 'A', imagePath: 'assets/images/signs/A.png'),
  DictionaryItem(letter: 'B', imagePath: 'assets/images/signs/B.png'),
  DictionaryItem(letter: 'C', imagePath: 'assets/images/signs/C.png'),
  DictionaryItem(letter: 'D', imagePath: 'assets/images/signs/D.png'),
  DictionaryItem(letter: 'E', imagePath: 'assets/images/signs/E.png'),
  DictionaryItem(letter: 'F', imagePath: 'assets/images/signs/F.png'),
  DictionaryItem(letter: 'G', imagePath: 'assets/images/signs/G.png'),
  DictionaryItem(letter: 'H', imagePath: 'assets/images/signs/H.png'),
  DictionaryItem(letter: 'I', imagePath: 'assets/images/signs/I.png'),
  DictionaryItem(letter: 'J', imagePath: 'assets/images/signs/J.png'),
  DictionaryItem(letter: 'K', imagePath: 'assets/images/signs/K.png'),
  DictionaryItem(letter: 'L', imagePath: 'assets/images/signs/L.png'),
  DictionaryItem(letter: 'M', imagePath: 'assets/images/signs/M.png'),
  DictionaryItem(letter: 'N', imagePath: 'assets/images/signs/N.png'),
  DictionaryItem(letter: 'O', imagePath: 'assets/images/signs/O.png'),
  DictionaryItem(letter: 'P', imagePath: 'assets/images/signs/P.png'),
  DictionaryItem(letter: 'Q', imagePath: 'assets/images/signs/Q.png'),
  DictionaryItem(letter: 'R', imagePath: 'assets/images/signs/R.png'),
  DictionaryItem(letter: 'S', imagePath: 'assets/images/signs/S.png'),
  DictionaryItem(letter: 'T', imagePath: 'assets/images/signs/T.png'),
  DictionaryItem(letter: 'U', imagePath: 'assets/images/signs/U.png'),
  DictionaryItem(letter: 'V', imagePath: 'assets/images/signs/V.png'),
  DictionaryItem(letter: 'W', imagePath: 'assets/images/signs/W.png'),
  DictionaryItem(letter: 'X', imagePath: 'assets/images/signs/X.png'),
  DictionaryItem(letter: 'Y', imagePath: 'assets/images/signs/Y.png'),
  DictionaryItem(letter: 'Z', imagePath: 'assets/images/signs/Z.png'),
];