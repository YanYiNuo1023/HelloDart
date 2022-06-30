import 'dart:collection';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
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

  print('"stringAreg" is OK');
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

//URIs（https://dart.cn/guides/libraries/library-tour#uris）
//编码和解码完整合法的URI
void EncodingAndDecoding() {
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');

  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);
  print('"EncodingAndDecoding" is OK');
}

//编码和解码 URI 组件
void Encoding_and_decoding_URI_components() {
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeComponent(uri);
  assert(encoded == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  var decoded = Uri.decodeComponent(encoded);
  assert(uri == decoded);
  print('"Encoding_and_decoding_URI_components" is OK');
}

//解析 URI
void Parsing_URIs() {
  var uri = Uri.parse('https://example.org:8080/foo/bar#frag');

  assert(uri.scheme == 'https');
  assert(uri.host == 'example.org');
  assert(uri.path == '/foo/bar');
  assert(uri.fragment == 'frag');
  assert(uri.origin == 'https://example.org:8080');
  print('"Parsing_URIs" is OK');
}

//构建 URI
void Building_URIs() {
  var uri = Uri(
      scheme: 'https', host: 'example.org', path: '/foo/bar', fragment: 'frag');
  assert(uri.toString() == 'https://example.org/foo/bar#frag');
  print('"Building_URIs" is OK');
}

void URIs() {
  print('\n');
  print('*' * 50);
  print('URIs');
  print('*' * 50);

  EncodingAndDecoding();
  Encoding_and_decoding_URI_components();
  Parsing_URIs();
  Building_URIs();
}

//日期和时间  (https://dart.cn/guides/libraries/library-tour#dates-and-times)
void dates_and_times() {
  print('\n');
  print('*' * 50);
  print('日期和时间');
  print('*' * 50);

  var now = DateTime.now(); //获得现在时间
  print('现在时间为：$now');

  //设置一个时间
  var y2k = DateTime(2000); // January 1, 2000
  //确切的年月日
  y2k = DateTime(2000, 1, 2); // January 2, 2000
  //确切的UTC时间
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  y2k = DateTime.parse('2000-01-01T00:00:00Z');
  y2k = DateTime.utc(2000);
  assert(y2k.millisecondsSinceEpoch == 946684800000);

  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);

  y2k = DateTime.utc(2000);
  // 时间加上一年
  var y2001 = y2k.add(const Duration(days: 366));
  assert(y2001.year == 2001);
  // 减去三十天
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366); // y2k was a leap year.
  print('y2k was a leap year.');
  print('"dates_and_times" is OK');
}

//工具类（https://dart.cn/guides/libraries/library-tour#utility-classes）
class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

class Person {
  final String firstName, lastName;
  Person(this.firstName, this.lastName);

  @override
  int get hashCode => Object.hash(firstName, lastName);

  @override
  bool operator ==(dynamic other) {
    //dynamic会关闭变量类型检查，不过可以用于存储任何一个类型的变量
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

class Process {
  final String name;
  final int pid;
  Process(this.name, this.pid);
}

class ProcessIterator implements Iterator<Process> {
  final List<Process> _processes;
  int _index = -1;
  ProcessIterator(this._processes);

  @override
  Process get current => _processes[_index];
  @override
  bool moveNext() {
    if (_index < _processes.length - 1) {
      _index++;
      return true;
    } else {
      return false;
    }
  }
}

class Processes extends IterableBase<Process> {
  final List<Process> _processes;

  @override
  final Iterator<Process> iterator;

  Processes(this._processes) : iterator = ProcessIterator(_processes);
}

void tools() {
  print('\n');
  print('*' * 50);
  print('工具类');
  print('*' * 50);

  //比较 Comparable接口
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);

  //比较自定义类
  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);

  //迭代器
  var processes = Processes([
    Process('dart', 127),
    Process('python', 234),
    Process('java', 325),
  ]);
  for (var process in processes) {
    print('${process.name} ${process.pid}');
  }

  print('"tools" is OK');
}

//异常（https://dart.cn/guides/libraries/library-tour#exceptions）
class FooException implements Exception {
  final String? msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}

void error() {
  print('\n');
  print('*' * 50);
  print('异常');
  print('*' * 50);

  try {
    throw FooException('foo');
  } on FooException catch (e) {
    print(e);
  }

  print('"error" is OK');
}

//dart:math - 数学和随机数（https://dart.cn/guides/libraries/library-tour#dartmath---math-and-random）
//三角函数
void Trigonometry() {
  //Math 库提供基本的三角函数：

  assert(cos(pi) == -1.0);
  var cos_pi = cos(pi);
  print('cos(Π)=$cos_pi');

  var degrees = 30;
  var radians = degrees * (pi / 180);
  //弧度是0.52359.
  var sinOf30degrees = sin(radians);
  print('sin(30°)=$sinOf30degrees');
  //sin 30° = 0.5
  assert((sinOf30degrees - 0.5).abs() < 0.01);
  if ((sinOf30degrees - 0.5).abs() < 0.01) {
    print('sin(30°)=0.5');
  }

  print('"Trigonometry" is OK');
}

//最大值和最小值
void Maximum_and_minimum() {
  //可以用max或min来求最值，函数在Math库里面
  assert(max(1, 1000) == 1000);
  var max_number = max(1, 1000);
  print('1和1000两数中较大者为：$max_number');

  assert(min(1, -1000) == -1000);
  var min_number = min(1, 1000);
  print('1和1000两数中较小者为：$min_number');

  print('"Maximum_and_minimum" is OK');
}

//数学常数
void Math_constants() {
  print('规定常数e为：');
  print(e); // 2.718281828459045
  print('规定常数Π为：');
  print(pi); // 3.141592653589793
  print('规定常数根号2为：');
  print(sqrt2); // 1.4142135623730951

  print('"Math_constants" is OK');
}

//随机数
void Random_numbers() {
  //使用 Random 类产生随机数。可以为 Random 构造函数提供一个可选的种子参数。
  var random = Random();
  var random1 = random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
  print(random1);
  var random2 = random.nextInt(10); // Between 0 and 9.
  print(random2);

  //也可以产生随机布尔值序列：
  var random3 = random.nextBool(); // true or false
  print(random3);

  print('"Random_numbers" is OK');
}

void dart_math() {
  print('\n');
  print('*' * 50);
  print('dart_math - 数学和随机数');
  print('*' * 50);

  Trigonometry();
  Maximum_and_minimum();
  Math_constants();
  Random_numbers();
}

//dart:convert 编解码JSON、UTF-8等（https://dart.cn/guides/libraries/library-tour#dartconvert---decoding-and-encoding-json-utf-8-and-more）
Future<void> learnConvertLib() async {
  print('\n');
  print('*' * 50);
  print('dart:convert 编解码JSON、UTF-8等');
  print('*' * 50);

  //编解码JSON
  var jsonString = '''
    [
      {"score":40},
      {"score":80}
    ]
  ''';
  var scores = jsonDecode(jsonString);
  assert(scores is List);
  var firstScore = scores[0];
  assert(firstScore is Map);
  assert(firstScore['score'] == 40);
  //使用 jsonEncode() 编码 Dart 对象为 JSON 格式的字符串
  var json = {
    'name': 'dart',
    'age': 18,
    'isStudent': true,
    'friends': ['张三', '李四', '王五'],
    'address': {'city': '北京', 'street': '东路'}
  };
  var jsonText = jsonEncode(json);
  assert(jsonText ==
      '{"name":"dart","age":18,"isStudent":true,"friends":["张三","李四","王五"],"address":{"city":"北京","street":"东路"}}');
  //int,double,String,bool,null,List,Map都可以直接编码为JSON
  //List和Map对象进行递归编码

  //编解码 UTF-8 字符
  List<int> utf8Bytes = [
    0xc3,
    0x8e,
    0xc3,
    0xb1,
    0xc5,
    0xa3,
    0xc3,
    0xa9,
    0x72,
    0xc3,
    0xb1,
    0xc3,
    0xa5,
    0xc5,
    0xa3,
    0xc3,
    0xae,
    0xc3,
    0xb6,
    0xc3,
    0xb1,
    0xc3,
    0xa5,
    0xc4,
    0xbc,
    0xc3,
    0xae,
    0xc5,
    0xbe,
    0xc3,
    0xa5,
    0xc5,
    0xa3,
    0xc3,
    0xae,
    0xe1,
    0xbb,
    0x9d,
    0xc3,
    0xb1
  ];

  var funnyWord = utf8.decode(utf8Bytes);

  assert(funnyWord == 'Îñţérñåţîöñåļîžåţîờñ');

  Stream<List<int>> inputStream = File('config').openRead();
  var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
  } catch (e) {
    print('e');
  }

  List<int> encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ');
  assert(encoded.length == utf8Bytes.length);
  for (int i = 0; i < encoded.length; i++) {
    assert(encoded[i] == utf8Bytes[i]);
  }

  print('"learnConvertLib" is OK');
}

void main(List<String> args) {
  //数字
  number();

  //字符和正则表达式
  stringAreg();

  //集合
  collections();

  //URIs
  URIs();

  //日期和时间
  dates_and_times();

  //工具类
  tools();

  //异常
  error();

  //dart_math - 数学和随机数
  dart_math();

  //dart:convert 编解码JSON、UTF-8等
  learnConvertLib();
}
