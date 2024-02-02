# fish-vs-eco

文件树
1. fish to eco
* Bence2003论文：p寄生*p攻击后死亡=p死亡


2. eco to fish
* Lake Michigan: 幼年种群密度和juvenile（可以吸鱼的时期）的种群密度之间的关系（可以用来反推存活率）

3. database

* commercial: 五大湖捕捞量（可以作为种群相对密度的数据）
* erie: 仅lake erie的捕捞量（可以作为lake erie生态系统中种群相对密度的数据）
* LakeErieFish: 五大湖中之一的鱼抽样数据（可以做lake erie生态系统中鱼的体重和游泳距离的数据）
  * Length
  * weight
  * water quality

3. pictures

* life cycle of fish：鳗鱼的生命周期图
* problem overview: 第一天腾讯会议的图

# 总模型

## 用线性回归拟合性别比和幼体密度函数
- 密度不要用等级，用真实密度（只有等级的值用该等级平均密度代替）
- 计算拟合优度
- 证明两个数据线性相关，计算皮尔逊相关系数
- 检验皮尔逊相关系数是否显著：夏皮洛-威尔克检验（可直接用spss计算，具体算出在p=？下可拒绝原假设）
- 把皮尔逊相关系数和夏皮洛-威尔克检验的公式写上，显得高端
- 数据见[数据文档](/eco%20to%20fish%20model/Age,%20growth,%20and%20sex%20ratio%20.md)