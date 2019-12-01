#include <iostream>
#include <stdlib.h>
#include <libgen.h>

using namespace std;

int main(int argc, char** argv) {
    if(argc != 2) {
        cout << "Invalid number of arguments!";
        return 1;
    }

    string init_script_path = "/usr/local/Cellar/grit/*/src/scripts/initialise.sh";
    string remove_script_path = "/usr/local/Cellar/grit/*/src/scripts/remove.sh";

    if(strcmp(argv[1], "init") == 0) {
        system(init_script_path.c_str());
    } else if(strcmp(argv[1], "remove") == 0) {
        system(remove_script_path.c_str());
    } else {
        cout<< "invalid argument!";
        return 1;
    }
    return 0; 
}

