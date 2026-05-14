#include <stdio.h>

char getAscii(int asciiNum){
    if (asciiNum >= 32 && asciiNum < 127){
        return asciiNum;
    }
    return 46;
}

void hexdump(const char *filename) {
    FILE *fp = fopen(filename, "rb");

    unsigned char currentCharacters[16];
    int bytesRead = 1;
    int inFileOffset = 0;

    while(bytesRead != 0){
        bytesRead = fread(currentCharacters,1,16,fp);
        if (bytesRead == 0) return;
        
       printf("%08X ",inFileOffset);

        for (int i = 0; i < 16; i++) {

            if (i < bytesRead) {
                printf("%02X ",currentCharacters[i]);
            }else{
                printf("   ");
            }
        }

        printf("%c",'|');

        for (int i = 0; i < 16; i++) {

            if (i < bytesRead) {
                printf("%c",getAscii(currentCharacters[i]));
            }
        }

        printf("%c",'|');

        //printf("%d",bytesRead);

        printf("\n");

        inFileOffset += bytesRead;
    }

    fclose(fp);
}

// argc is the number of arguments
// argv is the arguments
int main(int argc, char *argv[]){
    hexdump(argv[1]);
    return 0;
}