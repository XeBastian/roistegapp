import 'dart:math';

class GenerateKey {
  List alpha = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

  String generatedKey;

  Random rand = Random();
  String d, e, f, g, h, i, j;

  String keyGen() {
    int a = rand.nextInt(9);
    int b = rand.nextInt(9);
    int c = rand.nextInt(9);
    int k = rand.nextInt(9);
    int l = rand.nextInt(9);
    d = alpha.elementAt(rand.nextInt(25) + 1);
    e = alpha.elementAt(rand.nextInt(25) + 1);
    f = alpha.elementAt(rand.nextInt(25) + 1);
    g = alpha.elementAt(rand.nextInt(25) + 1);
    h = alpha.elementAt(rand.nextInt(25) + 1);
    i = alpha.elementAt(rand.nextInt(25) + 1);
    j = alpha.elementAt(rand.nextInt(25) + 1);
    return '$j$a$d$g$b$i$k$f$l$h$c$e';
  }
}
