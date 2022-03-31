//导入（https://dart.cn/samples#imports）
import 'dart:math';

//变量 （https://dart.cn/samples#variables）
void variables() {
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

  while (year < 2016) {
    year += 1;
  }
}

//函数（https://dart.cn/samples#functions）
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  //变量
  variables();
  //流程控制语句
  control();
  //函数
  var result = fibonacci(20);
  print('result = $result');
  //导入
  var intValue = Random().nextInt(10); 
  print('intValue = $intValue');
}
