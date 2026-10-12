
 // CS442 - Mobile Application Development
 // Lab Week 5 - Campus Library System
 // Name: NABIHA NOOR
 // Roll No: 022

const String rollNo = '022';

// Seeded settings - DO NOT CHANGE
final int seed = int.parse(rollNo.substring(rollNo.length - 2));
final int t = seed ~/ 10;
final int u = seed % 10;

const List<String> titles = [
  'Dart Basics',
  'Flutter In Action',
  'Data Structures',
  'Operating Systems',
  'Mobile Design',
  'Clean Code',
  'Algorithms Unlocked',
  'Computer Networks',
  'Database Systems',
  'Software Testing',
];

int yearOf(int i) => 1995 + 2 * i + t;

final int feePerDay = 5 + t;
final int daysLate = 3 + (t + u) % 6;
final int daysBig = 10 + u;
final int feeCap = 150 + 10 * t;
final int renewLimit = 1 + t % 3;
final int renewAttempts = 2 + u;
final int shelfSize = 3 + u % 4;


abstract class LibraryItem {
  final String title;
  final int year;

  LibraryItem(this.title, this.year);

  String describe() => '$title ($year)';

  int lateFee(int days);
}


abstract class Borrowable {
  bool get isAvailable;

  void borrow();

  void giveBack();
}


mixin Renewable {
  int renewals = 0;

  bool renew(int limit) {
    if (renewals >= limit) {
      return false;
    }

    renewals++;
    return true;
  }
}


class Book extends LibraryItem with Renewable implements Borrowable  {
  final int pages;

  bool _out = false;

  Book(super.title, super.year, this.pages);

  @override
  String describe() => '${super.describe()}, $pages pages';

  @override
  int lateFee(int days) {
    return days * feePerDay;
  }

  @override
  bool get isAvailable => !_out;

  @override
  void borrow() {
    _out = true;
  }

  @override
  void giveBack() {
    _out = false;
  }
}



Book mainBook() {
  return Book(titles[u], yearOf(u), 100 + 3 * seed);
}


class Magazine extends LibraryItem {
  final int issue;

  Magazine(super.title, super.year, this.issue);

  @override
  String describe() => '${super.describe()}, issue $issue';

  @override
  int lateFee(int days) {
    return days * (feePerDay ~/ 2);
  }
}


Magazine mainMagazine() {
  int i = (u + 1) % 10;

  return Magazine(
    titles[i],
    yearOf(i),
    1 + (t + u) % 12,
  );
}


class Dvd extends LibraryItem with Renewable  {
  final int minutes;

  Dvd(super.title, super.year, this.minutes);

  @override
  String describe() => '${super.describe()}, $minutes min';

  @override
  int lateFee(int days) {
    return days * feePerDay * 2;
  }
}

Dvd mainDvd() {
  int i = (u + 2) % 10;

  return Dvd(
    titles[i],
    yearOf(i),
    90 + seed % 40,
  );
}


enum MemberType {
  student(3, 50),
  faculty(10, 20),
  guest(1, 0);

  final int maxLoans;
  final int discountPercent;

  const MemberType(this.maxLoans, this.discountPercent);

  int applyDiscount(int fee) {
    return fee - (fee * discountPercent ~/ 100);
  }
}


void main() {
  print('Seed: $seed (t=$t, u=$u)');

  step1();
  step2();
  step3();
  step4();
  step5();
  step6();
  step7();
  step8();
  step9();
  step10();
}

void step1() {



  Book b = mainBook();
  LibraryItem item = b;

  print('Step 1: ${b.title} (${b.year}), ${b.pages} pages');
  print('Step 1: stored as LibraryItem: ${item.title}');
  print('Step 1: runtimeType = ${item.runtimeType}');

  // item.pages cannot be accessed because
  // LibraryItem does not have a pages field.
}



void step2() {
  print('--- Step 2 ---');

  print('Step 2: ${mainBook().describe()}');
  print('Step 2: ${mainMagazine().describe()}');

  // @override catches misspelled method names.
  // super.describe() calls the parent class method.
}


  
void step3() {
  print('--- Step 3 ---');

  print(
    'Step 3: Book late fee for $daysLate days = '
    '${mainBook().lateFee(daysLate)}',
  );

  print(
    'Step 3: Magazine late fee for $daysLate days = '
    '${mainMagazine().lateFee(daysLate)}',
  );

  print(
    'Step 3: Dvd late fee for $daysLate days = '
    '${mainDvd().lateFee(daysLate)}',
  );

  // LibraryItem cannot be instantiated directly
  // because it is an abstract class.
}



void step4() {
  print('--- Step 4 ---');

  Book book = mainBook();

  print('Step 4: available? ${book.isAvailable}');

  book.borrow();

  print('Step 4: after borrow? ${book.isAvailable}');

  book.giveBack();

  print('Step 4: after return? ${book.isAvailable}');

  List<LibraryItem> items = [
    book,
    mainMagazine(),
    mainDvd(),
  ];

  for (LibraryItem item in items) {
    print(
      'Step 4: ${item.runtimeType} '
      'borrowable? ${item is Borrowable}',
    );
  }

  // extends inherits parent class behavior.
  // implements requires the class to provide
  // implementations for the interface members.
}




void step5() {
  print('--- Step 5 ---');

  Book book = mainBook();

  int ok = 0;

  for (int i = 0; i < renewAttempts; i++) {
    if (book.renew(renewLimit)) {
      ok++;
    }
  }

  print(
    'Step 5: renewed $ok of $renewAttempts '
    'attempts (limit $renewLimit)',
  );

  print(
    'Step 5: renew once more? '
    '${book.renew(renewLimit)}',
  );

  print(
    'Step 5: dvd can renew too? '
    '${mainDvd().renew(1)}',
  );

  // A mixin is useful because Book and Dvd
  // share renewal behavior, but Magazine does not.
  // Adding renew() to LibraryItem would make
  // renewal available to every child class.
}



void step6() {
  print('--- Step 6 ---');

  MemberType type = MemberType.values[seed % 3];

  int fee = mainBook().lateFee(daysLate);

  print(
    'Step 6: member type = ${type.name} '
    '(index ${type.index})',
  );

  print('Step 6: max loans = ${type.maxLoans}');

  print(
    'Step 6: book fee $fee -> '
    '${type.applyDiscount(fee)} after discount',
  );

  // MemberType.student is safer than a string
  // because enum values are fixed and type-checked.
  // Invalid values and spelling mistakes are avoided.
}


void step7() {
  print('--- Step 7 ---');
}

void step8() {
  print('--- Step 8 ---');
}

void step9() {
  print('--- Step 9 ---');
}

void step10() {
  print('--- Step 10 ---');
}
