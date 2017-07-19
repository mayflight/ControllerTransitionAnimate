# ControllerTransitionAnimate
Controller or NavigationController transition Animation

#  效果演示
![animate](http://i2.kiimg.com/595348/64af3cbf698d9e27.gif)

![animate2](http://i1.buimg.com/595348/801dcb53cf26e77a.gif)

#  转场动画分析
请查看[博客](http://13fafa.cn/2017/06/14/UIViewController的转场动画/#more)

#  一行代码使用转场动画
在工程里面引入文件:<br>
`AnimateProtocol.swift`<br>
`AnimateManager.swift`

如果准备进行模态视图的跳转则设置视图控制器的transitioningDelegate代理为AnimateManager对象

```
let manager = AnimateManager()
controller.transitioningDelegate = manager
```

如果准备进行导航控制器的跳转则设置导航控制器的delegate为AnimateManager对象

```
let manager = AnimateManager()
self.navigationController?.delegate = manager
```

AnimateManager 对象有两个属性animateTye用来设置动画效果类型，time用来设置动画时间

