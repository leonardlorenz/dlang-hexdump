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
        bool is_eof = false;
        // while EOF not found
        while(!is_eof){

            // read into buffer
            char[] buffer = INPUT_FILE.rawRead(new char[1024]);

            // loop through buffer to find EOF
            int x;
            for(; x < buffer.length; x++){
                // EOF == 0xA == 10 for some reason
                if (buffer[x] == 0xA){
                    is_eof = true;
                    break;
                }
            }

            // write buffer as ascii
            writeArrAscii(buffer);

            // write buffer as hex
            writeArrHex(buffer);
        }
    } catch (FileException) {
        writeln("Something went wrong reading the file. Are you sure you have permissions?");
    }
}

void writeArrAscii(char[] arr){
    for (int y; y < arr.length - 1; y++) {
        writef("%c", arr[y]);
    }
    writef("\n");
}

void writeArrHex(char[] arr){
    for (int y; y < arr.length - 1; y++) {
        writef("%X ", arr[y]);
    }
    writef("\n");
}
