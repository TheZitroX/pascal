unit testUtils;

interface

    procedure testFunc();
    procedure calcFractionForNTimes(a:integer);
    function calcFractions(a:integer):integer;

implementation

    procedure testFunc();
    var test:integer;
    begin
        test := 1;
        writeln(test);
    end;

    procedure calcFractionForNTimes(a:integer);
    var i:integer;
    begin
        for i := 1 to a do
            writeln(i, ' - ', calcFractions(i));
    end;

    function calcFractions(a:integer):integer;
    var i, fraction:integer;
    begin
        fraction := 0;
        for i := 1 to a do
            if a mod i = 0 then
                fraction := fraction + 1;

        calcFractions := fraction;
    end;
end.