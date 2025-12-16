program DiagonalAdvanced;
const
  MaxN = 20;  { зменшено для зручного виведення на екран }
type
  TArray = array[1..MaxN, 1..MaxN] of integer;
var
  a: TArray;
  n, i, j: integer;
  sumMain, sumAnti: real;
  countMain, countAnti: integer;
  minVal, maxVal: integer;
  sumAbove, sumBelow, sumOnDiag: longint;

begin
  randomize;

  writeln('Введіть розмір квадратного масиву n (1..', MaxN, '):');
  readln(n);
  
  if (n < 1) or (n > MaxN) then
  begin
    writeln('Неправильний розмір масиву!');
    halt;
  end;

  { Генерація масиву }
  for i := 1 to n do
    for j := 1 to n do
      a[i, j] := random(201) - 100;

  { Вивід масиву з виділенням діагоналей }
  writeln('Згенерований масив (головна діагональ у [ ], побічна у < >):');
  for i := 1 to n do
  begin
    for j := 1 to n do
    begin
      if (i = j) and (i = n + 1 - j) then
        write('[', a[i,j]:4, '] ')  { елемент належить обом діагоналям (тільки при непарному n) }
      else if i = j then
        write('[', a[i,j]:4, '] ')  { головна діагональ }
      else if i = n + 1 - j then
        write('<', a[i,j]:4, '> ')  { побічна діагональ }
      else
        write(' ', a[i,j]:4, '  '); { звичайний елемент }
    end;
    writeln;
  end;
  writeln;

  { Обчислення для головної діагоналі }
  sumMain := 0;
  countMain := 0;
  for i := 1 to n do
  begin
    sumMain := sumMain + a[i, i];
    inc(countMain);
  end;

  { Обчислення для побічної діагоналі }
  sumAnti := 0;
  countAnti := 0;
  for i := 1 to n do
  begin
    sumAnti := sumAnti + a[i, n + 1 - i];
    inc(countAnti);
  end;

  { Мінімум і максимум на обох діагоналях }
  minVal := a[1,1];
  maxVal := a[1,1];
  for i := 1 to n do
  begin
    if a[i,i] < minVal then minVal := a[i,i];
    if a[i,i] > maxVal then maxVal := a[i,i];
    if a[i, n+1-i] < minVal then minVal := a[i, n+1-i];
    if a[i, n+1-i] > maxVal then maxVal := a[i, n+1-i];
  end;

  { Суми над, під і на головній діагоналі }
  sumAbove := 0;
  sumBelow := 0;
  sumOnDiag := 0;
  for i := 1 to n do
    for j := 1 to n do
      if i < j then
        sumAbove := sumAbove + a[i,j]
      else if i > j then
        sumBelow := sumBelow + a[i,j]
      else
        sumOnDiag := sumOnDiag + a[i,j];

  { Вивід результатів }
  writeln('Середнє арифметичне головної діагоналі: ', sumMain / countMain:0:4);
  writeln('Середнє арифметичне побічної діагоналі: ', sumAnti / countAnti:0:4);
  writeln('Мінімальний елемент на діагоналях: ', minVal);
  writeln('Максимальний елемент на діагоналях: ', maxVal);
  writeln('Сума елементів над головною діагоналлю: ', sumAbove);
  writeln('Сума елементів під головною діагоналлю: ', sumBelow);
  writeln('Сума елементів на головній діагоналі: ', sumOnDiag);

  readln;
end.
