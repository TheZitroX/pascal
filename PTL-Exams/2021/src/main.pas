{
    Basic main program for the example
}
program main;

// implementing the testUtils unit
uses
    testUtils,
    sysutils;

const IN_FILE_NAME = 'input.txt';
const OUT_FILE_NAME = 'output.txt';

var txtInFile, txtOutFile:text;
    sFileDirectory, sSearchString, sReplaceString:string;
    iInFileLineCount, iOutFileLineCount:smallint;
    inFileLines, outFileLines:TStringArray;
begin
    sFileDirectory := extractFilePath(paramStr(0));
    if (openFile(txtInFile, sFileDirectory + IN_FILE_NAME)) then
    begin
        // clear the inFileLines array and set the line count to 0
        setLength(inFileLines, 0);
        iInFileLineCount := 0;
        readFileToLines(txtInFile, inFileLines, iInFileLineCount);
        // close the input file
        close(txtInFile);
        writeln('File \"', sFileDirectory + IN_FILE_NAME, '\" read successfully');
        writeln('File line count: ', iInFileLineCount);
        
        sSearchString := getSearchStringFromUser();
        sReplaceString := getReplaceStringFromUser();
        replaceAllOccurences(
            inFileLines,
            iInFileLineCount,
            outFileLines,
            iOutFileLineCount,
            sSearchString,
            sReplaceString
        );

        // save the output to the output file
        saveStringToFile(
            txtOutFile,
            sFileDirectory + OUT_FILE_NAME,
            outFileLines,
            iOutFileLineCount
        );
    end
    else // when file cannot be opened
    begin
        writeln('Error opening file: \"', sFileDirectory + IN_FILE_NAME, '\"');
    end;
end.
