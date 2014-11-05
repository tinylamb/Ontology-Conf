###准备安装文件

* [boost_1_44_0](www.boost.org/users/history/version_1_44_0.html)

* `tar xzf boost_1_44_0.tar.gz /usr/local`

* [more about tar](http://segmentfault.com/q/1010000000670089)

###安装依赖环境

* `sudo apt-get install python-dev libboost-dev libboost-all-dev libbz2-dev`

###准备编译环境

* `sudo ./bootstrap.sh`

* 配置文件project-config.jam  使用默认配置文件即可
 
* 编译参数说明 `./bjam --help`

###安装boost

* `sudo ./bjam`

	报错的解决方法
	
	1 error:Threading support unavaliable
	
	修改`$BOOST/boost/config/stdlib/libstdcpp3.hpp`
	
	
	2 error:TIME_UTC
	
	修改`$BOOST/boost/thread/xtime.hpp` 
	
	`$BOOST/libs/thread/src/pthread/timecnov.inl`文件
	
	替换`TIME_UTC` 为 `TIME_UTC_`
	

成功则提示:

**The Boost C++ Libraries were successfully built!** 

**include path : /usr/local/boost_1_44_0**

**link lib path : /usr/local/boost_1_44_0/stage/lib**

* `sudo ./bjam install`

###安装boost::regex

*  `cd $BOOST/libs/regex/build`

*  `sudo make -f gcc.mak`

*  `sudo make -f gcc-shared.mak`

*   `cd gcc;sudo ln -s libboost_regex-gcc-1_42.so /usr/local/lib /usr/lib`