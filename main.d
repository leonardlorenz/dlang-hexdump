import std.stdio;
import std.file;
import std.string;

char* INPUT_PATH;
string OUTPUT_PATH = "";

void main(string[] args){
    if (args.length == 3) {
        INPUT_PATH = cast(char*) args[1].dup;
        OUTPUT_PATH = args[2];
    }

    // open input file
    FILE* INPUT_FILE;
    try{
        INPUT_FILE = fopen(INPUT_PATH, "r");
    } catch (FileException){
        writeln("Couldn't read this file. Are you sure the path\n" + INPUT_PATH + "\nis valid?");
    }
    // close input file again
    fclose(INPUT_FILE);
}
