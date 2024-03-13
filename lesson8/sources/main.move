module 0x42::Demo {
    use std::string::utf8;
    use std::debug::print;

    fun test_if() {
        let a = 5;
        if (a == 5) {
            print(&utf8(b"a == 5"));
        }else {
            print(&utf8(b"666"));
        }
    }

    #[test]
    fun test_while() {
        let a = 10;
        while (a > 0) {
            if (a == 9) {
                a = a - 3;
                continue
            };
            print(&a);
            a = a - 1;
            if (a == 2) {
                break
            }
        }
    }

    #[test]
    fun test_loop() {
        let a = 5;
        loop {
            a = a - 1;
            if (a == 3) {
                a = a - 1;
                continue
            };
            print(&a);
            if (a == 0) {
                break
            }
        }
    }
}