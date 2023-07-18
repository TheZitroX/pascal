{
    Basic main program for the example
}
program main;

// implementing the testUtils unit
uses testUtils, sysutils;

const IN_FILE_NAME = 'input.txt';
const OUT_FILE_NAME = 'output.txt';

var txtInFile, txtOutFile:text;
    iInFileLineCount:integer;
    inFileLines:TStringArray;
    i:integer;
begin
    // try
        if (openFile(txtInFile, IN_FILE_NAME)) then
        begin
            readFileToLines(txtInFile, inFileLines, iInFileLineCount);
            for i := 0 to iInFileLineCount - 1 do
            begin
                writeln(inFileLines[i]);
            end;
        end
        else // when file cannot be opened
        begin
            writeln('Error opening file: ', IN_FILE_NAME);
        end;
    // except
    //   on E: Exception do
    //   begin
    //   end;
    // end;
end.
