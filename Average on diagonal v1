program DiagonalAverage;
const
  MaxN = 100;  { максимальний розмір масиву }
type
  TArray = array[1..MaxN, 1..MaxN] of real;
var
  a: TArray;
  n, i, j: integer;
  sum: real;
begin
  writeln('Введіть розмір квадратного масиву n:');
  readln(n);
  
  if (n < 1) or (n > MaxN) then
  begin
    writeln('Неправильний розмір масиву!');
    halt;
  end;
  
  writeln('Введіть елементи масиву ', n, 'x', n, ':');
  for i := 1 to n do
    for j := 1 to n do
    begin
      write('a[', i, ',', j, '] = ');
      readln(a[i, j]);
    end;
  
  sum := 0;
  for i := 1 to n do
    sum := sum + a[i, i];
  
  writeln('Середнє арифметичне елементів головної діагоналі: ', sum / n:0:6);
  
  readln;  { пауза перед закриттям }
end.
