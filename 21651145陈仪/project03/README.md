功能：任务管理列表。可以添加、删除、显示完整内容、移动列表行、保存列表。

因为是在上课之前就独立完成的，所以主要用到了storyboard、ViewController.m和AppDelegate.m文件。

输入内容用到了UITextView控件，不是UITextField，所以输入区域会大一点。
其边框是在代码中自己瞎写的。请不要嫌丑。
不知道为什么UITextView控件默认无边框，而且在storyboard中没有这个选项。哭……

添加的时候点击Add，可以隐藏软键盘。事件触发的方法为：- (IBAction)addTask:(UIButton *)sender。
新添加的任务显示在列表最上方。并且无论列表当前滚动到哪里，都会滚动回第一条来进行显示。

可以通过左滑列表行来进行删除操作。

因为一行可能显示不全任务内容，所以可以通过单击列表行来弹出一个简单的UIAlertView控件来显示完整内容。

Edit按键是仿照iPhone通讯录的设计，点击后会进入列表行编辑模式。
在此模式下，无法进行左滑删除操作和单击行事件，必须点击左边的红圆圈来删除。
还可以进行移动列表行的操作。
最后点击Done按键退出此模式。
在这里吐槽一下，并不理解为什么要有这么严格的行编辑模式。

有数据持久化功能。用的是读写Documentation下的Tasks.plist文件。
是在viewDidLoad方法中加载数据。
在applicationDidEnterBackground和applicationWillTerminate方法中获得rootViewController来保存列表。

最后，点击空白处可以隐藏软键盘，只要你找得到……额，在列表上的空白处是没有用的，因为我没写。