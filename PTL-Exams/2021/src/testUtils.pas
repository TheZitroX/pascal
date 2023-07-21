{
    A unit example with a hello world function
}
unit testUtils;

// ever function specified here is visible outside (public)
interface

    uses sysutils;

    // aufgabe 1
    function testCount(n:word):word;
    function testCountIterative(n:word):word;
    function testCountEndRecrusive(n:word):word;

    function openFile(var txtInFile:text; inFileName:string):boolean;
    procedure readFileToLines(var txtInFile:text; var inFileLines:TStringArray; var iInFileLineCount:integer);

    // augabe 3

implementation

    function testCount(n:word):word;
    begin
    // n == 10
        if (n <= 0) then
            testCount := 0
        else
            testCount := n + testCount(n-1);
    end;

    function testCountEndRecrusive(n:word):word;
        function testCountEndRecrusiveHelper(n:word; value:word):word;
        begin
            if (n <= 0) then
                testCountEndRecrusiveHelper := value
            else
                testCountEndRecrusiveHelper := testCountEndRecrusiveHelper(n-1, value+n);
        end;
    begin
        testCountEndRecrusive := testCountEndRecrusiveHelper(n, 0);
    end;

    function testCountIterative(n:word):word;
    var i:word;
    begin
        testCountIterative := 0;
        for i := 1 to n do
            testCountIterative := testCountIterative + i;
    end;

    function openFile(var txtInFile:text; inFileName:string):boolean;
    begin
        assign(txtInFile, 'input.txt');
        {$I-} // turn off the io error handling
        reset(txtInFile);
        {$I+} // turn on the io error handling
        openFile := (ioresult = 0);
    end;

    procedure readFileToLines(var txtInFile:text; var inFileLines:TStringArray; var iInFileLineCount:integer);
    var sLine:string;
    begin
        while not eof(txtInFile) do
        begin
            readln(txtInFile, sLine);
            inc(iInFileLineCount);
            setLength(inFileLines, iInFileLineCount);
            inFileLines[iInFileLineCount-1] := sLine;
        end;
    end;
end.