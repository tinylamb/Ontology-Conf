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
   
   并在`$BOOST/libs/regex/build/gcc` 执行如下命令，生成动态链接库
   
   ```
   g++ *.o -fPIC -shared -o libboost_regex-gcc-1_42.so
   sudo ln -s libboost_regex-gcc-1_42.so /usr/local/lib /usr/lib
   ````
   
   
2. mysql-server,mysql-client,libmysqlclient-dev
   
   `sudo apt-get install mysql-server mysql-client libmysqlclient-dev`
   
3. [ltp-service](https://github.com/HIT-SCIR/ltp)

   修改LTPOption.h文件,启用define LINUX_OS 注释掉//#define WIN_OS
   
   在ltp_service文件内执行 `./configure;make;sudo make install`
   
   主要的**libutil libxml4nlp libservice**在 `/usr/local/lib`中
   
   
#### 3 make 源文件
1. 见[makefile文件](https://github.com/tinylamb/Ontology-Conf/blob/master/makefile)

2. `cd pathto_ontology/system; make`

   如果提示 "xx"是最新的，请查阅相关资料自行处理。
   
3. 运行`cd pathto_ontoEnrich/system; ./ontologyEnrichment`
