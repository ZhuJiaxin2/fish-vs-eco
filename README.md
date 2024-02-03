# fish-vs-eco
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
* 五大湖七鳃鳗入侵防治时间线


4. Task 1
* t1b.xlsx：对density-%M的线性拟合，相关系数为0.5452, p = 0.0668 < 0.1, 说明在90%的置信水平上拒绝原假设，幼虫密度与雄性占比有显著的相关性


5. pictures
* life cycle of fish：鳗鱼的生命周期图
* problem overview: 第一天腾讯会议的图


# 总模型

## 用线性回归拟合性别比和幼体密度函数
- 通过引用文献，说明性别比和成年体密度无明显联系
- 密度不要用等级，用真实密度（只有等级的值用该等级平均密度代替）
- 计算拟合优度
- 证明两个数据线性相关，计算皮尔逊相关系数
- 检验皮尔逊相关系数是否显著：夏皮洛-威尔克检验（可直接用spss计算，具体算出在p=？下可拒绝原假设）
- 把皮尔逊相关系数和夏皮洛-威尔克检验的公式写上，显得高端
- 数据见[数据文档](/eco%20to%20fish%20model/Age,%20growth,%20and%20sex%20ratio%20.md)

## 从幼体密度推算成体密度

- **假设**：幼鱼期：4年，吸血（成年）期2年==快引点文献来证明==
- **假设**：幼鱼每年存活率为0.627，引用文献《Survival and metamorphosis of larval sea lamprey (Petromyzon marinus) residing in Lakes Michigan and Huron near river mouths》
- 密度等于单位体积（面积）的数量，因此下面都计算单位面积数量
$$
\begin{align*}
&N^{larval}: 当前时刻单位体积幼鱼数量 \\
&D^{larval}: 幼虫时期的时长（duration），单位：年 \\
&P_y: y年前出生的幼鱼，存活到现在的概率（计算公式见下文）\\
&B: 每年出生的幼鱼数量（未知数，我们要解出B）\\
\end{align*}\\
\begin{align*}
N^{larval} &= \sum^{D^{larval}}_{y=0} P_d B\\
&= \left[\sum^{D^{larval}}_{y=0} P_y\right] B
\end{align*}
$$
注：从今年，到4年前出生的所有未成年鱼，在今年都可能还未成年，在5年前出生的幼鱼，我们认为它要么死了，要么成年了
$$
\begin{align*}
&P_d: d年前出生的幼鱼，存活到现在的概率\\
&y: 时间段，当y=0时，不考虑死亡率、变态率，P_d=1\\
&S^{larval}=0.627: 幼鱼每年存活率\\
&m_i:幼鱼在第i年变态为成年鱼的概率（计算公式见下文）
\end{align*}\\
P_y = \prod^{y}_{i=1} S^{larval}(1-m_i)
$$


- **假设**：$\beta_0=−23.886、\beta_1=0.186$
$$
\begin{align*}
&m_i:幼鱼在第i年变态为成年鱼的概率\\
&\beta_0=−23.886\\
&\beta_1=0.186\\
&\bar{l}：鱼长度区间的中点（我们用平均/中位数长度代替（计算公式见下文））\\
&\Delta l_i：i年前的鱼预期的长度变化量（计算公式见下文）
\end{align*}\\
m_i = \frac
{
  exp[\beta_0 + \beta_1(\bar{l} + \Delta l_i)]
}
{
  1.0 + exp[\beta_0 + \beta_1(\bar{l} + \Delta l_i)]
}
$$
注：
- $\beta_0、\beta_1$引用 《Survival and metamorphosis of larval sea lamprey (Petromyzon marinus) residing in Lakes Michigan and Huron near river mouths》 **β0 and β1 are parameters characterizing the length at which metamorphosis occurs**
- m：使用了逻辑斯蒂回归模型，引用https://www.sciencedirect.com/science/article/abs/pii/S0380133013001846
![m随年份变化的曲线](/imgs/屏幕截图%202024-02-03%20100628.png)


**假设**：$L_{\infty}=159 mm$
**假设**：$d=0.515年（188天）$
$$
\begin{align*}
&\Delta l_i:i年前的鱼预期的长度变化量\\
&L_{\infty}=159：渐进长度\\
&\bar{l}=L_{\infty}/2=79.5mm：鱼长度区间的中点\\
&d=0.515：对特定溪流的成长季时长（growing season duration）
\end{align*}\\
\Delta l_i = (L_{\infty} - \bar{l})[1.0 - exp(-i \times d)]
$$
注：
- $L_{\infty}159 mm$引用三篇论文
  - https://www.sciencedirect.com/science/article/abs/pii/S0380133008715880
  - https://benthamopen.com/ABSTRACT/TOFISHSJ-2-59
  - https://www.sciencedirect.com/science/article/abs/pii/S0380133013001846
- $\Delta l_i$的计算引用
  - von Bertalanffy growth equation
  - 《Survival and metamorphosis of larval sea lamprey (Petromyzon marinus) residing in Lakes Michigan and Huron near river mouths》
- $d=188天$引用：https://www.sciencedirect.com/science/article/abs/pii/S0380133003704845
![$\Delta l_i$随年份变化的曲线](/imgs/屏幕截图%202024-02-03%20100411.png)

### 将算出来的$P_y$、由性别比算出的密度带入最上面的公式，可以算出B
还没写完，先看前面的
**假设**：成年鱼存活率为1==快找个文献论证一下==
$$
\begin{align*}
&N^{juvenile}: 当前时刻单位体积成年鱼数量 \\
&D^{larval}: 幼虫时期的时长（duration），单位：年 \\
&D^{juvenile}: 幼虫时期的时长（duration），单位：年 \\
&P_{D^{larval}}: D^{larval}年及前出生的幼鱼，存活到现在的概率，即幼年鱼成为成年鱼的概率
\end{align*}\\
N^{juvenile} = \sum^{D^{juvenile} - D^{larval}}_{y=1}P_{D^{larval}}B
$$
注：当前时刻成年鱼的数量，等于所有D^{larval}年前出生的鱼
