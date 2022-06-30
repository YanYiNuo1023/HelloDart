import 'dart:math';

//dart:core - 数字，集合，字符串等(https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more)
//数字（https://dart.cn/guides/libraries/library-tour#numbers）
void number() {
  print('\n');
  print('*' * 50);
  print('数字');
  print('*' * 50);

  //assert是在调试时才显示出来的
  //使用 int 和 double 的 parse() 方法将字符串转换为整型或双浮点型对象
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
  //使用 num 的 parse() 方法，该方法可能会创建一个整型，否则为浮点型对象
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);
  //通过添加 radix 参数，指定整数的进制基数
  assert(int.parse('42', radix: 16) == 66);
  //使用 toString() 方法将整型或双精度浮点类型转换为字符串类型
  assert(42.toString() == '42');
  assert(123.456.toString() == '123.456');
  assert(123.456.toStringAsFixed(2) == '123.46');
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  print('"number" is OK');
}

//字符和正则表达式（https://dart.cn/guides/libraries/library-tour#strings-and-regular-expressions）
void stringAreg() {
  print('\n');
  print('*' * 50);
  print('字符和正则表达式');
  print('*' * 50);

  //在字符串中搜索
  //可以在字符串内查找特定字符串的位置，以及检查字符串是否以特定字符串作为开头或结尾
  assert('Never odd or even'.contains('odd'));
  assert('Never odd or even'.startsWith('Never'));
  assert('Never odd or even'.endsWith('even'));
  assert('Never odd or even'.indexOf('odd') == 6);

  //从字符串中提取数据
  //可以获取字符串中的单个字符，将其作为字符串或者整数
  assert('Never odd or even'.substring(6, 9) == 'odd');
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');
  assert('Never odd or even'[0] == 'N');
  for (final char in 'hello'.split('')) {
    print(char);
  }
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  //首写字母大小写转换
  assert('web apps'.toUpperCase() == 'WEB APPS');
  assert('WEB APPS'.toLowerCase() == 'web apps');

  //Trimming 和空字符串
  //使用 trim() 移除首尾空格。使用 isEmpty 检查一个字符串是否为空（长度为 0）
  assert('  hello  '.trim() == 'hello');
  assert(''.isEmpty);
  assert('  '.isNotEmpty);

  //替换部分字符串
  //字符串是不可变的对象，也就是说字符串可以创建但是不能被修改
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');
  assert(greeting != greetingTemplate);

  //构建一个字符串
  //要以代码方式生成字符串，可以使用 StringBuffer
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();
  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  //正则表达式
  //使用正则表达式可以对字符串进行高效搜索和模式匹配
  var numbers = RegExp(r'\d+');
  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
  assert(numbers.hasMatch(someDigits));
  //检查字符串中是否有正则表达式的匹配
  for (final match in numbers.allMatches(someDigits)) {
    print(match.group(0)); // 15, then 20
  }
}

//集合（https://dart.cn/guides/libraries/library-tour#collections）
void the_lists() {
  //lists 可以通过字面量来创建和初始化，也可以使用 List 的构造函数
  var grains = <String>[];
  assert(grains.isEmpty);
  var fruits = ['apples', 'oranges'];
  fruits.add('kiwis');
  fruits.addAll(['grapes', 'bananas']);
  assert(fruits.length == 5);
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);
  fruits.clear();
  assert(fruits.isEmpty);
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  //使用 indexOf() 方法查找一个对象在 list 中的下标值。
  fruits = ['apples', 'oranges'];
  assert(fruits[0] == 'apples');
  assert(fruits.indexOf('apples') == 0);
  fruits.clear();

  //使用 sort() 方法排序一个 list 。
  fruits = ['bananas', 'apples', 'oranges'];
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');

  //列表是参数化类型（泛型），因此可以指定 list 应该包含的元素类型
  fruits = <String>[];
  fruits.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);

  //fruits.add(5);
  //assert(fruit is String);
  // Error: 'int' can't be assigned to 'String'
  print('"the_list" is OK');
}

void the_sets() {
  //在 Dart 中，set 是一个无序的，元素唯一的集合
  //因为一个 set 是无序的，所以无法通过下标（位置）获取 set 中的元素
  var ingredients = <String>{};
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);
  ingredients.add('gold');
  assert(ingredients.length == 3); //集合要保持单一性，多个只存在一个
  ingredients.add('apples');
  assert(ingredients.length == 4); //测试上述思考
  print('ingredients:$ingredients');
  ingredients.remove('apples');
  ingredients.remove('gold');
  assert(ingredients.length == 2);
  var atomicNumbers = Set.from([79, 22, 54]);
  print('这是一个集合：$atomicNumbers');

  //使用 contains() 和 containsAll() 来检查一个或多个元素是否在 set 中
  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.contains('titanium'));
  assert(ingredients.containsAll(['titanium', 'xenon']));

  //交集是另外两个 set 中的公共元素组成的 set
  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));

  print('"the_set" is OK');
}

void the_maps() {
  //map 是一个无序的 key-value（键值对）集合,map其实就是所学是hash
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  var searchTerms = Map();
  var nobleGases = Map<int, String>();

  //通过大括号语法可以为 map 添加，获取，设置元素。使用 remove() 方法从 map 中移除键值对
  nobleGases = {54: 'xenon'};
  assert(nobleGases[54] == 'xenon');
  assert(nobleGases.containsKey(54));
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

  //可以从一个 map 中检索出所有的 key 或所有的 value
  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  var keys = hawaiianBeaches.keys;
  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  print('"the_maps" is OK');
}

void CommonCollectionMethods() {
  //公共集合方法
  //使用 isEmpty 和 isNotEmpty 方法可以检查 list， set 或 map 对象中是否包含元素
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  //使用 forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法
  teas.forEach((tea) => print('I drink $tea'));

  //当在 map 对象上调用 `forEach() 方法时，函数必须带两个参数（key 和 value）
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  hawaiianBeaches.forEach((key, value) {
    print('I want to visit $key and swim at $value');
  });

  //Iterable 提供 map() 方法，这个方法将所有结果返回到一个对象中
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  //使用 map().toList() 或 map().toSet() ，可以强制在每个项目上立即调用函数
  var loadTeas_str = loudTeas = teas.map((e) => e.toUpperCase()).toList();
  print(loadTeas_str);

  //使用 Iterable 的 where() 方法可以获取所有匹配条件的元素
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
  assert(teas.any(isDecaffeinated));
  assert(!teas.every(isDecaffeinated));
  assert(decaffeinatedTeas.contains('chamomile'));

  print('"CommonCollectionMethods" is OK');
}

void collections() {
  print('\n');
  print('*' * 50);
  print('集合');
  print('*' * 50);

  the_lists();
  the_sets();
  the_maps();
  CommonCollectionMethods();
}

void main(List<String> args) {
  //数字
  number();

  //字符和正则表达式
  stringAreg();

  //集合
  collections();
}
