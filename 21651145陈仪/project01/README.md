功能：模拟Mac OS系统的cal命令。
程序尽量符合了系统cal的输入、输出和报错。
除开基础的三种命令格式，还多写了一点：

- cal -m month
- cal -y year
- cal -j month    这个不符合cal的格式，只是尝试实现Julian Calendar过程的中间产物。

另外用宏定义了一个NSLog函数，所以程序的输出不会带有前面那一长串的时间戳。