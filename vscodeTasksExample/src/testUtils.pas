{
    A unit example with a hello world function
}
unit testUtils;

// ever function specified here is visible outside (public)
interface

    // just the head of the function is needed
    // (in and out parameters need to be specified here too)
    // place the function documentation here
    {
        A Simple functions with void return to print out a Hello world!.

        @details the stream goes to stdout with the writeln function.

        @uses helperFunction()
    }
    procedure helloWorld();

implementation

    // a private function should have docs when its getting complicated
    // since it isnt specified in the interface, you habe to place the doc here
    {
        A basic helper function to writeln
    }
    procedure helperFunction();
    begin
        writeln(' world!');
    end;

    // dont duplicate the documentation, just leave it blank here
    procedure helloWorld();
    begin
        writeln('Hello');
        helperFunction();
    end;
end.