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
- 数据见[数据文档](./eco%20to%20fish%20model/Age,%20growth,%20and%20sex%20ratio%20.md)

## 从幼体密度推算成体密度

[参考文档](./eco%20to%20fish%20model/Survival%20and%20metamorphosis/Survival%20and%20metamorphosis.md)

- **假设**：幼鱼期：4年，吸血（成年）期2年，引用 [Minnesota DNR](https://www.dnr.state.mn.us/invasives/aquaticanimals/sealamprey/index.html)
- **假设**：幼鱼每年存活率为0.627，引用文献《Survival and metamorphosis of larval sea lamprey (Petromyzon marinus) residing in Lakes Michigan and Huron near river mouths》
- **假设**：环境处在稳态，每年的出生数量一样
- 密度等于单位体积（面积）的数量，因此下面都计算单位面积数量

$$
\begin{align*}
&N^{larval}: 当前时刻单位体积幼鱼数量 \\
&D^{larval}=4年: 幼虫时期的时长（duration），单位：年 \\
&P_y: y年前出生的幼鱼，存活到现在并且没有变态的概率（计算公式见下文）\\
&B: 每年出生的幼鱼数量（未知数，我们要解出B）\\
\end{align*}\\
$$
$$
\begin{align*}
N^{larval} &= \sum^{D^{larval}}_{y=0} P_y B\\
&= \left[\sum^{D^{larval}}_{y=0} P_y\right] B
\end{align*}
$$

注：从今年，到4年前出生的所有未成年鱼，在今年都可能还未成年，在5年前出生的幼鱼，我们认为它要么死了，要么成年了

$$
\begin{align*}
&P_y: y年前出生的幼鱼，存活到现在且没有变态的概率\\
&y: 时间段，当y=0时，不考虑死亡率、变态率，P_y=1\\
&S^{larval}=0.627: 幼鱼每年存活率\\
&m_i:幼鱼在第i年变态为成年鱼的概率（计算公式见下文）
\end{align*}
$$
$$
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
\end{align*}
$$
$$
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
![m随年份变化的曲线](./imgs/屏幕截图%202024-02-03%20100628.png)


**假设**：$L_{\infty}=159 mm$
**假设**：$d=0.515年（188天）$

$$
\begin{align*}
&\Delta l_i:i年前的鱼预期的长度变化量\\
&L_{\infty}=159：渐进长度\\
&\bar{l}=L_{\infty}/2=79.5mm：鱼长度区间的中点\\
&d=0.515：对特定溪流的成长季时长（growing season duration）
\end{align*}
$$
$$
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
![$\Delta l_i$随年份变化的曲线](./imgs/屏幕截图%202024-02-03%20100411.png)

### 将算出来的$P_y$、性别比算出的密度带入最上面的公式，可以算出B

**假设**：成年鱼存活率为1==快找个文献论证一下==（或者根本不提这个事了）
$$
\begin{align*}
&N^{juvenile}: 当前时刻单位体积成年鱼数量 \\
&D^{larval}=4年: 未成年时期的时长（duration），单位：年 \\
&D^{juvenile}=2年: 成年时期的时长（duration），单位：年 \\
&S^{larval}=0.627: 幼鱼每年存活率\\
&P_y: 幼鱼存活y年，且没有变态的概率（前面算过了）\\
&R_{y}: y年前的那一年出生的鱼，在今年或之前成年并存活的概率\\
&m_i:幼鱼在第i年变态为成年鱼的概率（前面算过了）\\
&B: 每年出生的幼鱼数量（前面算过了）
\end{align*}
$$

**思路**：今年成年鱼的数量，等于寿命时间范围内，每年出生的鱼的数量，乘这些鱼存活并变态的概率

今年出生的未成年鱼不会成年
1年前出生的未成年鱼今年成年的概率等于**存活一年**并**变态**
$$
R_1 = S^{larval}  m_1
$$
2年前出生的未成年鱼现在成年且存活的概率等于：出生就成年（概率为0） + 幼鱼存活1年再成年 + 幼鱼存活2年，今年成年
$$
\begin{align*}
R_2 &= S^{larval}  m_1 \\
&+ S^{larval} (1-m_1) \times S^{larval} m_2
\end{align*}
$$

3年前出生的未成年鱼现在成年且存活的概率等于：出生就成年（概率为0） + 幼鱼存活1年再成年 + 幼鱼存活2年再成年 + 幼鱼存活3年再成年
$$
\begin{align*}
R_3 &= S^{larval}  m_1 \\
&+ S^{larval} (1-m_1) \times S^{larval} m_2\\
&+ S^{larval} (1-m_1) \times S^{larval} (1-m_2) \times S^{larval} m_3
\end{align*}
$$

4年前出生的未成年鱼现在成年且存活的概率等于：出生就成年（概率为0） + 幼鱼存活1年再成年(但是成年后活了2年就死了) + 幼鱼存活2年再成年 + 幼鱼存活3年再成年 + 幼鱼存活4年再成年
$$
\begin{align*}
R_4 &= S^{larval} (1-m_1) \times S^{larval} m_2\\
&+ S^{larval} (1-m_1) \times S^{larval} (1-m_2) \times S^{larval} m_3\\
&+ S^{larval} (1-m_1) \times S^{larval} (1-m_2) \times  S^{larval} (1-m_3) \times S^{larval} m_4
\end{align*}
$$

5年前出生的未成年鱼现在成年且存活的概率等于：出生就成年（概率为0） + 幼鱼存活1年再成年(但是成年后活了2年就死了) + 幼鱼存活2年再成年(但是成年后活了2年就死了) + 幼鱼存活3年再成年 + 幼鱼存活4年再成年
$$
\begin{align*}
R_5 &= S^{larval} (1-m_1) \times S^{larval} (1-m_2) \times S^{larval} m_3\\
&+ S^{larval} (1-m_1) \times S^{larval} (1-m_2) \times  S^{larval} (1-m_3) \times S^{larval} m_4
\end{align*}
$$

6年前出生的未成年鱼现在成年且存活的概率等于：出生就成年（概率为0） + 幼鱼存活1年再成年(但是成年后活了2年就死了) + 幼鱼存活2年再成年(但是成年后活了2年就死了) + 幼鱼存活3年再成年(但是成年后活了2年就死了) + 幼鱼存活4年再成年
$$
\begin{align*}
R_6 &=  S^{larval} (1-m_1) \times S^{larval} (1-m_2) \times  S^{larval} (1-m_3) \times S^{larval} m_4
\end{align*}
$$

如果一个幼虫超过4年了还没成年，我们认为它已经死了

总公式如下：
$$
R_y = \sum_{i=max(y-D^{juvenile}, 0)}^{min(y,D^{larval})} P_{i-1} S^{larval} m_i\\
P_0 = 1\\
y = 1, 2...(D^{larval} + D^{juvenile})
$$

$$
N^{juvenile} = \sum^{D^{juvenile} + D^{larval}}_{y=1} R_y B
$$

注：当前时刻成年鱼的数量，等于所有$D^{juvenile} + D^{larval}$年前出生的鱼

这样，就从性别比，幼虫密度到出生量B，计算出了当前成年个体的数量

## 计算七鳃鳗密度对各种鱼类的影响

[参考文档](./fish%20to%20eco%20model/Sea%20Lamprey%20Parasite-host%20Interactions/Sea%20Lamprey%20Parasite-host%20Interactions.md)
$$
\begin{align*}
&a_i：寄生生物对第i种宿主的攻击次数\\
&F=0.41：进食季节长度\\
&N_i：第i种宿主的密度\\
&\lambda_i=S_i=7.884L_i：对第i种宿主的有效搜索率\\
&h_i=0.0548：第i种宿主附着时间\\
&L_i：宿主长度（mm）\\
\end{align*}
$$

$$
a_i = \frac{F\lambda_i N_i}
           {1 + \sum_j \lambda_j N_j h_j}
$$

- **假设**：所有物种的h都相同（不会造成极端影响）
    - 引用：Although handling times will really vary among host types, this assumption is not as extreme as it first appears because it is applied only to the larger host species that form a substantial portion of the diet during the summer and autumn feeding season that is being modeled. **《Sea Lamprey (Petromyzon marinus) Parasite-host Interactions》**
- **假设**：$F = 0.41, h = 0.0548$ 引用：http://www.glfc.org/pubs/SpecialPubs/Sp89_1.pdf
- **假设**：$\lambda_i$：对第i种宿主的有效搜索率主要由distance swum（$S$）决定，而$S_i = 7.884L_i$ The constant 7.884 (km/mm attack season) assumes an average swimming speed of 0.61 body lengths/s 引用《Sea Lamprey (Petromyzon marinus) Parasite-host Interactions in the Great Lakes》Bence2003
#### 加入各种假设后，模型简化为
$$
a_i = \frac{F S_i N_i}
           {1 + \sum_j S_j N_j h}
$$

$$
\begin{align*}
&M_i：攻击瞬间死亡率（年死亡率）\\
&A_i：每个宿主平均受攻击次数（年受攻击次数）\\
&P_s：宿主每次受攻击生存率
\end{align*}
$$

$$
M_i = (1 - P_s)A_i
$$

- **假设**：$P_s=0.25$ 引用：https://cdnsciencepub.com/doi/abs/10.1139/f80-243

$$
\begin{align*}
&A_i：每个宿主平均受攻击次数（年受攻击次数）\\
&L：七鳃鳗数量（密度）\\
&N_i：第i种宿主的密度
\end{align*}
$$

$$
A_i = \frac{a_iL}{N_i}
$$

**这样，就能从七鳃鳗密度、宿主数量密度、宿主长度，计算出某鱼类物种受七鳃鳗攻击的年死亡率（相对）**