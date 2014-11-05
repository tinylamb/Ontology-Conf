###本体程序配置

#### 1 系统环境

32/64位 Ubuntu

#### 2 依赖库

1. boost_1_44_0
   
   [boost_1_44_0安装说明](https://github.com/tinylamb/Ontology-Conf/blob/master/Boost_Install.md)
   
2. mysql-server,mysql-client,libmysqlclient-dev
   
   `sudo apt-get install mysql-server mysql-client libmysqlclient-dev`
   
3. [ltp-service](https://github.com/HIT-SCIR/ltp)

   修改LTPOption.h文件,启用define LINUX_OS 注释掉//#define WIN_OS
   
   在ltp_service文件内执行 `./configure;make;sudo make install`
   
   主要的**libutil libxml4nlp libservice**在 `/usr/local/lib`中
   
   
#### 3 makefile
1. 见makefile文件

2. `cd pathto_ontology/system; make -f makefile`

   如果提示 "xx"是最新的，删除./system/下 connectMysql.o文件再执行如上命令
   
3. 运行`cd pathto_ontoEnrich/system; ./ontologyEnrichment`