# cal
## 说明1：
已经通过mac虚拟机编译并且成功执行，其中有一些warning,不影响正常使用，但是修改后的代码无法通过linux 的编译。

请按照普通的方式`make && make run`

## 说明2：

本项目完全在linux下开发完成，采用开源oc实现GNUstep，实现代码比较老旧，目前已知无法用的oc特性有：

1. `NSMutableArray *array = @[@"haha",@"hehe",nil];``

2. `@autoreleasepool`

3. `@synthesize`

4. `@property` 无法正常工作

5. `NSArray` 无法通过方括号访问


## 环境说明
发型版本: `Archlinux  4.7.5-1-ARCH`

编译： `clang`

## 编译方式
1. 将GNUmakefile_backup 重命名为GNUmakefile 
2. 在安装了`GNUstep` 和`libobjc2` 的`linux`中，直接执行`make` 命令，会生成`obj` 文件夹，直接执行`obj`目录下的`cal`即可

## 测试命令
`maek && make test`

# 在linux上编译Objective-C代码
## 1.安装基本依赖
```bash
sudo apt-get install build-essential clang libblocksruntime-dev libkqueue-dev libpthread-workqueue-dev gobjc libxml2-dev libjpeg-dev libtiff-dev libpng12-dev libcups2-dev libfreetype6-dev libcairo2-dev libxt-dev libgl1-mesa-dev
```

## 2.安装 libobj2 和 GNUstep 库
### 安装libobj2
首先设置环境变量：
`export CC=clang`
下载libobj2的源代码：
[libobjc2-1.6.tar.gz](http://download.gna.org/gnustep/libobjc2-1.6.tar.gz)
下载解压之后在解压目录下：
```bash
make
sudo make install
```
### 安装GNUstep
需要下载以下几个文件：

1. GNUstep Make
2. GNUstep Base
3. GNUstep GUI
4. GNUstep Backend

#### Ubuntu
在ubuntu 官方库里也有这些文件，你可以直接输入以下命令安装：
`sudo apt-get install gnustep-make gnustep-common gnustep`

#### Other
别的linux发行版，可以通过自己编译源代码安装：
源代码下载地址：

[gnustep-make](ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-make-2.6.2.tar.gz)

[gnustep-base](ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-base-1.24.0.tar.gz)

[gnustep-gui](ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-gui-0.22.0.tar.gz)

[gnustep-backend](ftp://ftp.gnustep.org/pub/gnustep/core/gnustep-back-0.22.0.tar.gz)

下载解压之后，在解压出来的目录依次执行：
```bash
./configure
make
sudo make install
```
> Note: 如果你误操作先安装了GNUstep然后再安装libobj2 请重新配置一下`gnustepmake`
> `sudo dpkg-reconfigure  gnustep-make`


## 安装libdispatch-dev
### ubuntu
在terminal 中执行
```bash
sudo apt-get install libdispatch-dev
```

### other
应该在自带的包管理工具都有吧，木有测试。。

## Try it out
### 样例代码：

- main.m
```c
	//
	// main.m
	// Just a little test case for Objective-C 2.0 on Ubuntu
	//
	// Created by Tobias Lensing on 2/22/13.
	// More cool stuff available at blog.tlensing.org.
	//
	#import <Foundation/Foundation.h>
	#import <AppKit/AppKit.h>
	#import <dispatch/dispatch.h>
	int main(int argc, const char * argv[])
	{
	@autoreleasepool {
	int multiplier = 7;
	int (^myBlock)(int) = ^(int num) {
	return num * multiplier;
	};
	NSLog(@"%d", myBlock(3));
	dispatch_queue_t queue = dispatch_queue_create(NULL, NULL);
	dispatch_sync(queue, ^{
	printf("Hello, world from a dispatch queue!\n");
	});
	dispatch_release(queue);
	}
	@autoreleasepool {
	[NSApplication sharedApplication];
	NSRunAlertPanel(@"Test", @"Wow it works!", @"OK", nil, nil);
	}
	return 0;
	}
```

### 编译之
```bash
clang `gnustep-config --objc-flags` -o main -x objective-c main.m -fconstant-string-class=NSConstantString -fobjc-nonfragile-abi -fblocks -lgnustep-base -lgnustep-gui -ldispatch -I/usr/include/GNUstep -L/usr/lib/GNUstep
```
> 如果你不想有意外的错误，不要尝试修改其中的参数位置（亲测）

### 运行之

`./main`

输出：
```
2013-02-24 01:08:20.981 main[6710] 21
Hello, world from a dispatch queue!
```
## Notice

1. 有些网站需要科学上网
2. 不保证所有linux发行版能够work(我的是ubuntu 16.04)
3. 只能够编译简单的oc代码，后面的cocoa cocoa-touch 就无能为力了
4. Good luck

Reference:
[Objective-C on Linux: Setting up GNUstep, clang (llvm), Objective-C 2.0, Blocks Runtime, GCD on Ubuntu 12.04](https://blog.tlensing.org/2013/02/24/objective-c-on-linux-setting-up-gnustep-clang-llvm-objective-c-2-0-blocks-runtime-gcd-on-ubuntu-12-04/)