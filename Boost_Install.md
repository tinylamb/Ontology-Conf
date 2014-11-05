###准备安装文件

1. 下载[boost_1_44_0](www.boost.org/users/history/version_1_44_0.html)

2. 解压`tar xzf boost_1_44_0.tar.gz /usr/local`


*tips [more about tar](http://segmentfault.com/q/1010000000670089)*

###安装依赖环境

1. `sudo apt-get install python-dev libboost-dev libboost-all-dev libbz2-dev`

###准备编译环境

1. `sudo ./bootstrap.sh`

2. 配置文件project-config.jam  使用默认配置文件即可
 
3. 编译参数说明 `./bjam --help`

###安装boost

1. 编译 `sudo ./bjam`

	报错的解决方法
	
	1 [error:Threading support unavaliable](http://stackoverflow.com/questions/8297652/error-boost-disable-threads)
	
	修改`$BOOST/boost/config/stdlib/libstdcpp3.hpp`
	
	```
	
	＃  if defined(_GLIBCXX_HAVE_GTHR_DEFAULT) \ 
	
 		        || defined(_GLIBCXX__PTHREADS) \ 
 	
 	+	        || defined(_GLIBCXX_HAS_GTHREADS) 
	
	```
	

	2 [error:TIME_UTC](http://stackoverflow.com/questions/13645756/boosttime-utc-with-different-boost-versions)
	
	修改如下两个文件
	
	`$BOOST/boost/thread/xtime.hpp` 
	
	`$BOOST/libs/thread/src/pthread/timecnov.inl`
	
	替换`TIME_UTC` 为 `TIME_UTC_`
	

成功则提示:

**The Boost C++ Libraries were successfully built!** 

**include path : /usr/local/boost_1_44_0**

**link lib path : /usr/local/boost_1_44_0/stage/lib**

2 安装boost `sudo ./bjam install`

###安装boost::regex

1.  进入regex目录`cd $BOOST/libs/regex/build`

2.  编译动态链接库`sudo make -f gcc.mak ;sudo make -f gcc-shared.mak`

3.  symbol link`cd gcc;sudo ln -s libboost_regex-gcc-1_42.so /usr/local/lib /usr/lib`