unit testUtils;

interface

    procedure testFunc();
    procedure calcFractionForNTimes(a:integer);
    function calcFractions(a:integer):integer;

    // programmieren 2 sose 2020
    function aufgabe1Rekru(n:integer):integer;
    function aufgabe1EndRekru(n:integer):integer;
    function aufgabe1Iteration(n:integer):integer;

implementation
    type TPerson = record
        name:string;
        age:byte;
    end;

    type TP_PersonNode = ^TList;
    type TPersonNode = record
        person:TPerson;
        next:TP_PersonNode;
    end;

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

    function aufgabe1Rekru(n:integer):integer;
    begin
        if n <= 0 then
            aufgabe1Rekru := 1
        else
            aufgabe1Rekru := aufgabe1Rekru(n - 1) * n;
    end;

    function aufgabe1EndRekru(n:integer):integer;
    begin
    end;

    function aufgabe1Iteration(n:integer):integer;
    begin
        aufgabe1Iteration := 1;
        while (n > 0) do
        begin
            aufgabe1Iteration := aufgabe1Iteration * n;
            dec(n);
        end;
    end;

    // todo test
    procedure SwitchElements(p_personNode:TP_PersonNode);
    var p_prevPersonNode:TP_PersonNode;
    var tempPerson:TPerson;
    begin
        if (p_personNode.next = not nil) then
        begin
            p_personNode := p_personNode.next;
            p_prevPersonNode := p_personnode;
            p_personNode := p_personNode.next;
            if (p_personNode = not nil) then
            begin
                tempPerson := p_prevPersonNode.person;
                p_prevPersonNode.person := p_personNode.person;
                p_personNode.person := tempPerson;
            end;
        end;
    end;
end.