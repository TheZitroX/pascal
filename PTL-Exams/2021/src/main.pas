{
    Basic main program for the example
}
program main;

// dephi mode for exception handling
{$mode delphi}

// implementing the testUtils unit
uses testUtils, sysutils;

const IN_FILE_NAME = 'input.txt';
const OUT_FILE_NAME = 'output.txt';

var txtInFile, txtOutFile:text;
    iInFileLineCount:smallint;
    inFileLines:TStringArray;
    i:integer;
begin
    if (openFile(txtInFile, IN_FILE_NAME)) then
    begin
        // clear the inFileLines array and set the line count to 0
        setLength(inFileLines, 0);
        iInFileLineCount := 0;
        readFileToLines(txtInFile, inFileLines, iInFileLineCount);
        for i := 0 to iInFileLineCount - 1 do
        begin
            writeln(inFileLines[i]);
        end;

        // close the input file
        closeFile(txtInFile);
        // todo
    end
    else // when file cannot be opened
    begin
        writeln('Error opening file: ', IN_FILE_NAME);
    end;
end.
