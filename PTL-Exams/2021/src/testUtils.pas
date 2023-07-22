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

    // augabe 3
    function openFile(var txtInFile:text; inFileName:string):boolean;
    function openWriteFile(var txtOutFile:text; outFileName:string):boolean;

    procedure readFileToLines(
        var txtInFile:text;
        var inFileLines:TStringArray;
        var iInFileLineCount:integer
    );

    function replaceAllOccurences(
        var inFileLines:TStringArray;
        var iInFileLineCount:integer;
        var outFileLines:TStringArray;
        var iOutFileLineCount:integer;
        sSearchString:string;
        sReplaceString:string
    ):integer;

    function getSearchStringFromUser():string;
    function getReplaceStringFromUser():string;

    function saveStringToFile(
        var txtOutFile:text;
        sFilePath:string;
        outFileLines:TStringArray;
        iOutFileLineCount:integer
    ):boolean;

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
        assign(txtInFile, inFileName);
        {$I-} // turn off the io error handling
        reset(txtInFile);
        {$I+} // turn on the io error handling
        openFile := (ioresult = 0);
    end;

    procedure readFileToLines(
        var txtInFile:text;
        var inFileLines:TStringArray;
        var iInFileLineCount:integer
    );
    var sLine:string;
    begin
        while not eof(txtInFile) do
        begin
            readln(txtInFile, sLine);
            inc(iInFileLineCount);
            // fixme - this is not efficient. increase the size by a factor of 0.5 instead of small steps
            setLength(inFileLines, iInFileLineCount);
            inFileLines[iInFileLineCount-1] := sLine;
        end;
    end;

    function replaceAllOccurences(
        var inFileLines:TStringArray;
        var iInFileLineCount:integer;
        var outFileLines:TStringArray;
        var iOutFileLineCount:integer;
        sSearchString:string;
        sReplaceString:string
    ):integer;
    var i:integer;
    begin
        // set length of outFileLines to the same length as inFileLines
        setLength(outFileLines, iInFileLineCount);
        iOutFileLineCount := iInFileLineCount;

        // replace all occurences of sSearchString with sReplaceString
        // and write the result to outFileLines
        for i := 0 to iInFileLineCount-1 do
            outFileLines[i] := StringReplace(inFileLines[i], sSearchString, sReplaceString, [rfReplaceAll, rfIgnoreCase]);

        // return the number of lines
        // todo - this is not correct. it should return the number of replacements
        replaceAllOccurences := iInFileLineCount;
    end;
    
    function getSearchStringFromUser():string;
    begin
        write('Enter the string to search for: ');
        readln(getSearchStringFromUser);
    end;

    function getReplaceStringFromUser():string;
    begin
        write('Enter the string to replace with: ');
        readln(getReplaceStringFromUser);
    end;

    function openWriteFile(var txtOutFile:text; outFileName:string):boolean;
    begin
        assign(txtOutFile, outFileName);
        {$I-} // turn off the io error handling
        rewrite(txtOutFile);
        {$I+} // turn on the io error handling
        openWriteFile := (ioresult = 0);
    end;

    function saveStringToFile(
        var txtOutFile:text;
        sFilePath:string;
        outFileLines:TStringArray;
        iOutFileLineCount:integer
    ):boolean;
    var i:integer;
    begin
        if (openWriteFile(txtOutFile, sFilePath)) then
        begin
            for i := 0 to iOutFileLineCount-1 do
                writeln(txtOutFile, outFileLines[i]);
            close(txtOutFile);
            saveStringToFile := true;
        end
        else
        begin
            writeln('Error: Could not open file ', sFilePath);
            saveStringToFile := false;
        end;
    end;
end.