# qqwry.ipdb [![build](https://github.com/nmgliangwei/qqwry.ipdb/actions/workflows/build.yml/badge.svg)](https://github.com/nmgliangwei/qqwry.ipdb/actions/workflows/build.yml)

纯真数据库 IPIP.net 格式版，精简并匹配为国家、省、市、运营商，支持IPV4/IPV6。  
版本随上游 纯真官网 自动同步更新。

基于[metowolf/qqwry.ipdb](https://github.com/metowolf/qqwry.ipdb)改版而来，将ipdb文件放入仓库中，方便下载。

主要提供 2 种版本的 ipdb 文件：

+ 标准版（qqwry.ipdb）

+ 原版 (qqwry-raw.ipdb)

主要区别为解析出的字段不同。

## 标准版

标准版兼容所有[官方 IPDB 格式解析代码](https://www.ipip.net/product/client.html)，提供与[官方每日专业版](https://www.ipip.net/product/ip.html#ipv4city)类似的以下解析字段。

|name|info|
|:---:|---|
|`country_name`|国家名称|
|`region_name`|区域名称，中国为省份|
|`city_name`|城市名称，中国为市级|
|`district_name`|区县名称|
|`owner_domain`|拥有者域名|
|`isp_domain`|运营商名称|
|`country_code`|国家代码，ISO3166-1|
|`continent_code`|大洲编码|


|                       标准版最新数据下载地址                        |https://cdn.1008.site/gh/nmgliangwei/qqwry.ipdb@main/qqwry.ipdb|
|:----------------------------------------------------:|---|

上面为国内加速链接，即下即用，每次更新会覆盖之前的内容，如果想要某个时间段的历史数据可在 [` Release ` ](https://github.com/nmgliangwei/qqwry.ipdb/releases) 里进行查看。


## 原版

原版兼容所有[官方 IPDB 格式解析代码](https://www.ipip.net/product/client.html)，只提供和纯真格式相似的两个解析字段，后面三个字段为兼容占位使用。

|name|info|
|:---:|---|
|`country_name`|国家名称，对应纯真国家字段|
|`region_name`|区域名称，对应纯真区域字段|
|`city_name`|城市名称，空|
|`owner_domain`|拥有者域名，空|
|`isp_domain`|运营商名称，空|

|                          原版下载地址                          | https://cdn.bili33.top/gh/nmgliangwei/qqwry.ipdb@main/qqwry-raw.ipdb |
|:--------------------------------------------------------:|------------------------------------------------------------------------|

上面为国内加速链接，即下即用，每次更新会覆盖之前的内容，如果想要某个时间段的历史数据可在 [` Release ` ](https://github.com/nmgliangwei/qqwry.ipdb/releases) 里进行查看。


## 感谢

 - 特别感谢由 [metowolf/qqwry.ipdb](https://github.com/metowolf/qqwry.ipdb) 提供的基础代码
 - 感谢由 [ipdb](https://github.com/metowolf/ipdb) 提供的 IPDB 格式解析解决方案
 - 感谢由 [@ipdb/packer](https://github.com/metowolf/ipdb-packer) 提供的 IPDB 格式打包解决方案
 - 感谢文章 [IPIP.net 地址库格式分析](https://i-meto.com/ipdb-database/) 提供的格式逆向分析
 - 感谢苏卡卡的 [qqwry-mirror](https://github.com/SukkaW/qqwry-mirror) 项目提供的灵感
 - 感谢纯真网络提供的[免费离线数据库](http://www.cz88bbs.com/)，以及纯真论坛的热心网友们

