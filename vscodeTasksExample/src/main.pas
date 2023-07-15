program main;

uses testUtils;

var i:integer;
begin
    // calcFractionForNTimes(1000);

    // programmieren 2 sose2020
    // aufgabe 1
    // aufgabe1Rekru(10);
    for i := 0 to 10 do
    begin
        // writeln(aufgabe1Rekru(i));
        // writeln(aufgabe1EndRekru(i));
        writeln(aufgabe1Iteration(i));
    end;

    // aufgabe 2
    // 9 == 1001
    i := 9;
    writeln(i and 0);
    writeln(i and 2);
    writeln(i or 0);
    writeln(i or 2);
    writeln(i xor 0);
    writeln(i xor 2);
    writeln(not i);
    //
end.
