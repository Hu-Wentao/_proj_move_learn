# 对象的配置

## Aptos Move Object Capabilities (Refs)
- ConstructorRef 单次创建对象(drop): 可以创建其他类型的Ref

- DeleteRef 删除对象(drop, store): 可删除对象
  let del_ref = object::generate_delete_ref(&obj_ref);
  SDK预设的 DeleteRef 类型对象

- ExtendedRef 扩展对象(drop, store): 对象可动态配置, 添加信的struct资源, 如文字,图像等
    let ext_ref = object::generate_extend_ref(&obj_ref);
    SDK预设的 ExtendedRef 类型对象
- TransferRef 转移对象(drop, store): 可以开启/关闭 对象转移功能
   let trs_ref = object::generate_transfer_ref(&obj_ref);
   SDK预设的 TransferRef 类型对象
- LinearRef单次转移(drop): 仅可使用一次转移 # 对象的配置

## Aptos Move Object Capabilities (Refs)
- ConstructorRef 单次创建对象(drop): 可以创建其他类型的Ref

- DeleteRef 删除对象(drop, store): 可删除对象
  let del_ref = object::generate_delete_ref(&obj_ref);
  SDK预设的 DeleteRef 类型对象

- ExtendedRef 扩展对象(drop, store): 对象可动态配置, 添加信的struct资源, 如文字,图像等
  let ext_ref = object::generate_extend_ref(&obj_ref);
  SDK预设的 ExtendedRef 类型对象
- TransferRef 转移对象(drop, store): 可以开启/关闭 对象转移功能
  let trs_ref = object::generate_transfer_ref(&obj_ref);
  SDK预设的 TransferRef 类型对象
- LinearRef单次转移(drop): 仅可使用一次转移 



