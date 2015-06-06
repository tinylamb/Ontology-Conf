###本体程序配置

#### 1 系统环境

32/64位 Ubuntu


#### 2 第三方依赖库配置

##### 2.1 

1. boost_1_44_0

	```
	＃解压boost_1_44_0.tar.gz 到 /usr/local.如果出现权限问题，请用sudo执行该命令
	tar zxvf boost_1_44_0.tar.gz -C /usr/local
	
	＃编译Boost.Regex 
	＃检查 echo $BOOST_ROOT 是否等于 /usr/local/boost_1_44_0
	＃如果为空，在~/.bashrc 中写入 export BOOST_ROOT = /usr/local/boost_1_44_0
	cd ${BOOST_ROOT}/libs/regex/build/
	＃如果当前目录存在名为"gcc"的文件夹，则将之删除
	make -f gcc-shared.mak
    make -f gcc.mak
    cd gcc/
    sudo ln -s libboost_regex-gcc-1_42.so /usr/local/lib
    sudo ln -s libboost_regex-gcc-1_42.so /usr/lib
    
    ＃重要，指明boost.regex库的链接位置。在.bashrc中写入
    export LD_LIBRARY_PATH=${BOOST_ROOT}/libs/regex/build/gcc
	
	```
2. ltp-service
	
	```
	cd path_to_ltp-service/__ltpService
	＃检查LTPOption.h 中是否为 #define LINUX_OS  //#define WIN_OS
	cd path_to_ltp-service
	chmod +x configure
	./configure
	make
	sudo make install
	＃如果libutil libxml4nlp libservice 在 /usr/local/lib中，则ltp-service配置成功
	
	```
3. mysql

	```
	sudo apt-get install mysql-server mysql-client libmysqlclient-dev
	
	```

#### 3 生成可执行程序

```
cd ontoEnrich_64/systrm
make

```
