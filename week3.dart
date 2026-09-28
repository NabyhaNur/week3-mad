// Week3.dart

final List<Map<String, dynamic>> books = [
  {
    'title': 'Dart in Action',
    'author': 'Ada',
    'year': 2021,
    'copies': 3,
    'tags': ['dart', 'programming']
  },
  {
    'title': 'Flutter Basics',
    'author': 'Sam',
    'year': 2023,
    'copies': 0,
    'tags': ['flutter', 'mobile']
  },
  {
    'title': 'Clean Code',
    'author': 'Martin',
    'year': 2008,
    'copies': 2,
    'tags': ['programming', 'design']
  },
  {
    'title': 'Algorithms',
    'author': 'Knuth',
    'year': 1968,
    'copies': 1,
    'tags': ['programming', 'math']
  },
  {
    'title': 'UI Design',
    'author': 'Nora',
    'year': 2019,
    'copies': 4,
    'tags': ['design', 'mobile']
  },
];

// part1

double lateFee(int daysLate, double ratePerDay) => daysLate * ratePerDay;

String formatTitle(String title, [String? author]) {
  return author == null ? title : '$title by $author';
}

Map<String, dynamic> makeBook({
  required String title,
  required String author,
  int year = 2024,
  int copies = 1,
}) {
  return {
    'title': title,
    'author': author,
    'year': year,
    'copies': copies,
  };
}

bool isClassic(int year) => year < 2000;

// part2

List<String> transformAll(
    List<String> items, String Function(String) fn) {
  return items.map(fn).toList();
}

int Function() makeCounter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}

double Function(int) makeFeeCalculator(double rate) {
  return (int days) => days * rate;
}

int sumDigits(int n) {
  if (n < 10) return n;

  return (n % 10) + sumDigits(n ~/ 10);
}

// part3

Map<String, int> buildStock() {
  return {
    for (var b in books) b['title'] as String: b['copies'] as int,
  };
}

// part4

class Box<T> {
  T value;

  Box(this.value);
}

T firstOr<T>(List<T> items, T fallback) {
  return items.isEmpty ? fallback : items.first;
}

class Pair<A, B> {
  A first;
  B second;

  Pair(this.first, this.second);

  @override
  String toString() {
    return '($first, $second)';
  }
}

// part5
class BookNotFoundException implements Exception {
  final String title;

  BookNotFoundException(this.title);

  @override
  String toString() => 'Not found: "$title"';
}

class BookNotAvailableException implements Exception {
  final String title;

  BookNotAvailableException(this.title);

  @override
  String toString() => 'Sorry: "$title" has no copies left';
}

void checkOut(Map<String, int> stock, String title) {
  if (!stock.containsKey(title)) {
    throw BookNotFoundException(title);
  }

  if (stock[title]! <= 0) {
    throw BookNotAvailableException(title);
  }

  stock[title] = stock[title]! - 1;
}

Map<String, dynamic> findBook(String title) {
  return books.firstWhere(
    (book) => book['title'] == title,
  );
}

//part6
Future<String> fetchBookOfTheDay() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Dart in Action';
}

Future<String> fetchBroken() async {
  await Future.delayed(Duration(milliseconds: 500));
  throw Exception('Server down');
}

// main
void main() async {
  part1();
  part2();
  part3();
  part4();
  part5();
  await part6();
}

void part1() {
  print('Part 1');

  print('Late fee: ${lateFee(5, 0.5)}');
  print(formatTitle('Dart in Action'));
  print(formatTitle('Dart in Action', 'Ada'));

  print(makeBook(
    title: 'Clean Code',
    author: 'Martin',
  ));

  print(makeBook(
    title: 'Algorithms',
    author: 'Knuth',
    year: 1968,
  ));

  print(isClassic(1968));
  print(isClassic(2021));
}

void part2() {
  print('Part 2 ');

  var titles = ['Dart in Action', 'Clean Code'];

  print(transformAll(
      titles, (item) => item.toUpperCase()));

  print(transformAll(
      titles, (item) => '$item!'));

  var desk1 = makeCounter();
  var desk2 = makeCounter();

  print(desk1());
  print(desk1());
  print(desk1());

  print(desk2());

  var studentFee = makeFeeCalculator(0.25);
  var staffFee = makeFeeCalculator(0.10);

  print('Student fee: ${studentFee(4)}');
  print('Staff fee: ${staffFee(4)}');

  print('Sum of digits: ${sumDigits(125)}');
}

void part3() {
  print(' Part 3 ');

  var titles =
      books.map((b) => b['title']).toList();

  print('Titles: $titles');

  var available = books
      .where((b) => b['copies'] > 0)
      .map((b) => b['title'])
      .toList();

  print('Available: $available');

  int totalCopies = books.fold(
      0, (sum, b) => sum + (b['copies'] as int));

  print('Total copies: $totalCopies');

  var years =
      books.map((b) => b['year'] as int).toList();

  int oldestYear =
      years.reduce((a, b) => a < b ? a : b);

  print('Oldest year: $oldestYear');

  var sortedBooks = List.of(books);

  sortedBooks.sort(
      (a, b) => (a['year'] as int).compareTo(b['year'] as int));

  print(
      'By year: ${sortedBooks.map((b) => b['title']).toList()}');

  var stock = buildStock();

  print('Stock: $stock');

  stock.forEach((title, copies) {
    if (copies == 0) {
      print('Out of stock: $title');
    }
  });

  print('Copies of Unknown: ${stock['Unknown'] ?? 0}');

  Set<String> allTags = {
    for (var b in books)
      ...(b['tags'] as List).cast<String>()
  };

  print('All tags: $allTags');

  var a = {
    'Dart in Action',
    'Clean Code',
    'Flutter Basics'
  };

  var b = {
    'Clean Code',
    'Flutter Basics',
    'Algorithms'
  };

  print('Union: ${a.union(b)}');
  print('Common: ${a.intersection(b)}');
  print('Only in A: ${a.difference(b)}');
}

void part4() {
  print(' Part 4 ');

  var intBox = Box<int>(5);
  var strBox = Box<String>('dart');

  print('Box<int>: ${intBox.value}');
  print('Box<String>: ${strBox.value}');

  print(firstOr(
      ['Dart in Action', 'Clean Code'], 'none'));

  print(firstOr<String>([], 'z'));

  print(Pair('Dart in Action', 3));
}

void part5() {
  print(' Part 5 ');

  var stock = buildStock();

  for (var title in [
    'Dart in Action',
    'Flutter Basics',
    'Unknown Book'
  ]) {
    try {
      checkOut(stock, title);
      print('Checked out: $title');
    } on BookNotAvailableException catch (e) {
      print(e);
    } on BookNotFoundException catch (e) {
      print(e);
    } finally {
      print('Transaction logged.');
    }
  }

  print(
      'Copies left of Dart in Action: ${stock['Dart in Action']}');

  try {
    findBook('Missing');
  } on StateError {
    print('Search failed: no such book');
  }
}

Future<void> part6() async {
  print(' Part 6 ');

  print('Fetching...');

  String book = await fetchBookOfTheDay();

  print('Book of the day: $book');

  try {
    await fetchBroken();
  } catch (e) {
    print('Fetch failed: $e');
  }
}