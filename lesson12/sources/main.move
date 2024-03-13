module 0x5a739dba812d7584da951105189238e4ad338d976a3270009e9c454331b0fd1c::MyObject {
    use std::signer;
    use aptos_framework::object;
    use aptos_framework::object::Object;

    struct MyStruct has key {
        age: u8
    }

    struct YourStruct has key {
        sex: bool
    }

    struct ExtendRef has key {
        extend_ref: object::ExtendRef
    }

    struct TransferRef has key {
        transfer_ref: object::TransferRef
    }

    struct DeleteRef has key {
        delete_ref: object::DeleteRef
    }

    entry fun create(caller: &signer) {
        let addr = signer::address_of(caller);
        let obj_ref = object::create_object(addr); // deletable object
        let obj_signer = object::generate_signer(&obj_ref);

        let ext_ref = object::generate_extend_ref(&obj_ref);
        let trs_ref = object::generate_transfer_ref(&obj_ref);
        let del_ref = object::generate_delete_ref(&obj_ref);

        // create new object(MyStruct) to obj_signer address
        move_to(&obj_signer, MyStruct {
            age: 123
        });

        move_to(&obj_signer, ExtendRef {
            extend_ref: ext_ref
        });
        move_to(&obj_signer, TransferRef {
            transfer_ref: trs_ref
        });
        move_to(&obj_signer, DeleteRef {
            delete_ref: del_ref
        });
    }

    entry fun add_struct(obj: Object<MyStruct>) acquires ExtendRef {
        let obj_addr = object::object_address(&obj);
        let ext_ref = &borrow_global<ExtendRef>(obj_addr).extend_ref;
        let obj_singer = object::generate_signer_for_extending(ext_ref);
        move_to(&obj_singer, YourStruct {
            sex: true,
        })
    }

    entry fun transfer(caller: &signer, obj: Object<MyStruct>, to: address) {
        object::transfer(caller, obj, to);
    }

    entry fun switch_transfer(obj: Object<MyStruct>) acquires TransferRef {
        let addr = object::object_address(&obj);
        let obj_transfer_ref = &borrow_global<TransferRef>(addr).transfer_ref;
        if (object::ungated_transfer_allowed(obj)) {
            object::disable_ungated_transfer(obj_transfer_ref);
        }else {
            object::enable_ungated_transfer(obj_transfer_ref);
        }
    }

    entry fun update(_caller: &signer, obj_addr: address, age: u8) acquires MyStruct {
        let ref = borrow_global_mut<MyStruct>(obj_addr);
        ref.age = age;
    }

    entry fun delete(_caller: &signer, obj: Object<MyStruct>) acquires DeleteRef {
        let obj_addr = object::object_address(&obj);
        // let ref = borrow_global<DeleteRef>(obj_addr);
        let DeleteRef {
            delete_ref
        } = move_from<DeleteRef>(obj_addr);

        object::delete(delete_ref);
    }

    #[view]
    public fun query(obj_addr: address): u8 acquires MyStruct {
        let ref = borrow_global<MyStruct>(obj_addr);
        ref.age
    }

    #[view]
    public fun owner(obj: Object<MyStruct>): address {
        object::owner(obj)
    }
}