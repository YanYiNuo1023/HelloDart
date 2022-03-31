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

void main() {
  //变量
  variables();
  control();
}
