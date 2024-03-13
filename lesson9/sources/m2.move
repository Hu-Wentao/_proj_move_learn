module MyPackage::M2{

    #[test_only]
    use aptos_std::debug::print;

    #[test]
    fun test_foo2(){
        // foo can not use(not public)
        use MyPackage::M1::foo2;

        let a = foo2();
        print(&a);
    }
    #[test]
    fun test_foo3(){
        // foo can not use(not public)
        use MyPackage::M1::foo3;

        let a = foo3();
        print(&a);
    }
}