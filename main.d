import std.stdio;
import std.file;
import std.string;

void main(string[] args){
    if (args.length == 2) {
        string cwd = getcwd();
        string argument = args[1];
        if (argument == "-h") {
            printHelp();
            exitProgram(0);
        } else {
            hexdump(argument);
        }
    } else if (args.length < 2) {
            printHelp();
            exitProgram(0);
    } }

void hexdump(string inputPath) {
    // open input file
    File INPUT_FILE = File(inputPath, "r");

    try{
        // read into buffer
        byte[] buffer = rawReadUntilEOF(inputPath);

        // write buffer as hex and ascii next to each other
        writeBufferFancy(buffer);

    } catch (FileException) {
        writeln("Something went wrong reading the file. Are you sure you have permissions?");
    }
}

void printHelp() {
    writeln("SYNOPSIS");
    writeln("\tdhex [OPTIONS] /path/to/file");
    writeln("");
    writeln("OPTIONS");
    writeln("\t-h\tPrint help (this text).");
}

byte[] rawReadUntilEOF(string path){
    import std.array: appender;

    auto output = appender!(byte[]);

    // try catch later
    auto file = File(path, "r");

    while(!file.eof){
        output.put(file.rawRead(new byte[1]));
    }

    return output.data;
}

void writeBufferFancy(byte[] arr){
    auto chunkWidth = 24;
    int lineWidth = chunkWidth / 2 + 4;

    // loop through buffer
    for (auto x = 0; x < arr.length; x += chunkWidth) {
        // print hex
        for (auto y = x; y < chunkWidth + x; y++){
            if (y < arr.length) {
                writef("%2X ", cast(char)arr[y]);
            }
        }
        write("      ");
        // print ascii
        for (auto y = x; y < chunkWidth + x; y++) {
            if (y < arr.length) {
                char current = cast(char) arr[y];
                /** if it's not space and bigger than 0x1f
                  (meaning it's not a control operator) */
                if (current != cast(char) " "
                 && current != cast(char) ""
                 && current > cast(char) 0x20
                 && current < cast(char) 0x7E
                ){
                    writef("%c", cast(char)arr[y]);
                } else {
                    write(".");
                }
            }
        }
        write("\n");
    }
}

void exitProgram(int statusCode) {
    import core.stdc.stdlib : exit;
    exit(statusCode);
}
