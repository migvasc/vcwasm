#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <emscripten.h>

int main()
{
    const char * file = "teste2.txt";
    emscripten_wget("teste.txt" , file);
    FILE * f = fopen(file, "r");
    int result = 0;
	if(f==NULL	) {
		return 0;
	}
	char c;    
    while((c=fgetc(f))!=EOF){
        printf("%c",c);
    }
	printf("LEU!!!!\n");
    fclose(f);
    
    return 0;
}