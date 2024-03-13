module 0x42::Lesson3 {
    use std::string::utf8;
    #[test_only]
    use aptos_std::debug::print;

    #[test]
    fun test() {
        let num1: u8 = 42;
        print(&num1);

        let num2 = 43u8;
        print(&num2);

        let num3 = 2345u256;
        print(&num3);

        let num4 = num1 + num2;
        print(&num4);
    }

    #[test]
    fun test_bool() {
        let bol1 = false;
        let bol2 = true;
        print(&bol1);
        print(&bol2);
        let bol3 = bol1 == bol2;
        print(&bol3);
    }

    #[test]
    fun test_string() {
        let s1 = utf8(b"asdfa");
        print(&s1);
    }

    #[test]
    fun test_addr() {
        let ad1 = @0x42;     // auto fill 0
        print(&ad1);
        let ad2 = @0x0000000000045;
        print(&ad2);
    }
}