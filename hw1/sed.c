// Jason Lu
// jjl656

#include "types.h"
#include "stat.h"
#include "user.h"

char buf[4096];

void sed(int fd, char ToBeReplaced[128], char ReplacedWith[128]){
  int count = 0;
  int n;
  int i = 0;
  int linestart = 0;
  int found = 0;
  while((n=read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < n; i++){

      int j = 0;
      //Check if ToBeReplaced is found
      while(j < strlen(ToBeReplaced) && buf[i+j] == ToBeReplaced[j]){
        j++;
      }
      if(j == strlen(ToBeReplaced)){
        j = 0;
        found = 1;
        //Replace with new string
        while(j < strlen(ToBeReplaced) && buf[i+j] == ToBeReplaced[j]){
          buf[i+j] = ReplacedWith[j];
          j++;
        }
        count ++;
      }
      // Only prints lines with replacement instead of entire buffer.
      if(buf[i] == '\n' && found){
        while(linestart < i){
          //printf(1,"%c", buf[linestart]);
          linestart++;
        }
        found = 0;
        linestart++;
      }
    }
  }

  if(n < 0){
    printf(1, "sed: read error\n");
    exit();
  }

  printf(1,"%s", buf);
  printf(1,"\nFound and Replaced %d occurrences\n", count);
}
int main(int argc, char *argv[]) {
  int fd;
  if(argc <= 1){
    sed(0, "the", "xyz"); //read from std input
    exit();
  }
  if(argc == 2){
    if((fd = open(argv[1], 0)) < 0){
      printf(1, "sed: cannot open %s\n", argv[1]);
      exit();
    }
    sed(fd, "the", "xyz");
    close(fd);
  }
  if(argc == 4){
    if(strlen(argv[1]) != strlen(argv[2])){
      printf(2,"Error, replacement string must be same length.\n");
      exit();
    }
    if((fd = open(argv[3], 0)) < 0){
      printf(1, "sed: cannot open %s\n", argv[1]);
      exit();
    }
    sed(fd, argv[1]+1, argv[2]+1);
    close(fd);
  }
  exit();
}
