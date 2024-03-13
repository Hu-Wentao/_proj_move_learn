module MyPackage::Module1 {

    #[test]
    fun test() {
        // must defin at first line, only effeict for this fun block
        use std::debug;

        let a = 5;
        print(&a);

        debug::print(&a);
    }

    // if define at end of module.block, also work
    #[test_only]
    use aptos_std::debug::print;
}