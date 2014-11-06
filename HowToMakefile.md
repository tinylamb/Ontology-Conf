##How to Makefiles

### 教程

1. [Tutorial makefile ](http://www.cs.umd.edu/class/fall2002/cmsc214/Tutorial/makefile.html)

2. [一起写makefile](http://scc.qibebt.cas.cn/docs/linux/base/%B8%FA%CE%D2%D2%BB%C6%F0%D0%B4Makefile-%B3%C2%F0%A9.pdf)

### 基础

**Separate Compilation**

	makefile 文件中的规则就像玩积木:给出每一个组件生成的规则(依赖＋生成方式),并指明整体如果由组件构成。


With few exceptions, most .cpp files have a corresponding .h file. A .cpp usually consists of:

* the implementations of all methods in a class,

* standalone functions (functions that aren't part of any class),

* and global variables (usually avoided).

The corresponding .h file contains

* class declarations,

* function prototypes,

* and extern variables (again, for global variables).

*The purpose of the .h files is to export "services" to other .cpp files.* 类似python 中的`import`


**生成规则**

```
Movie.o: Movie.cpp Movie.h Vector.h

   g++ -Wall -c Movie.cpp
```

The basic syntax of an entry looks like:

```
<target>: [ <dependency > ]*
   [ <TAB> <command> <endl> ]+
```   

**一个例子**

```
＃宏定义
OBJS = MovieList.o Movie.o NameList.o Name.o Iterator.o
CC = g++
DEBUG = -g
＃compiling flag
CFLAGS = -Wall -c $(DEBUG)
＃linking flag
LFLAGS = -Wall $(DEBUG)

p1 : $(OBJS)
    $(CC) $(LFLAGS) $(OBJS) -o p1

＃编译MovieList.cpp时,其实它已经import了其他*.h,成为 MovieList_new.cpp
MovieList.o : MovieList.h MovieList.cpp Movie.h NameList.h Name.h Iterator.h
    $(CC) $(CFLAGS) MovieList.cpp

Movie.o : Movie.h Movie.cpp NameList.h Name.h
    $(CC) $(CFLAGS) Movie.cpp

NameList.o : NameList.h NameList.cpp Name.h 
    $(CC) $(CFLAGS) NameList.cpp

Name.o : Name.h Name.cpp 
    $(CC) $(CFLAGS) Name.cpp

Iterator.o : Iterator.h Iterator.cpp MovieList.h
    $(CC) $(CFLAGS) Iterator.cpp

＃make clean 执行该命令
clean:
    \rm *.o *~ p1

tar:
    tar cfv p1.tar Movie.h Movie.cpp Name.h Name.cpp NameList.h \
            NameList.cpp  Iterator.cpp Iterator.h

```

