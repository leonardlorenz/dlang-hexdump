import std.stdio;
import std.file;
import std.string;

string INPUT_PATH;
string OUTPUT_PATH;

void main(string[] args){
    if (args.length == 3) {
        string cwd = getcwd();
        INPUT_PATH = cwd ~ "/" ~ args[1];
        OUTPUT_PATH = cwd ~ "/" ~ args[2];
        /*
        writeln(INPUT_PATH);
        writeln(OUTPUT_PATH);
        */
    }

    // open input file
    File INPUT_FILE = File(INPUT_PATH, "r");
    File OUTPUT_FILE = File(OUTPUT_PATH, "w");

    try{
        // read into buffer
        byte[] buffer = rawReadUntilEOF(INPUT_PATH);

        writeBufferFancy(buffer);

        // write buffer as ascii
        //writeArrAscii(buffer);

        // write buffer as hex
        //writeArrHex(buffer);
    } catch (FileException) {
        writeln("Something went wrong reading the file. Are you sure you have permissions?");
    }
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
    // loop through buffer
    for (int y; y < arr.length - 1; y++) {
        writef("%2X ", cast(char)arr[y]);
        // if byte chunk of 8 bytes is reached, print ascii for those 8 bytes and print a newline
        if (y % 8 == 0 && y != 0) {
            writef("      ");
            for (int z; z < 8; z++) {
                writef("%c", cast(char)arr[y - 8 + z]);
            }
            writef("\n");
        }
    }
    writef("\n");
}

/*

void writeArrAscii(byte[] arr){
    for (int y; y < arr.length - 1; y++) {
        writef("%c", arr[y]);
    }
    writef("\n");
}

void writeArrHex(byte[] arr){
    for (int y; y < arr.length - 1; y++) {
        writef("%X ", arr[y]);
        if (y % 8 == 0) {
            writef("\n");
        }
    }
    writef("\n");
}
*/
