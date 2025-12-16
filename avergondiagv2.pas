program DiagonalAverageAuto;
const
  MaxN = 100;  { максимальний розмір масиву }
type
  TArray = array[1..MaxN, 1..MaxN] of integer;  { змінили тип на integer, бо random повертає цілі числа }
var
  a: TArray;
  n, i, j: integer;
  sum: real;
begin
  randomize;  { ініціалізація генератора випадкових чисел поточним часом }

  writeln('Введіть розмір квадратного масиву n:');
  readln(n);
  
  if (n < 1) or (n > MaxN) then
  begin
    writeln('Неправильний розмір масиву!');
    halt;
  end;
  
  { Автоматичне заповнення масиву випадковими числами від -100 до 100 }
  for i := 1 to n do
    for j := 1 to n do
      a[i, j] := random(201) - 100;  { random(201) дає 0..200, віднімання 100 дає -100..100 }
  
  { Вивід згенерованого масиву для перевірки (опціонально) }
  writeln('Згенерований масив:');
  for i := 1 to n do
  begin
    for j := 1 to n do
      write(a[i, j]:6);
    writeln;
  end;
  writeln;
  
  sum := 0;
  for i := 1 to n do
    sum := sum + a[i, i];
  
  writeln('Середнє арифметичне елементів головної діагоналі: ', sum / n:0:6);
  
  readln;  { пауза перед закриттям }
end.
