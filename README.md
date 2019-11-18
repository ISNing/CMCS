# Cloud Mincraft Server
### 分支-CMCS MBDS-Included分支

### Branch-CMCS with MBDS.
**便捷的**，~~白恰的~~Minecraft Server.

> 默认：https://cmcs.sf2005.ml

> Github: https://github.com/SF2005/CMCS

> 腾讯开发者平台: https://dev.tencent.com/u/SF2005/p/CMCS/git

###部署方案

腾讯与Coding为我们提供了一款云端IDE，名为'[Cloud Studio](https://studio.dev.tencent.com)',它具有Linux终端调试功能，甚至开放了root权限，也就是说，它可以被作为一台VPS使用。
* 重点在于：它，是可以被 
### ~~白嫖~~
的。

> Freeeeeeeeeeeeeeeeeeeeeeeeeeeeee!
>>>>>>>>>>>Tencent YES!!!!

所以，我们可以通过一些手法将它变成一台服务器，作为一台免费的Minecraft服务器。

## 安装
### 准备
- 1. 打开 [Sakura Frp](httsp://natfrp.com/) 并注册
- 2. 登录后选择左侧映射列表，选择`Minecraft`，点击随机端口并添加
- 3. 再次选择Minecraft，修改本地端口为`19132`，点击随机端口并添加
- 4. 点击左侧仪表盘，拉到服务器地址 不要关，候着~~下锅~~
- 5. 打开 [Sunny Ngrok](http://ngrok.cc) 并注册
- 6. 登陆后点击左侧隧道管理—开通隧道—右侧选择`香港Ngrok免费服务器`，立刻购买—确定
- 7. 依次点击/填写 http—隧道名称—前置域名(面板地址为[前置域名(只可填写一次)].[服务器地址(不可修改)])
- 8. 点击左侧隧道管理—隧道管理 不要关，候着~~下锅~~
### Cloud Studio安装、配置
- 1. 打开 [Cloud Studio](https://studio.dev.tencent.com/) 。
- 2. 登录/注册账号
- 3. 选择新建工作空间
- 4. 输入项目名，选择从模板创建
- 5. 选择 Blank 模板
- 6. 点击创建
- 7. 进入刚才创建的项目/工作空间
- 8. 在终端依次输入以下命令并回车

`rm -rf *`

`rm -rf .*`

`git clone -b master --depth=1 https://git.dev.tencent.com/SF2005/CMCS.git .`(不要落下后面的.)
- 10. 等待完成操作，在下方终端中输入`./gettingReady.sh`并回车，按提示进行
- 11. 自行检查是否报错并寻找解决方法(正常不会)
- 12. 打开左侧文件树中`CMCS.config`，按照提示与之前准备~~下锅(停不下来))~~的页面信息填入。带*项为必填项。建议填写`sc`与`sc1`项。
>注意：sid填写请在Sakura Frp 服务器地址处查看，服务器与ID对应如下

ID|域名
:-:|:-:
  1|     宁波电信
  2|     宁波联通
  3|     徐州电信
  4|     北京 BGP
  5|     宿迁电信
  6|     罗马尼亚
  7|     日本千兆
  8|     台湾百兆
  9|     香港线路1
  10|    江苏镇江
  12|    宿迁联通
  13|    香港线路2
  30|    洛杉矶01
  31|    洛杉矶02
  32|    洛杉矶03
  33|    洛杉矶04
  34|    洛杉矶05
  38|    新加坡01
  39|    蒙特利尔
  43|    香港移动
  45|    美国纽约1
  46|    美国纽约2
  47|    日本长野
- 13. 在终端输入`./Start.sh`并回车
- 14. 打开你在Sunny Ngrok注册隧道时的域名，你就可以看到MCSManager面板了，具体操作前往[MSCManager - 常见问题](https://github.com/Suwings/MCSManager#%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98)

### 其他
自行调整服务器配置、存档等

## 使用
- 启动/重启命令：`./Start.sh`，在面板中启动服务器
- 停机：请先在网页面板中关闭服务器。

#### 之后
再执行`./Stop.sh`，否则可能造成回档。
- 面板地址:`Sunny Ngrok 隧道管理—赠送域名`(z)
- Java 服务器地址:`[SakuraFrp服务器对应地址]:[映射列表—隧道列表中本地端口25565对应远程端口]`
- Bedrock 服务器地址:`[SakuraFrp服务器对应地址]:[映射列表—隧道列表中本地端口19132对应远程端口]`

### Logs
- 请利用log自行查错，善用搜索
服务器log:`见网页面板`
Skura Frp,Ngrok,MCSM log:`见screen`

~~[帮助文档](WIKI)~~ ~~(木有~~~~~~)~~

## 感谢
在本项目中，我们使用到了：

>[Mohist](https://github.com/PFCraft/Mohist) ······························作为Java服务端

>[Minecraft Bedrock Dedicated Server](https://www.minecraft.net/zh-hans/download/server/bedrock/) ······························ 作为Bedrock服务端

>[Nukkit](https://github.com/NukkitX/Nukkit) ······························ 作为Bedrock服务端(已弃用)

>[MCSManager](https://github.com/Suwings/MCSManager) ······························ 作为Minecraft 服务器面版

>[Sakura Frp](https://natfrp.com)
······························ 进行内网穿透(TCP,UDP 服务器穿透)

>[Sunny Ngrok](http://ngrok.cc)
······························ 进行内网穿透(HTTP 远程面板穿透)


## 常见问题
* Q:为什么不都使用Sakura Frp或Sunny Ngrok进行内网穿透？
>A:因为(据说)Frp 更稳定~~（更好看）~~，但Sakura Frp并没有像Sunny Ngrok 一样分配免费的二级域名，这就导致使用它进行HTTP穿透就必须要购买域名，而国外的Freenom——地球上唯一的免费顶级域名提供商又极其 `烂` ，基本是注册不了的状态，还经常回收域名。但购买域名又违背了我们 ~~白嫖~~ 的理念，所以，我们宁愿麻烦一点点，也不要花一分钱。
* Q:为什么有时会出现Killed.或其他看不懂的数字，服务器就关了？
>A:使用内存过多。可能是被平台的什么机制杀了。
>
>注意，平台是有内存限制的(大概)，最高可使用2G，也就是2048M。

## 发布历史
### Mohist - Minecraft Bedrock Dedicated Server 核心版本
#### 1.2.1 - 2019.10.3
通过更新Ubuntu至最新LTS解决MBDS依赖问题。
Readme 完善。
gettingReady.sh 脚本完善。

#### 1.2.0 - 2019.9.8
已弃用Nukkit核心，转投Minecraft Bedrock Dedicated Server。

### Mohist - Nukkit 核心版本
#### 1.1.2 - 2019.9.1
重大错误修复。

#### 仓库已重置 - 2019.9.1
清理包含过大文件的历史Commits，以便推送至Github.

#### 1.1.01 - 2019.8.29
经测试可以使用./Start.sh一键启动(Powered by screen)。

#### v1.0.10
经测试可以使用。

#### v1.0.01
Readme完善。

#### v1.0.0
嘿！~~~~ ~~白嫖~~成功！
Readme完善。
安装方法简化。

#### v0.0.01
- 第一次同步，使用繁琐。