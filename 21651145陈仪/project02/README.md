功能：在iPhone（模拟器）上根据日期选择打印出一个月历。当然只有改变年、月才有变化。

不好意思，没有将第一个作业生成framework再导入，而是直接将CalMonth.h和CalMonth.m文件添加进来。

本次作业的详细代码都在storyboard和ViewController.m中。

显示月历用的是UILabel控件，用sizeThatFits和setFrame方法实现自适应调整大小显示内容。
控件是用代码添加，没直接拖到storyboard上。因为如果那样做，不知道为什么程序进入的时候不会自适应调整大小显示内容。

用到DatePick控件，其value changed事件的回调方法是：- (IBAction)onYearOrMonthChanged:(id)sender