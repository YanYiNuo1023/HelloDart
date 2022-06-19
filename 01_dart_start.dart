//导入（https://dart.cn/samples#imports）
import 'dart:math';
import 'dart:async';
import 'dart:io';

//变量 （https://dart.cn/samples#variables）
void variables() {
  print('\n');
  print('*' * 50);
  print('变量');
  print('*' * 50);

  var name = 'Voryager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Urans', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  print(
      'name is $name, year is $year, antennaDiameter is $antennaDiameter, flybyObjects is $flybyObjects, image is $image');
}

//流程控制语句（https://dart.cn/samples#control-flow-statements）
void control() {
  print('\n');
  print('*' * 50);
  print('流程控制语句');
  print('*' * 50);

  var year = 1977;
  var flybyObjects = ['Jupiter', 'Saturn', 'Urans', 'Neptune'];

  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  year = 2010;
  while (year < 2016) {
    year += 1;
    print(year);
  }
}

//函数（https://dart.cn/samples#functions）
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void functions() {
  print('\n');
  print('*' * 50);
  print('函数');
  print('*' * 50);

  var result = fibonacci(20);
  print('fibonacci(20) = $result');

  var flybyObjects = [
    'hello',
    'abc',
    '123',
    'how do you do',
    'nice to meet you'
  ];
  for (final object in flybyObjects) {
    print(object);
  }
  print('上述语句中包含"you"的语句如下：');
  flybyObjects.where((name) => name.contains('you')).forEach(print);
}

//注释（https://dart.cn/samples#comments）
void annotations() {
  print('\n');
  print('*' * 50);
  print('注释');
  print('*' * 50);

  /// 这是一个文档注释。
  /// 文档注释用于为库、类以及类的成员添加注释。
  /// 像 IDE 和 dartdoc 这样的工具可以专门处理文档注释。

/* 也可以像这样使用单斜杠和星号的注释方式 */
  print('注释不会被输出，也不会进行操作');
}

//导入（https://dart.cn/samples#imports）
void import() {
  print('\n');
  print('*' * 50);
  print('导入');
  print('*' * 50);

  var intValue = Random().nextInt(10);
  print('intValue = $intValue');
}

//类（https://dart.cn/samples#classes）
class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {}

  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void classes() {
  print('\n');
  print('*' * 50);
  print('类');
  print('*' * 50);

  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
}

//扩展类（继承）（https://dart.cn/samples#inheritance）
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);

  @override
  void describe() {
    super.describe();
    print('Altitude : $altitude km');
  }
}

void inheritance() {
  print('\n');
  print('*' * 50);
  print('扩展类（继承）');
  print('*' * 50);

  var voyager2 = Orbiter('Voyager II', DateTime(1992, 5, 11), 500);
  voyager2.describe();
}

//Mixins (https://dart.cn/samples#mixins)
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

void mixins() {
  print('\n');
  print('*' * 50);
  print('Mixins');
  print('*' * 50);

  var voyager4 = PilotedCraft('Voyager IV', DateTime(1991, 11, 29));
  voyager4.describe();
  voyager4.describeCrew();
}

//接口和抽象类（https://dart.cn/samples#interfaces-and-abstract-classes）
class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  String name;

  MockSpaceship(this.name, this.launchDate);

  @override
  void describe() {
    print('Mock Spacecraft: $name');
  }

  @override
  int? get launchYear => launchDate?.year;
}

void interface_and_abstract_classes() {
  print('\n');
  print('*' * 50);
  print('接口和抽象类');
  print('*' * 50);

  var voyager5 = MockSpaceship('Voyager V', null);
  voyager5.describe();
}

//异步（https://dart.cn/samples#async）
Future<void> the_async() async {
  print('\n');
  print('*' * 50);
  print('异步');
  print('*' * 50);

  const oneSecond = Duration(seconds: 1);

  Future<void> printWithDelay1(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  printWithDelay1('过了1秒钟.1');
  print('done 1.');

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  printWithDelay2('过了1秒钟.2');
  print('done 2.');

  Future<void> createDescriptions(Iterable<String> objects) async {
    for (final object in objects) {
      try {
        var file = File('$object.txt');
        if (await file.exists()) {
          var modified = await file.lastModified();
          print(
              'File for $object already exists. It was modified on $modified.');
          continue;
        }
        await file.create();
        await file.writeAsString('Start Describing $object in this file.');
        print('File for $object created.');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }

  var objects = ['Jupiter', 'Saturn', 'Urans', 'Neptune'];
  createDescriptions(objects);

  await Future.delayed(Duration(seconds: 5));
}

//异常（https://dart.cn/samples#exceptions）
Future<void> findDescriptions(flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (ex) {
    print('Could not describe object: $ex');
  } finally {
    flybyObjects.clear();
  }
}

void abnormal_exceptions() {
  print('\n');
  print('*' * 50);
  print('异常');
  print('*' * 50);

  var flybyObjects = ['Jupiter', 'Saturn', 'Pluto'];
  findDescriptions(flybyObjects);
}

Future<void> main(List<String> args) async {
  //变量
  variables();
  //流程控制语句
  control();
  //函数
  functions();
  //注释
  annotations();
  //导入
  import();
  //类
  classes();
  //扩展类（继承）
  inheritance();
  //Mixins
  mixins();
  //接口和抽象类
  interface_and_abstract_classes();
  // 异步
  await the_async();
  //异常
  abnormal_exceptions();
}
