# cal
# 说明1：
已经通过mac虚拟机编译并且成功执行，其中有一些warning,不影响正常使用。
但是修改后的代码无法通过linux 的编译。

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