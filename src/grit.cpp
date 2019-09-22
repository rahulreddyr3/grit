#include<iostream>
#include <stdlib.h>

using namespace std;

int main(int argc, char** argv) {
    if(argc != 2) {
        cout << "Invalid number of arguments!";
        return 1;
    }

    if(strcmp(argv[1], "init") == 0) {
        system("./src/scripts/initialise.sh");
    } else if(strcmp(argv[1], "remove") == 0) {
        system("./src/scripts/remove.sh");
    } else {
        cout<< "invalid argument!";
        return 1;
    }
    return 0; 
}

