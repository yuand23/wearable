# 可穿戴设备识别人体各种动作项目
## 项目概述
开发一个智能脚环，供病人、老年人等人群在日常生活中佩戴，监护人员或医护人员可以远程通过app页面展示的信息，获取受监控人员的行动状态，以便及时应对各种意外状况，比如老年人摔倒、突发各种疾病等。  
一期目标为：能够在app上实时获取人体走路，跑步，上下楼梯动作状态。
## 方法
1. 首先，脚环中的芯片内置传感器，能够感应速度、动量和磁场强度。
2. 实验者佩戴脚环，做各种动作（静止，走路，跑步，上下楼梯），从而收集到训练数据。
3. 对数据进行处理，生成特征，使用机器学习进行训练（由于训练数据为时间序列数据，因此需要做些处理）。
4. 将决策树模型结果剪枝后以规则形式写入app供前端展示。（由于展示的实时性要求很高，故首先采用这一比较简单粗暴的方式形成第一个版本）。
5. 实验者进行佩戴测试产品效果（实际体验效果还可以）。
6. 为加强识别模型的鲁棒性，让不同年龄、性别的实验者进行数据的采集，然后重复模型训练和效果测试的步骤，优化模型的识别能力。
## 总结
采用机器学习分类模型（初级版本使用的是决策树模型）。  
有一些改进想法，比如借鉴机器学习做推荐系统的方法，将目前的速度动量特征做特征组合得到高阶特征。另外还可以通过傅里叶变换得到步频信息。从磁场强度得到坐标信息（脚环佩戴方式）。 
不过由于资金原因项目搁浅了，应该没机会再改进了==  


