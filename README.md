###本体程序配置

#### 1 系统环境

32/64位 Ubuntu

* 源代码中已经包含在32位下编译生成的.o文件，配置好依赖库(步骤2)后，参考步骤3则可重新link.

  link无误即可运行程序。

* 在64位下重新编译项目，缺失源码conceptRecognizor.cpp,暂时无法通过编译。

#### 2 依赖库

1. boost_1_44_0
   
   1 64位Ubuntu.
   
   [boost_1_44_0安装说明](https://github.com/tinylamb/Ontology-Conf/blob/master/Boost_Install.md)
   
   2 32位Ubuntu.
   
   源码中已经包含boost_1_44_0在32位下编译后的文件，将之放置在 `/usr/local`下即可。

   编译Boost.Regex的[方法](http://www.cnblogs.com/ylan2009/articles/2433522.html)如下:
   
   如果当前目录不存在名为gcc的文件夹，则执行下面操作：
   
   在`$BOOST_PATH/libs/regex/build/`执行如下命令，生成动态链接库
   
   ```
   make -f gcc-shared.mak
   make -f gcc.mak
   sudo ln -s libboost_regex-gcc-1_42.so /usr/local/lib
   sudo ln -s libboost_regex-gcc-1_42.so /usr/lib
   ````
   若存在gcc文件夹，且文件夹中只有`*.o`文件，而没有`*.so`文件。则执行下面操作
   
   在`$BOOST_PATH/libs/regex/build/gcc` 执行如下命令，生成动态链接库
   
   ```
   g++ *.o -fPIC -shared -o libboost_regex-gcc-1_42.so
   sudo ln -s libboost_regex-gcc-1_42.so /usr/local/lib 
   sudo ln -s libboost_regex-gcc-1_42.so /usr/lib
   ````
   配置libboost_regex-gcc-1_42.so的路径，执行如下命令
   ```
   1  cd ~
   2  gedit .bashrc
   //在.bashrc文件中添加下面两行
   export BOOST_PATH="/usr/local/boost_1_44_0"
   export LD_LIBRARY_PATH=$BOOST_PATH/libs/regex/build/gcc
   //保存退出
   3  source .bashrc
   ```
   
   
   
2. 安装mysql

    包括mysql-server,mysql-client,libmysqlclient-dev
   
   `sudo apt-get install mysql-server mysql-client libmysqlclient-dev`
   
3. [ltp-service](https://github.com/HIT-SCIR/ltp)

   修改__ltpService/LTPOption.h文件,对该文件进行如下修改：
   
   ```
   //#define LINUX_OS  ->  #define LINUX_OS 
   #define WIN_OS      ->  //#define WIN_OS
   ```
   
   在ltp_service文件内，依次执行如下3个命令 `./configure;make;sudo make install`
   
   `make` 需要g++支持，如果没有安装g++(用指令`g++ -v 查看是否安装`)，则通过`sudo apt-get install g++`安装
   
   主要的**libutil libxml4nlp libservice**在 `/usr/local/lib`中
   
   
#### 3 make 源文件
1. 见[makefile文件](https://github.com/tinylamb/Ontology-Conf/blob/master/makefile)

2. `cd pathto_ontology/system; make`

   如果提示 "xx"是最新的，请查阅相关资料自行处理。
   
3. 运行`cd pathto_ontoEnrich/system; ./ontologyEnrichment`
