# cal
## 说明

本项目完全在linux下开发完成，采用开源oc实现GNUstep，实现代码比较老旧，目前已知无法用的oc特性有：
1. NSMutableArray *array = @[@"haha",@"hehe",nil];
2. @autoreleasepool
3. @synthesize
4. @property 无法正常工作
5. NSArray 无法通过方括号访问

## 环境说明
发型版本: Archlinux  4.7.5-1-ARCH
编译： clang

## 编译方式
在安装了GNUstep 和libobjc2 的linux中，直接执行make 命令，会生成obj 文件夹，直接执行obj目录下的cal即可

## 测试命令
`maek && make test`
