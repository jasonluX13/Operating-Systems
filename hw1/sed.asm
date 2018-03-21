
_sed:     file format elf32-i386


Disassembly of section .text:

00000000 <sed>:
#include "stat.h"
#include "user.h"

char buf[4096];

void sed(int fd, char ToBeReplaced[128], char ReplacedWith[128]){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int count = 0;
   6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  int n;
  int i = 0;
   d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int linestart = 0;
  14:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int found = 0;
  1b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  while((n=read(fd, buf, sizeof(buf))) > 0){
  22:	e9 09 01 00 00       	jmp    130 <sed+0x130>
    for(i = 0; i < n; i++){
  27:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  2e:	e9 f1 00 00 00       	jmp    124 <sed+0x124>

      int j = 0;
  33:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      //Check if ToBeReplaced is found
      while(j < strlen(ToBeReplaced) && buf[i+j] == ToBeReplaced[j]){
  3a:	eb 04                	jmp    40 <sed+0x40>
        j++;
  3c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while((n=read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < n; i++){

      int j = 0;
      //Check if ToBeReplaced is found
      while(j < strlen(ToBeReplaced) && buf[i+j] == ToBeReplaced[j]){
  40:	83 ec 0c             	sub    $0xc,%esp
  43:	ff 75 0c             	pushl  0xc(%ebp)
  46:	e8 51 03 00 00       	call   39c <strlen>
  4b:	83 c4 10             	add    $0x10,%esp
  4e:	89 c2                	mov    %eax,%edx
  50:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  53:	39 c2                	cmp    %eax,%edx
  55:	76 1e                	jbe    75 <sed+0x75>
  57:	8b 55 f0             	mov    -0x10(%ebp),%edx
  5a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  5d:	01 d0                	add    %edx,%eax
  5f:	0f b6 90 c0 0d 00 00 	movzbl 0xdc0(%eax),%edx
  66:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  69:	8b 45 0c             	mov    0xc(%ebp),%eax
  6c:	01 c8                	add    %ecx,%eax
  6e:	0f b6 00             	movzbl (%eax),%eax
  71:	38 c2                	cmp    %al,%dl
  73:	74 c7                	je     3c <sed+0x3c>
        j++;
      }
      if(j == strlen(ToBeReplaced)){
  75:	83 ec 0c             	sub    $0xc,%esp
  78:	ff 75 0c             	pushl  0xc(%ebp)
  7b:	e8 1c 03 00 00       	call   39c <strlen>
  80:	83 c4 10             	add    $0x10,%esp
  83:	89 c2                	mov    %eax,%edx
  85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  88:	39 c2                	cmp    %eax,%edx
  8a:	75 66                	jne    f2 <sed+0xf2>
        j = 0;
  8c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
        found = 1;
  93:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
        //Replace with new string
        while(j < strlen(ToBeReplaced) && buf[i+j] == ToBeReplaced[j]){
  9a:	eb 1d                	jmp    b9 <sed+0xb9>
          buf[i+j] = ReplacedWith[j];
  9c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  a2:	01 c2                	add    %eax,%edx
  a4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  a7:	8b 45 10             	mov    0x10(%ebp),%eax
  aa:	01 c8                	add    %ecx,%eax
  ac:	0f b6 00             	movzbl (%eax),%eax
  af:	88 82 c0 0d 00 00    	mov    %al,0xdc0(%edx)
          j++;
  b5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
      }
      if(j == strlen(ToBeReplaced)){
        j = 0;
        found = 1;
        //Replace with new string
        while(j < strlen(ToBeReplaced) && buf[i+j] == ToBeReplaced[j]){
  b9:	83 ec 0c             	sub    $0xc,%esp
  bc:	ff 75 0c             	pushl  0xc(%ebp)
  bf:	e8 d8 02 00 00       	call   39c <strlen>
  c4:	83 c4 10             	add    $0x10,%esp
  c7:	89 c2                	mov    %eax,%edx
  c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  cc:	39 c2                	cmp    %eax,%edx
  ce:	76 1e                	jbe    ee <sed+0xee>
  d0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  d6:	01 d0                	add    %edx,%eax
  d8:	0f b6 90 c0 0d 00 00 	movzbl 0xdc0(%eax),%edx
  df:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  e5:	01 c8                	add    %ecx,%eax
  e7:	0f b6 00             	movzbl (%eax),%eax
  ea:	38 c2                	cmp    %al,%dl
  ec:	74 ae                	je     9c <sed+0x9c>
          buf[i+j] = ReplacedWith[j];
          j++;
        }
        count ++;
  ee:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      }
      // Only prints lines with replacement instead of entire buffer.
      if(buf[i] == '\n' && found){
  f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  f5:	05 c0 0d 00 00       	add    $0xdc0,%eax
  fa:	0f b6 00             	movzbl (%eax),%eax
  fd:	3c 0a                	cmp    $0xa,%al
  ff:	75 1f                	jne    120 <sed+0x120>
 101:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 105:	74 19                	je     120 <sed+0x120>
        while(linestart < i){
 107:	eb 04                	jmp    10d <sed+0x10d>
          //printf(1,"%c", buf[linestart]);
          linestart++;
 109:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        }
        count ++;
      }
      // Only prints lines with replacement instead of entire buffer.
      if(buf[i] == '\n' && found){
        while(linestart < i){
 10d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 110:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 113:	7c f4                	jl     109 <sed+0x109>
          //printf(1,"%c", buf[linestart]);
          linestart++;
        }
        found = 0;
 115:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
        linestart++;
 11c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  int n;
  int i = 0;
  int linestart = 0;
  int found = 0;
  while((n=read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < n; i++){
 120:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 124:	8b 45 f0             	mov    -0x10(%ebp),%eax
 127:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 12a:	0f 8c 03 ff ff ff    	jl     33 <sed+0x33>
  int count = 0;
  int n;
  int i = 0;
  int linestart = 0;
  int found = 0;
  while((n=read(fd, buf, sizeof(buf))) > 0){
 130:	83 ec 04             	sub    $0x4,%esp
 133:	68 00 10 00 00       	push   $0x1000
 138:	68 c0 0d 00 00       	push   $0xdc0
 13d:	ff 75 08             	pushl  0x8(%ebp)
 140:	e8 31 04 00 00       	call   576 <read>
 145:	83 c4 10             	add    $0x10,%esp
 148:	89 45 e0             	mov    %eax,-0x20(%ebp)
 14b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 14f:	0f 8f d2 fe ff ff    	jg     27 <sed+0x27>
        linestart++;
      }
    }
  }

  if(n < 0){
 155:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 159:	79 17                	jns    172 <sed+0x172>
    printf(1, "sed: read error\n");
 15b:	83 ec 08             	sub    $0x8,%esp
 15e:	68 8c 0a 00 00       	push   $0xa8c
 163:	6a 01                	push   $0x1
 165:	e8 6b 05 00 00       	call   6d5 <printf>
 16a:	83 c4 10             	add    $0x10,%esp
    exit();
 16d:	e8 ec 03 00 00       	call   55e <exit>
  }

  printf(1,"%s", buf);
 172:	83 ec 04             	sub    $0x4,%esp
 175:	68 c0 0d 00 00       	push   $0xdc0
 17a:	68 9d 0a 00 00       	push   $0xa9d
 17f:	6a 01                	push   $0x1
 181:	e8 4f 05 00 00       	call   6d5 <printf>
 186:	83 c4 10             	add    $0x10,%esp
  printf(1,"\nFound and Replaced %d occurrences\n", count);
 189:	83 ec 04             	sub    $0x4,%esp
 18c:	ff 75 f4             	pushl  -0xc(%ebp)
 18f:	68 a0 0a 00 00       	push   $0xaa0
 194:	6a 01                	push   $0x1
 196:	e8 3a 05 00 00       	call   6d5 <printf>
 19b:	83 c4 10             	add    $0x10,%esp
}
 19e:	90                   	nop
 19f:	c9                   	leave  
 1a0:	c3                   	ret    

000001a1 <main>:
int main(int argc, char *argv[]) {
 1a1:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 1a5:	83 e4 f0             	and    $0xfffffff0,%esp
 1a8:	ff 71 fc             	pushl  -0x4(%ecx)
 1ab:	55                   	push   %ebp
 1ac:	89 e5                	mov    %esp,%ebp
 1ae:	56                   	push   %esi
 1af:	53                   	push   %ebx
 1b0:	51                   	push   %ecx
 1b1:	83 ec 1c             	sub    $0x1c,%esp
 1b4:	89 cb                	mov    %ecx,%ebx
  int fd;
  if(argc <= 1){
 1b6:	83 3b 01             	cmpl   $0x1,(%ebx)
 1b9:	7f 1c                	jg     1d7 <main+0x36>
    sed(0, "the", "xyz"); //read from std input
 1bb:	83 ec 04             	sub    $0x4,%esp
 1be:	68 c4 0a 00 00       	push   $0xac4
 1c3:	68 c8 0a 00 00       	push   $0xac8
 1c8:	6a 00                	push   $0x0
 1ca:	e8 31 fe ff ff       	call   0 <sed>
 1cf:	83 c4 10             	add    $0x10,%esp
    exit();
 1d2:	e8 87 03 00 00       	call   55e <exit>
  }
  if(argc == 2){
 1d7:	83 3b 02             	cmpl   $0x2,(%ebx)
 1da:	75 65                	jne    241 <main+0xa0>
    if((fd = open(argv[1], 0)) < 0){
 1dc:	8b 43 04             	mov    0x4(%ebx),%eax
 1df:	83 c0 04             	add    $0x4,%eax
 1e2:	8b 00                	mov    (%eax),%eax
 1e4:	83 ec 08             	sub    $0x8,%esp
 1e7:	6a 00                	push   $0x0
 1e9:	50                   	push   %eax
 1ea:	e8 af 03 00 00       	call   59e <open>
 1ef:	83 c4 10             	add    $0x10,%esp
 1f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 1f5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 1f9:	79 20                	jns    21b <main+0x7a>
      printf(1, "sed: cannot open %s\n", argv[1]);
 1fb:	8b 43 04             	mov    0x4(%ebx),%eax
 1fe:	83 c0 04             	add    $0x4,%eax
 201:	8b 00                	mov    (%eax),%eax
 203:	83 ec 04             	sub    $0x4,%esp
 206:	50                   	push   %eax
 207:	68 cc 0a 00 00       	push   $0xacc
 20c:	6a 01                	push   $0x1
 20e:	e8 c2 04 00 00       	call   6d5 <printf>
 213:	83 c4 10             	add    $0x10,%esp
      exit();
 216:	e8 43 03 00 00       	call   55e <exit>
    }
    sed(fd, "the", "xyz");
 21b:	83 ec 04             	sub    $0x4,%esp
 21e:	68 c4 0a 00 00       	push   $0xac4
 223:	68 c8 0a 00 00       	push   $0xac8
 228:	ff 75 e4             	pushl  -0x1c(%ebp)
 22b:	e8 d0 fd ff ff       	call   0 <sed>
 230:	83 c4 10             	add    $0x10,%esp
    close(fd);
 233:	83 ec 0c             	sub    $0xc,%esp
 236:	ff 75 e4             	pushl  -0x1c(%ebp)
 239:	e8 48 03 00 00       	call   586 <close>
 23e:	83 c4 10             	add    $0x10,%esp
  }
  if(argc == 4){
 241:	83 3b 04             	cmpl   $0x4,(%ebx)
 244:	0f 85 b8 00 00 00    	jne    302 <main+0x161>
    if(strlen(argv[1]) != strlen(argv[2])){
 24a:	8b 43 04             	mov    0x4(%ebx),%eax
 24d:	83 c0 04             	add    $0x4,%eax
 250:	8b 00                	mov    (%eax),%eax
 252:	83 ec 0c             	sub    $0xc,%esp
 255:	50                   	push   %eax
 256:	e8 41 01 00 00       	call   39c <strlen>
 25b:	83 c4 10             	add    $0x10,%esp
 25e:	89 c6                	mov    %eax,%esi
 260:	8b 43 04             	mov    0x4(%ebx),%eax
 263:	83 c0 08             	add    $0x8,%eax
 266:	8b 00                	mov    (%eax),%eax
 268:	83 ec 0c             	sub    $0xc,%esp
 26b:	50                   	push   %eax
 26c:	e8 2b 01 00 00       	call   39c <strlen>
 271:	83 c4 10             	add    $0x10,%esp
 274:	39 c6                	cmp    %eax,%esi
 276:	74 17                	je     28f <main+0xee>
      printf(2,"Error, replacement string must be same length.\n");
 278:	83 ec 08             	sub    $0x8,%esp
 27b:	68 e4 0a 00 00       	push   $0xae4
 280:	6a 02                	push   $0x2
 282:	e8 4e 04 00 00       	call   6d5 <printf>
 287:	83 c4 10             	add    $0x10,%esp
      exit();
 28a:	e8 cf 02 00 00       	call   55e <exit>
    }
    if((fd = open(argv[3], 0)) < 0){
 28f:	8b 43 04             	mov    0x4(%ebx),%eax
 292:	83 c0 0c             	add    $0xc,%eax
 295:	8b 00                	mov    (%eax),%eax
 297:	83 ec 08             	sub    $0x8,%esp
 29a:	6a 00                	push   $0x0
 29c:	50                   	push   %eax
 29d:	e8 fc 02 00 00       	call   59e <open>
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 2a8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 2ac:	79 20                	jns    2ce <main+0x12d>
      printf(1, "sed: cannot open %s\n", argv[1]);
 2ae:	8b 43 04             	mov    0x4(%ebx),%eax
 2b1:	83 c0 04             	add    $0x4,%eax
 2b4:	8b 00                	mov    (%eax),%eax
 2b6:	83 ec 04             	sub    $0x4,%esp
 2b9:	50                   	push   %eax
 2ba:	68 cc 0a 00 00       	push   $0xacc
 2bf:	6a 01                	push   $0x1
 2c1:	e8 0f 04 00 00       	call   6d5 <printf>
 2c6:	83 c4 10             	add    $0x10,%esp
      exit();
 2c9:	e8 90 02 00 00       	call   55e <exit>
    }
    sed(fd, argv[1]+1, argv[2]+1);
 2ce:	8b 43 04             	mov    0x4(%ebx),%eax
 2d1:	83 c0 08             	add    $0x8,%eax
 2d4:	8b 00                	mov    (%eax),%eax
 2d6:	8d 50 01             	lea    0x1(%eax),%edx
 2d9:	8b 43 04             	mov    0x4(%ebx),%eax
 2dc:	83 c0 04             	add    $0x4,%eax
 2df:	8b 00                	mov    (%eax),%eax
 2e1:	83 c0 01             	add    $0x1,%eax
 2e4:	83 ec 04             	sub    $0x4,%esp
 2e7:	52                   	push   %edx
 2e8:	50                   	push   %eax
 2e9:	ff 75 e4             	pushl  -0x1c(%ebp)
 2ec:	e8 0f fd ff ff       	call   0 <sed>
 2f1:	83 c4 10             	add    $0x10,%esp
    close(fd);
 2f4:	83 ec 0c             	sub    $0xc,%esp
 2f7:	ff 75 e4             	pushl  -0x1c(%ebp)
 2fa:	e8 87 02 00 00       	call   586 <close>
 2ff:	83 c4 10             	add    $0x10,%esp
  }
  exit();
 302:	e8 57 02 00 00       	call   55e <exit>

00000307 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 307:	55                   	push   %ebp
 308:	89 e5                	mov    %esp,%ebp
 30a:	57                   	push   %edi
 30b:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 30c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 30f:	8b 55 10             	mov    0x10(%ebp),%edx
 312:	8b 45 0c             	mov    0xc(%ebp),%eax
 315:	89 cb                	mov    %ecx,%ebx
 317:	89 df                	mov    %ebx,%edi
 319:	89 d1                	mov    %edx,%ecx
 31b:	fc                   	cld    
 31c:	f3 aa                	rep stos %al,%es:(%edi)
 31e:	89 ca                	mov    %ecx,%edx
 320:	89 fb                	mov    %edi,%ebx
 322:	89 5d 08             	mov    %ebx,0x8(%ebp)
 325:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 328:	90                   	nop
 329:	5b                   	pop    %ebx
 32a:	5f                   	pop    %edi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    

0000032d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 32d:	55                   	push   %ebp
 32e:	89 e5                	mov    %esp,%ebp
 330:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 333:	8b 45 08             	mov    0x8(%ebp),%eax
 336:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 339:	90                   	nop
 33a:	8b 45 08             	mov    0x8(%ebp),%eax
 33d:	8d 50 01             	lea    0x1(%eax),%edx
 340:	89 55 08             	mov    %edx,0x8(%ebp)
 343:	8b 55 0c             	mov    0xc(%ebp),%edx
 346:	8d 4a 01             	lea    0x1(%edx),%ecx
 349:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 34c:	0f b6 12             	movzbl (%edx),%edx
 34f:	88 10                	mov    %dl,(%eax)
 351:	0f b6 00             	movzbl (%eax),%eax
 354:	84 c0                	test   %al,%al
 356:	75 e2                	jne    33a <strcpy+0xd>
    ;
  return os;
 358:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 35b:	c9                   	leave  
 35c:	c3                   	ret    

0000035d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 35d:	55                   	push   %ebp
 35e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 360:	eb 08                	jmp    36a <strcmp+0xd>
    p++, q++;
 362:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 366:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
 36d:	0f b6 00             	movzbl (%eax),%eax
 370:	84 c0                	test   %al,%al
 372:	74 10                	je     384 <strcmp+0x27>
 374:	8b 45 08             	mov    0x8(%ebp),%eax
 377:	0f b6 10             	movzbl (%eax),%edx
 37a:	8b 45 0c             	mov    0xc(%ebp),%eax
 37d:	0f b6 00             	movzbl (%eax),%eax
 380:	38 c2                	cmp    %al,%dl
 382:	74 de                	je     362 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 384:	8b 45 08             	mov    0x8(%ebp),%eax
 387:	0f b6 00             	movzbl (%eax),%eax
 38a:	0f b6 d0             	movzbl %al,%edx
 38d:	8b 45 0c             	mov    0xc(%ebp),%eax
 390:	0f b6 00             	movzbl (%eax),%eax
 393:	0f b6 c0             	movzbl %al,%eax
 396:	29 c2                	sub    %eax,%edx
 398:	89 d0                	mov    %edx,%eax
}
 39a:	5d                   	pop    %ebp
 39b:	c3                   	ret    

0000039c <strlen>:

uint
strlen(char *s)
{
 39c:	55                   	push   %ebp
 39d:	89 e5                	mov    %esp,%ebp
 39f:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3a2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3a9:	eb 04                	jmp    3af <strlen+0x13>
 3ab:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3af:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3b2:	8b 45 08             	mov    0x8(%ebp),%eax
 3b5:	01 d0                	add    %edx,%eax
 3b7:	0f b6 00             	movzbl (%eax),%eax
 3ba:	84 c0                	test   %al,%al
 3bc:	75 ed                	jne    3ab <strlen+0xf>
    ;
  return n;
 3be:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3c1:	c9                   	leave  
 3c2:	c3                   	ret    

000003c3 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3c3:	55                   	push   %ebp
 3c4:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 3c6:	8b 45 10             	mov    0x10(%ebp),%eax
 3c9:	50                   	push   %eax
 3ca:	ff 75 0c             	pushl  0xc(%ebp)
 3cd:	ff 75 08             	pushl  0x8(%ebp)
 3d0:	e8 32 ff ff ff       	call   307 <stosb>
 3d5:	83 c4 0c             	add    $0xc,%esp
  return dst;
 3d8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3db:	c9                   	leave  
 3dc:	c3                   	ret    

000003dd <strchr>:

char*
strchr(const char *s, char c)
{
 3dd:	55                   	push   %ebp
 3de:	89 e5                	mov    %esp,%ebp
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e6:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 3e9:	eb 14                	jmp    3ff <strchr+0x22>
    if(*s == c)
 3eb:	8b 45 08             	mov    0x8(%ebp),%eax
 3ee:	0f b6 00             	movzbl (%eax),%eax
 3f1:	3a 45 fc             	cmp    -0x4(%ebp),%al
 3f4:	75 05                	jne    3fb <strchr+0x1e>
      return (char*)s;
 3f6:	8b 45 08             	mov    0x8(%ebp),%eax
 3f9:	eb 13                	jmp    40e <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 3fb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3ff:	8b 45 08             	mov    0x8(%ebp),%eax
 402:	0f b6 00             	movzbl (%eax),%eax
 405:	84 c0                	test   %al,%al
 407:	75 e2                	jne    3eb <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 409:	b8 00 00 00 00       	mov    $0x0,%eax
}
 40e:	c9                   	leave  
 40f:	c3                   	ret    

00000410 <gets>:

char*
gets(char *buf, int max)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 416:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 41d:	eb 42                	jmp    461 <gets+0x51>
    cc = read(0, &c, 1);
 41f:	83 ec 04             	sub    $0x4,%esp
 422:	6a 01                	push   $0x1
 424:	8d 45 ef             	lea    -0x11(%ebp),%eax
 427:	50                   	push   %eax
 428:	6a 00                	push   $0x0
 42a:	e8 47 01 00 00       	call   576 <read>
 42f:	83 c4 10             	add    $0x10,%esp
 432:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 435:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 439:	7e 33                	jle    46e <gets+0x5e>
      break;
    buf[i++] = c;
 43b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 43e:	8d 50 01             	lea    0x1(%eax),%edx
 441:	89 55 f4             	mov    %edx,-0xc(%ebp)
 444:	89 c2                	mov    %eax,%edx
 446:	8b 45 08             	mov    0x8(%ebp),%eax
 449:	01 c2                	add    %eax,%edx
 44b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 44f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 451:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 455:	3c 0a                	cmp    $0xa,%al
 457:	74 16                	je     46f <gets+0x5f>
 459:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 45d:	3c 0d                	cmp    $0xd,%al
 45f:	74 0e                	je     46f <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 461:	8b 45 f4             	mov    -0xc(%ebp),%eax
 464:	83 c0 01             	add    $0x1,%eax
 467:	3b 45 0c             	cmp    0xc(%ebp),%eax
 46a:	7c b3                	jl     41f <gets+0xf>
 46c:	eb 01                	jmp    46f <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 46e:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 46f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 472:	8b 45 08             	mov    0x8(%ebp),%eax
 475:	01 d0                	add    %edx,%eax
 477:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 47a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 47d:	c9                   	leave  
 47e:	c3                   	ret    

0000047f <stat>:

int
stat(char *n, struct stat *st)
{
 47f:	55                   	push   %ebp
 480:	89 e5                	mov    %esp,%ebp
 482:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 485:	83 ec 08             	sub    $0x8,%esp
 488:	6a 00                	push   $0x0
 48a:	ff 75 08             	pushl  0x8(%ebp)
 48d:	e8 0c 01 00 00       	call   59e <open>
 492:	83 c4 10             	add    $0x10,%esp
 495:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 498:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 49c:	79 07                	jns    4a5 <stat+0x26>
    return -1;
 49e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4a3:	eb 25                	jmp    4ca <stat+0x4b>
  r = fstat(fd, st);
 4a5:	83 ec 08             	sub    $0x8,%esp
 4a8:	ff 75 0c             	pushl  0xc(%ebp)
 4ab:	ff 75 f4             	pushl  -0xc(%ebp)
 4ae:	e8 03 01 00 00       	call   5b6 <fstat>
 4b3:	83 c4 10             	add    $0x10,%esp
 4b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4b9:	83 ec 0c             	sub    $0xc,%esp
 4bc:	ff 75 f4             	pushl  -0xc(%ebp)
 4bf:	e8 c2 00 00 00       	call   586 <close>
 4c4:	83 c4 10             	add    $0x10,%esp
  return r;
 4c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 4ca:	c9                   	leave  
 4cb:	c3                   	ret    

000004cc <atoi>:

int
atoi(const char *s)
{
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 4d2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4d9:	eb 25                	jmp    500 <atoi+0x34>
    n = n*10 + *s++ - '0';
 4db:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4de:	89 d0                	mov    %edx,%eax
 4e0:	c1 e0 02             	shl    $0x2,%eax
 4e3:	01 d0                	add    %edx,%eax
 4e5:	01 c0                	add    %eax,%eax
 4e7:	89 c1                	mov    %eax,%ecx
 4e9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ec:	8d 50 01             	lea    0x1(%eax),%edx
 4ef:	89 55 08             	mov    %edx,0x8(%ebp)
 4f2:	0f b6 00             	movzbl (%eax),%eax
 4f5:	0f be c0             	movsbl %al,%eax
 4f8:	01 c8                	add    %ecx,%eax
 4fa:	83 e8 30             	sub    $0x30,%eax
 4fd:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 500:	8b 45 08             	mov    0x8(%ebp),%eax
 503:	0f b6 00             	movzbl (%eax),%eax
 506:	3c 2f                	cmp    $0x2f,%al
 508:	7e 0a                	jle    514 <atoi+0x48>
 50a:	8b 45 08             	mov    0x8(%ebp),%eax
 50d:	0f b6 00             	movzbl (%eax),%eax
 510:	3c 39                	cmp    $0x39,%al
 512:	7e c7                	jle    4db <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 514:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 517:	c9                   	leave  
 518:	c3                   	ret    

00000519 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 519:	55                   	push   %ebp
 51a:	89 e5                	mov    %esp,%ebp
 51c:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 51f:	8b 45 08             	mov    0x8(%ebp),%eax
 522:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 525:	8b 45 0c             	mov    0xc(%ebp),%eax
 528:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 52b:	eb 17                	jmp    544 <memmove+0x2b>
    *dst++ = *src++;
 52d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 530:	8d 50 01             	lea    0x1(%eax),%edx
 533:	89 55 fc             	mov    %edx,-0x4(%ebp)
 536:	8b 55 f8             	mov    -0x8(%ebp),%edx
 539:	8d 4a 01             	lea    0x1(%edx),%ecx
 53c:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 53f:	0f b6 12             	movzbl (%edx),%edx
 542:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 544:	8b 45 10             	mov    0x10(%ebp),%eax
 547:	8d 50 ff             	lea    -0x1(%eax),%edx
 54a:	89 55 10             	mov    %edx,0x10(%ebp)
 54d:	85 c0                	test   %eax,%eax
 54f:	7f dc                	jg     52d <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 551:	8b 45 08             	mov    0x8(%ebp),%eax
}
 554:	c9                   	leave  
 555:	c3                   	ret    

00000556 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 556:	b8 01 00 00 00       	mov    $0x1,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <exit>:
SYSCALL(exit)
 55e:	b8 02 00 00 00       	mov    $0x2,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <wait>:
SYSCALL(wait)
 566:	b8 03 00 00 00       	mov    $0x3,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <pipe>:
SYSCALL(pipe)
 56e:	b8 04 00 00 00       	mov    $0x4,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <read>:
SYSCALL(read)
 576:	b8 05 00 00 00       	mov    $0x5,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <write>:
SYSCALL(write)
 57e:	b8 10 00 00 00       	mov    $0x10,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <close>:
SYSCALL(close)
 586:	b8 15 00 00 00       	mov    $0x15,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <kill>:
SYSCALL(kill)
 58e:	b8 06 00 00 00       	mov    $0x6,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <exec>:
SYSCALL(exec)
 596:	b8 07 00 00 00       	mov    $0x7,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <open>:
SYSCALL(open)
 59e:	b8 0f 00 00 00       	mov    $0xf,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <mknod>:
SYSCALL(mknod)
 5a6:	b8 11 00 00 00       	mov    $0x11,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <unlink>:
SYSCALL(unlink)
 5ae:	b8 12 00 00 00       	mov    $0x12,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <fstat>:
SYSCALL(fstat)
 5b6:	b8 08 00 00 00       	mov    $0x8,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <link>:
SYSCALL(link)
 5be:	b8 13 00 00 00       	mov    $0x13,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <mkdir>:
SYSCALL(mkdir)
 5c6:	b8 14 00 00 00       	mov    $0x14,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <chdir>:
SYSCALL(chdir)
 5ce:	b8 09 00 00 00       	mov    $0x9,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <dup>:
SYSCALL(dup)
 5d6:	b8 0a 00 00 00       	mov    $0xa,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <getpid>:
SYSCALL(getpid)
 5de:	b8 0b 00 00 00       	mov    $0xb,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <sbrk>:
SYSCALL(sbrk)
 5e6:	b8 0c 00 00 00       	mov    $0xc,%eax
 5eb:	cd 40                	int    $0x40
 5ed:	c3                   	ret    

000005ee <sleep>:
SYSCALL(sleep)
 5ee:	b8 0d 00 00 00       	mov    $0xd,%eax
 5f3:	cd 40                	int    $0x40
 5f5:	c3                   	ret    

000005f6 <uptime>:
SYSCALL(uptime)
 5f6:	b8 0e 00 00 00       	mov    $0xe,%eax
 5fb:	cd 40                	int    $0x40
 5fd:	c3                   	ret    

000005fe <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5fe:	55                   	push   %ebp
 5ff:	89 e5                	mov    %esp,%ebp
 601:	83 ec 18             	sub    $0x18,%esp
 604:	8b 45 0c             	mov    0xc(%ebp),%eax
 607:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 60a:	83 ec 04             	sub    $0x4,%esp
 60d:	6a 01                	push   $0x1
 60f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 612:	50                   	push   %eax
 613:	ff 75 08             	pushl  0x8(%ebp)
 616:	e8 63 ff ff ff       	call   57e <write>
 61b:	83 c4 10             	add    $0x10,%esp
}
 61e:	90                   	nop
 61f:	c9                   	leave  
 620:	c3                   	ret    

00000621 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 621:	55                   	push   %ebp
 622:	89 e5                	mov    %esp,%ebp
 624:	53                   	push   %ebx
 625:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 628:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 62f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 633:	74 17                	je     64c <printint+0x2b>
 635:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 639:	79 11                	jns    64c <printint+0x2b>
    neg = 1;
 63b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 642:	8b 45 0c             	mov    0xc(%ebp),%eax
 645:	f7 d8                	neg    %eax
 647:	89 45 ec             	mov    %eax,-0x14(%ebp)
 64a:	eb 06                	jmp    652 <printint+0x31>
  } else {
    x = xx;
 64c:	8b 45 0c             	mov    0xc(%ebp),%eax
 64f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 652:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 659:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 65c:	8d 41 01             	lea    0x1(%ecx),%eax
 65f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 662:	8b 5d 10             	mov    0x10(%ebp),%ebx
 665:	8b 45 ec             	mov    -0x14(%ebp),%eax
 668:	ba 00 00 00 00       	mov    $0x0,%edx
 66d:	f7 f3                	div    %ebx
 66f:	89 d0                	mov    %edx,%eax
 671:	0f b6 80 8c 0d 00 00 	movzbl 0xd8c(%eax),%eax
 678:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 67c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 67f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 682:	ba 00 00 00 00       	mov    $0x0,%edx
 687:	f7 f3                	div    %ebx
 689:	89 45 ec             	mov    %eax,-0x14(%ebp)
 68c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 690:	75 c7                	jne    659 <printint+0x38>
  if(neg)
 692:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 696:	74 2d                	je     6c5 <printint+0xa4>
    buf[i++] = '-';
 698:	8b 45 f4             	mov    -0xc(%ebp),%eax
 69b:	8d 50 01             	lea    0x1(%eax),%edx
 69e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6a1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6a6:	eb 1d                	jmp    6c5 <printint+0xa4>
    putc(fd, buf[i]);
 6a8:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ae:	01 d0                	add    %edx,%eax
 6b0:	0f b6 00             	movzbl (%eax),%eax
 6b3:	0f be c0             	movsbl %al,%eax
 6b6:	83 ec 08             	sub    $0x8,%esp
 6b9:	50                   	push   %eax
 6ba:	ff 75 08             	pushl  0x8(%ebp)
 6bd:	e8 3c ff ff ff       	call   5fe <putc>
 6c2:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6c5:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6c9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6cd:	79 d9                	jns    6a8 <printint+0x87>
    putc(fd, buf[i]);
}
 6cf:	90                   	nop
 6d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6d3:	c9                   	leave  
 6d4:	c3                   	ret    

000006d5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6d5:	55                   	push   %ebp
 6d6:	89 e5                	mov    %esp,%ebp
 6d8:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6db:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6e2:	8d 45 0c             	lea    0xc(%ebp),%eax
 6e5:	83 c0 04             	add    $0x4,%eax
 6e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6f2:	e9 59 01 00 00       	jmp    850 <printf+0x17b>
    c = fmt[i] & 0xff;
 6f7:	8b 55 0c             	mov    0xc(%ebp),%edx
 6fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6fd:	01 d0                	add    %edx,%eax
 6ff:	0f b6 00             	movzbl (%eax),%eax
 702:	0f be c0             	movsbl %al,%eax
 705:	25 ff 00 00 00       	and    $0xff,%eax
 70a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 70d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 711:	75 2c                	jne    73f <printf+0x6a>
      if(c == '%'){
 713:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 717:	75 0c                	jne    725 <printf+0x50>
        state = '%';
 719:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 720:	e9 27 01 00 00       	jmp    84c <printf+0x177>
      } else {
        putc(fd, c);
 725:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 728:	0f be c0             	movsbl %al,%eax
 72b:	83 ec 08             	sub    $0x8,%esp
 72e:	50                   	push   %eax
 72f:	ff 75 08             	pushl  0x8(%ebp)
 732:	e8 c7 fe ff ff       	call   5fe <putc>
 737:	83 c4 10             	add    $0x10,%esp
 73a:	e9 0d 01 00 00       	jmp    84c <printf+0x177>
      }
    } else if(state == '%'){
 73f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 743:	0f 85 03 01 00 00    	jne    84c <printf+0x177>
      if(c == 'd'){
 749:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 74d:	75 1e                	jne    76d <printf+0x98>
        printint(fd, *ap, 10, 1);
 74f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 752:	8b 00                	mov    (%eax),%eax
 754:	6a 01                	push   $0x1
 756:	6a 0a                	push   $0xa
 758:	50                   	push   %eax
 759:	ff 75 08             	pushl  0x8(%ebp)
 75c:	e8 c0 fe ff ff       	call   621 <printint>
 761:	83 c4 10             	add    $0x10,%esp
        ap++;
 764:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 768:	e9 d8 00 00 00       	jmp    845 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 76d:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 771:	74 06                	je     779 <printf+0xa4>
 773:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 777:	75 1e                	jne    797 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 779:	8b 45 e8             	mov    -0x18(%ebp),%eax
 77c:	8b 00                	mov    (%eax),%eax
 77e:	6a 00                	push   $0x0
 780:	6a 10                	push   $0x10
 782:	50                   	push   %eax
 783:	ff 75 08             	pushl  0x8(%ebp)
 786:	e8 96 fe ff ff       	call   621 <printint>
 78b:	83 c4 10             	add    $0x10,%esp
        ap++;
 78e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 792:	e9 ae 00 00 00       	jmp    845 <printf+0x170>
      } else if(c == 's'){
 797:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 79b:	75 43                	jne    7e0 <printf+0x10b>
        s = (char*)*ap;
 79d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7a0:	8b 00                	mov    (%eax),%eax
 7a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7a5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7ad:	75 25                	jne    7d4 <printf+0xff>
          s = "(null)";
 7af:	c7 45 f4 14 0b 00 00 	movl   $0xb14,-0xc(%ebp)
        while(*s != 0){
 7b6:	eb 1c                	jmp    7d4 <printf+0xff>
          putc(fd, *s);
 7b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bb:	0f b6 00             	movzbl (%eax),%eax
 7be:	0f be c0             	movsbl %al,%eax
 7c1:	83 ec 08             	sub    $0x8,%esp
 7c4:	50                   	push   %eax
 7c5:	ff 75 08             	pushl  0x8(%ebp)
 7c8:	e8 31 fe ff ff       	call   5fe <putc>
 7cd:	83 c4 10             	add    $0x10,%esp
          s++;
 7d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d7:	0f b6 00             	movzbl (%eax),%eax
 7da:	84 c0                	test   %al,%al
 7dc:	75 da                	jne    7b8 <printf+0xe3>
 7de:	eb 65                	jmp    845 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7e0:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7e4:	75 1d                	jne    803 <printf+0x12e>
        putc(fd, *ap);
 7e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7e9:	8b 00                	mov    (%eax),%eax
 7eb:	0f be c0             	movsbl %al,%eax
 7ee:	83 ec 08             	sub    $0x8,%esp
 7f1:	50                   	push   %eax
 7f2:	ff 75 08             	pushl  0x8(%ebp)
 7f5:	e8 04 fe ff ff       	call   5fe <putc>
 7fa:	83 c4 10             	add    $0x10,%esp
        ap++;
 7fd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 801:	eb 42                	jmp    845 <printf+0x170>
      } else if(c == '%'){
 803:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 807:	75 17                	jne    820 <printf+0x14b>
        putc(fd, c);
 809:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80c:	0f be c0             	movsbl %al,%eax
 80f:	83 ec 08             	sub    $0x8,%esp
 812:	50                   	push   %eax
 813:	ff 75 08             	pushl  0x8(%ebp)
 816:	e8 e3 fd ff ff       	call   5fe <putc>
 81b:	83 c4 10             	add    $0x10,%esp
 81e:	eb 25                	jmp    845 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 820:	83 ec 08             	sub    $0x8,%esp
 823:	6a 25                	push   $0x25
 825:	ff 75 08             	pushl  0x8(%ebp)
 828:	e8 d1 fd ff ff       	call   5fe <putc>
 82d:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 830:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 833:	0f be c0             	movsbl %al,%eax
 836:	83 ec 08             	sub    $0x8,%esp
 839:	50                   	push   %eax
 83a:	ff 75 08             	pushl  0x8(%ebp)
 83d:	e8 bc fd ff ff       	call   5fe <putc>
 842:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 845:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 84c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 850:	8b 55 0c             	mov    0xc(%ebp),%edx
 853:	8b 45 f0             	mov    -0x10(%ebp),%eax
 856:	01 d0                	add    %edx,%eax
 858:	0f b6 00             	movzbl (%eax),%eax
 85b:	84 c0                	test   %al,%al
 85d:	0f 85 94 fe ff ff    	jne    6f7 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 863:	90                   	nop
 864:	c9                   	leave  
 865:	c3                   	ret    

00000866 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 866:	55                   	push   %ebp
 867:	89 e5                	mov    %esp,%ebp
 869:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 86c:	8b 45 08             	mov    0x8(%ebp),%eax
 86f:	83 e8 08             	sub    $0x8,%eax
 872:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 875:	a1 a8 0d 00 00       	mov    0xda8,%eax
 87a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 87d:	eb 24                	jmp    8a3 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 87f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 882:	8b 00                	mov    (%eax),%eax
 884:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 887:	77 12                	ja     89b <free+0x35>
 889:	8b 45 f8             	mov    -0x8(%ebp),%eax
 88c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 88f:	77 24                	ja     8b5 <free+0x4f>
 891:	8b 45 fc             	mov    -0x4(%ebp),%eax
 894:	8b 00                	mov    (%eax),%eax
 896:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 899:	77 1a                	ja     8b5 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 89b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89e:	8b 00                	mov    (%eax),%eax
 8a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8a9:	76 d4                	jbe    87f <free+0x19>
 8ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ae:	8b 00                	mov    (%eax),%eax
 8b0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8b3:	76 ca                	jbe    87f <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b8:	8b 40 04             	mov    0x4(%eax),%eax
 8bb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c5:	01 c2                	add    %eax,%edx
 8c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ca:	8b 00                	mov    (%eax),%eax
 8cc:	39 c2                	cmp    %eax,%edx
 8ce:	75 24                	jne    8f4 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8d0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d3:	8b 50 04             	mov    0x4(%eax),%edx
 8d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d9:	8b 00                	mov    (%eax),%eax
 8db:	8b 40 04             	mov    0x4(%eax),%eax
 8de:	01 c2                	add    %eax,%edx
 8e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e3:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e9:	8b 00                	mov    (%eax),%eax
 8eb:	8b 10                	mov    (%eax),%edx
 8ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f0:	89 10                	mov    %edx,(%eax)
 8f2:	eb 0a                	jmp    8fe <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f7:	8b 10                	mov    (%eax),%edx
 8f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fc:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 901:	8b 40 04             	mov    0x4(%eax),%eax
 904:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 90b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90e:	01 d0                	add    %edx,%eax
 910:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 913:	75 20                	jne    935 <free+0xcf>
    p->s.size += bp->s.size;
 915:	8b 45 fc             	mov    -0x4(%ebp),%eax
 918:	8b 50 04             	mov    0x4(%eax),%edx
 91b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 91e:	8b 40 04             	mov    0x4(%eax),%eax
 921:	01 c2                	add    %eax,%edx
 923:	8b 45 fc             	mov    -0x4(%ebp),%eax
 926:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 929:	8b 45 f8             	mov    -0x8(%ebp),%eax
 92c:	8b 10                	mov    (%eax),%edx
 92e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 931:	89 10                	mov    %edx,(%eax)
 933:	eb 08                	jmp    93d <free+0xd7>
  } else
    p->s.ptr = bp;
 935:	8b 45 fc             	mov    -0x4(%ebp),%eax
 938:	8b 55 f8             	mov    -0x8(%ebp),%edx
 93b:	89 10                	mov    %edx,(%eax)
  freep = p;
 93d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 940:	a3 a8 0d 00 00       	mov    %eax,0xda8
}
 945:	90                   	nop
 946:	c9                   	leave  
 947:	c3                   	ret    

00000948 <morecore>:

static Header*
morecore(uint nu)
{
 948:	55                   	push   %ebp
 949:	89 e5                	mov    %esp,%ebp
 94b:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 94e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 955:	77 07                	ja     95e <morecore+0x16>
    nu = 4096;
 957:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 95e:	8b 45 08             	mov    0x8(%ebp),%eax
 961:	c1 e0 03             	shl    $0x3,%eax
 964:	83 ec 0c             	sub    $0xc,%esp
 967:	50                   	push   %eax
 968:	e8 79 fc ff ff       	call   5e6 <sbrk>
 96d:	83 c4 10             	add    $0x10,%esp
 970:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 973:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 977:	75 07                	jne    980 <morecore+0x38>
    return 0;
 979:	b8 00 00 00 00       	mov    $0x0,%eax
 97e:	eb 26                	jmp    9a6 <morecore+0x5e>
  hp = (Header*)p;
 980:	8b 45 f4             	mov    -0xc(%ebp),%eax
 983:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 986:	8b 45 f0             	mov    -0x10(%ebp),%eax
 989:	8b 55 08             	mov    0x8(%ebp),%edx
 98c:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 98f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 992:	83 c0 08             	add    $0x8,%eax
 995:	83 ec 0c             	sub    $0xc,%esp
 998:	50                   	push   %eax
 999:	e8 c8 fe ff ff       	call   866 <free>
 99e:	83 c4 10             	add    $0x10,%esp
  return freep;
 9a1:	a1 a8 0d 00 00       	mov    0xda8,%eax
}
 9a6:	c9                   	leave  
 9a7:	c3                   	ret    

000009a8 <malloc>:

void*
malloc(uint nbytes)
{
 9a8:	55                   	push   %ebp
 9a9:	89 e5                	mov    %esp,%ebp
 9ab:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9ae:	8b 45 08             	mov    0x8(%ebp),%eax
 9b1:	83 c0 07             	add    $0x7,%eax
 9b4:	c1 e8 03             	shr    $0x3,%eax
 9b7:	83 c0 01             	add    $0x1,%eax
 9ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9bd:	a1 a8 0d 00 00       	mov    0xda8,%eax
 9c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9c5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9c9:	75 23                	jne    9ee <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9cb:	c7 45 f0 a0 0d 00 00 	movl   $0xda0,-0x10(%ebp)
 9d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d5:	a3 a8 0d 00 00       	mov    %eax,0xda8
 9da:	a1 a8 0d 00 00       	mov    0xda8,%eax
 9df:	a3 a0 0d 00 00       	mov    %eax,0xda0
    base.s.size = 0;
 9e4:	c7 05 a4 0d 00 00 00 	movl   $0x0,0xda4
 9eb:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f1:	8b 00                	mov    (%eax),%eax
 9f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f9:	8b 40 04             	mov    0x4(%eax),%eax
 9fc:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9ff:	72 4d                	jb     a4e <malloc+0xa6>
      if(p->s.size == nunits)
 a01:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a04:	8b 40 04             	mov    0x4(%eax),%eax
 a07:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a0a:	75 0c                	jne    a18 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0f:	8b 10                	mov    (%eax),%edx
 a11:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a14:	89 10                	mov    %edx,(%eax)
 a16:	eb 26                	jmp    a3e <malloc+0x96>
      else {
        p->s.size -= nunits;
 a18:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1b:	8b 40 04             	mov    0x4(%eax),%eax
 a1e:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a21:	89 c2                	mov    %eax,%edx
 a23:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a26:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a29:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2c:	8b 40 04             	mov    0x4(%eax),%eax
 a2f:	c1 e0 03             	shl    $0x3,%eax
 a32:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a35:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a38:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a3b:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a41:	a3 a8 0d 00 00       	mov    %eax,0xda8
      return (void*)(p + 1);
 a46:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a49:	83 c0 08             	add    $0x8,%eax
 a4c:	eb 3b                	jmp    a89 <malloc+0xe1>
    }
    if(p == freep)
 a4e:	a1 a8 0d 00 00       	mov    0xda8,%eax
 a53:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a56:	75 1e                	jne    a76 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 a58:	83 ec 0c             	sub    $0xc,%esp
 a5b:	ff 75 ec             	pushl  -0x14(%ebp)
 a5e:	e8 e5 fe ff ff       	call   948 <morecore>
 a63:	83 c4 10             	add    $0x10,%esp
 a66:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a69:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a6d:	75 07                	jne    a76 <malloc+0xce>
        return 0;
 a6f:	b8 00 00 00 00       	mov    $0x0,%eax
 a74:	eb 13                	jmp    a89 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a76:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a79:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7f:	8b 00                	mov    (%eax),%eax
 a81:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a84:	e9 6d ff ff ff       	jmp    9f6 <malloc+0x4e>
}
 a89:	c9                   	leave  
 a8a:	c3                   	ret    
