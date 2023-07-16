unit testUtils;

interface

    uses TypeDefine;

    procedure testFunc();
    procedure calcFractionForNTimes(a:integer);
    function calcFractions(a:integer):integer;

    // programmieren 2 sose 2020
    {
        "Was wird hierberechnet?"
    }
    function aufgabe1Rekru(n:integer):integer;
    function aufgabe1EndRekru(n:integer):integer;
    function aufgabe1Iteration(n:integer):integer;
    // sose 2021
    // aufgabe 4
    function SwitchElements(p_personNode:tp_personNode):boolean;

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

    function aufgabe1Rekru(n:integer):integer;
    begin
        if n <= 0 then
            aufgabe1Rekru := 1
        else
            aufgabe1Rekru := aufgabe1Rekru(n - 1) * n;
    end;

    // todo implement
    function aufgabe1EndRekru(n:integer):integer;
    begin
        aufgabe1EndRekru := 0;
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
    // fix move to sose 2021 folder
    // sose 2021 aufgabe 4
    function SwitchElements(p_personNode:tp_personNode):boolean;
    var p_prevPersonNode:tp_personNode;
    var tempPerson:t_person;
    var bSwitched:boolean = false;
    begin
        if (p_personNode^.next <> nil) then
        begin
            p_personNode := p_personNode^.next;
            p_prevPersonNode := p_personnode;
            p_personNode := p_personNode^.next;
            if (p_personNode <> nil) then
            begin
                tempPerson := p_prevPersonNode^.person;
                p_prevPersonNode^.person := p_personNode^.person;
                p_personNode^.person := tempPerson;

                bSwitched := true;
            end;
        end;

        SwitchElements := bSwitched;
    end;
end.