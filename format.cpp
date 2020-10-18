#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define MAX_LINE 1024
FILE *input,*output; 

int main(int argc, char *argv[]) {
    
    if(argc<3){
        printf("please input two args!");
        return 0;
    }
    printf("%s\n",argv[0]);
	char filename[64];
	char outfile[64];
    strcpy(filename,argv[1]);
    strcpy(outfile,argv[2]);
    printf("%s-->%s\n",filename,outfile);
    
	input=fopen(filename,"r");
	output=fopen(outfile,"w");
	if(!input || !output){
		printf("open file failed.");
		exit(1);
	}
	char buf[MAX_LINE];
	while(fgets(buf,MAX_LINE,input)!=NULL){
		if(buf[0]=='\t'){
			fprintf(output,"%s",buf);
		}
	}
	return 0;
}
