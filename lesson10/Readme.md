## 常用命令

```shell
# 从水龙头获取资金, default 账号即 Move.toml中的account
aptos account fund-with-faucet --account default

# 编译代码, 配置地址名称
aptos move compile --named-addresses hello_blockchain=default

# 测试代码
aptos move test --named-addresses hello_blockchain=default

# 发布代码到链上
aptos move publish --named-addresses hello_blockchain=default

# 通过cli测试链上代码; function-id为 <合约地址>::<模块>::<函数>, (default代表Move.toml中的address的值); args为传入函数的参数
aptos move run --function-id 'default::message::set_message' --args 'string:hello_blockchain'
```