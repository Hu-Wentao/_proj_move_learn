address 0x42 {
module m1 {
    friend 0x42::m3;
    fun f1(): u64 {
        1
    }

    // can invoke by other module
    public fun f2(): u64 {
        666
    }

    // can invoke by friend module
    public(friend) fun f3(): u64 {
        999
    }
}

module m2 {
    use aptos_std::debug::print;

    fun f2() {
        print(&0x42::m1::f2())
    }
}

module m3 {
    fun f1() {
        0x42::m1::f3();
    }
}

module Demo {
    #[test_only]
    use std::signer;
    #[test_only]
    use aptos_std::debug::print;

    struct Coin has key {
        value: u64
    }

    //
    public entry fun mint(account: &signer, value: u64) {
        move_to(account, Coin { value });
    }

    #[test(account=@0x42)] // must add account
    public fun test_mint(account: &signer) acquires Coin {
        let addr = signer::address_of(account);
        mint(account, 0);
        let coin = borrow_global<Coin>(addr).value;
        print(&coin);
    }
}
}