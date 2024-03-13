# Move 对象 Object

## 对象分类

1. 可删除对象 Object

2. 不可删除对象
   2.1 命名对象 NamedObject
    - 通过传入seed, 让signer与seed创建一一对应的Object地址; addr = hash(signer, seed) 
   2.2 粘性对象 StickyObject
    - 与signer关联的Object; addr = hash(signer, random)
