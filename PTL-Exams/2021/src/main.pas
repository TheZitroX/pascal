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

    // aufgabe 4
    personListBeginning, elem, nodeRunner:p_listnode;
    i:integer;
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


    // test the aufgabe 4 function
    // create a small list of 5 elements
    personListBeginning := nil;
    new(personListBeginning);
    personListBeginning^.next := nil;
    personListBeginning^.person.name := 'John';
    personListBeginning^.person.age := 20;

    for i := 1 to 4 do
    begin
        nodeRunner := personListBeginning;
        while (nodeRunner <> nil) and (nodeRunner^.next <> nil) do
            nodeRunner := nodeRunner^.next;

        if (nodeRunner <> nil) then
        begin
            new(elem);
            elem^.next := nil;
            elem^.person.name := 'John';
            elem^.person.age := 20 + i;
            nodeRunner^.next := elem;
        end;
    end;
    // print the list
    writeln('List before switching elements:');
    nodeRunner := personListBeginning;
    while (noderunner <> nil) do
    begin
        writeln('Name: ', nodeRunner^.person.name, ', Age: ', nodeRunner^.person.age);
        nodeRunner := nodeRunner^.next;
    end;

    // point to the third element
    nodeRunner := personListBeginning^.next;

    SwitchElements(nodeRunner);

    // print the list
    writeln('List after switching elements:');
    nodeRunner := personListBeginning;
    while (noderunner <> nil) do
    begin
        writeln('Name: ', nodeRunner^.person.name, ', Age: ', nodeRunner^.person.age);
        nodeRunner := nodeRunner^.next;
    end;

    // free the memory
    nodeRunner := personListBeginning;
    while (nodeRunner <> nil) do
    begin
        elem := nodeRunner;
        nodeRunner := nodeRunner^.next;
        dispose(elem);
    end;
end.
