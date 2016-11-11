# MLMCircleProgress

###主要功能
![image](https://github.com/MengLiMing/MLMCircleProgress/blob/master/all.gif)  
    
    1.水波
    2.圆形进度条和刻度，也可以将两种进行组合
    3.简单统计


###水波进度
![image](https://github.com/MengLiMing/MLMCircleProgress/blob/master/waterWave.gif)
    
    使用 将 waterWave 文件夹拖入工程
    topColor 深色水纹的颜色
    bottomColor 浅色水纹的颜色
    progress 设置进度（0-1）
    progress_animation 设置进度改变时是否使用动画，默认YES
    
    
    其他属性可以微调水波的样式：
    wave_Amplitude 振幅，默认设置为view的1/20，具体可以自己设置
    wave_Cycle 周期，默认设置为一个周期是view宽度的0.9
    wave_distance 深色波纹和浅色波纹之间的偏移，默认偏移，一个周期宽度的0.8
    
    wave_scale 调节波纹速度
    progress_scale progress_animation设置为YES时调节动画速度


###仪表盘
![image](https://github.com/MengLiMing/MLMCircleProgress/blob/master/instrument.gif)

    MLMCalibrationView + MLMCircleView 实现不同样式的仪表盘
    
    具体使用，我已经在MLMProgressView写了两种样式的例子，你也可以使用上述两种view进行组合
    将 instrument 和 help 文件夹直接拖入工程


###统计
![image](https://github.com/MengLiMing/MLMCircleProgress/blob/master/Statistical.png)

    使用 将 statistical 文件夹拖入工程
    
####待升级(当然也可以贡献你们的代码)

    1.进度条颜色渐变设置
    2.刻度添加表针，能实现简单时钟效果最好
    3.其它...
    4.刻度表盘现有一bug需修复，设置度数0-360时，起点终点刻度值重叠
    5.统计样式添加动画效果
