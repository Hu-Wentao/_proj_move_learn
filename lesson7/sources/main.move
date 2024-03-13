module 0x42::Demo {
    use std::string::String;
    #[test_only]
    use std::string::utf8;
    #[test_only]
    use aptos_std::debug::print;

    // must has drop
    struct Person has drop {
        name: String,
        age: u32
    }

    #[test]
    fun test() {
        let p = Person { name: utf8(b"Bob"), age: 12 };
        let Person { name: _, age: a } = &mut p;
        *a = 42;
        print(&p.name);
        print(&p.age);
    }

    struct PersonCopy has copy, drop {
        s: bool,
        a: u32
    }

    #[test]
    fun test2() {
        let p = PersonCopy { s: false, a: 12 };
        let p2 = copy p;
        p2.a = 42;
        print(&p.a);
        print(&p2.a);
    }

    struct School has key, drop {
        stu: Student,
    }

    struct Student has store, drop {
        s: bool,
        a: u32
    }

    #[test]
    fun test3() {
        let s1 = Student { s: false, a: 12 };
        let sch = School { stu: s1 };
        print(&sch.stu.a);
    }
}