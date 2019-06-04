#include <unistd.h>

int main(void) {
    // Le descripteur de fichier 0 indique la stdout
    const char my_greetings[] = "Hello World";
    write(1, my_greetings, sizeof(my_greetings));
    return 0;
}