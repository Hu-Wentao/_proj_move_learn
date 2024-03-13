module 0x42::ObjectDemo {
    use std::signer;
    use aptos_framework::object::{ConstructorRef, create_object, create_named_object, create_sticky_object};
    #[test_only]
    use aptos_std::debug::print;

    const NAME: vector<u8> = b"object_demo";

    // deletable object
    public fun createDeletableObject(caller: &signer): ConstructorRef {
        let caller_addr = signer::address_of(caller);
        let obj = create_object(caller_addr);
        obj
    }

    #[test(caller = @0x42)]
    fun test_create_object(caller: &signer) {
        let obj = createDeletableObject(caller);
        print(&obj);
    }

    // undeletable obejct
    public fun createNamedObject(caller: &signer): ConstructorRef {
        let obj = create_named_object(caller, NAME);
        obj
    }

    #[test(caller = @0x42)]
    fun test_named_obejct(caller: &signer) {
        let obj = createNamedObject(caller);
        print(&obj);
    }

    //stiky object
    public fun createStickyObject(caller: &signer): ConstructorRef {
        let addr = signer::address_of(caller);
        let obj = create_sticky_object(addr);
        obj
    }

    #[test(caller = @0x42)]
    fun test_stickeyOBject(caller: &signer) {
        let ob = createStickyObject(caller);
        print(&ob);
        let ob2 = createStickyObject(caller);
        print(&ob2);
    }
}