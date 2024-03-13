## init 
### init move proj
```
# 创建模板文件夹和Move.toml配置
aptos move init --name lesson1
```

### init account
```
# 生成 .aptos文件夹, 包括config.yaml 文件
aptos init
```

## proj structure
Move.toml // 项目配置
.aptos // 帐户项目配置
- config.yaml
scripts // 脚本文件, 调用模块
sources //模块文件夹, 模块及测试
tests // 测试用例

### config.yaml
private_key // 私钥
public_key // 公钥
account // 项目发布的地址
rest_url
faucet_url // 水龙头地址

### Move.toml
