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
    } else if(strcmp(argv[1], "help") || strcmp(argv[1], "-h")) {
        cout<< "Usage:\n"<<"\t'grit init' - to initialise the grit in you current repo\n"<<"\t'grit remove' - to remove grit from the current repo\n"<<"\t'grit help' or 'grit -h' - to get help\n";
    } else {
        cout<< "invalid argument!";
        return 1;
    }
    return 0; 
}

