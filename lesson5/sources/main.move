module 0x42::VectorDemo2 {
    #[test_only]
    use std::vector;
    #[test_only]
    use aptos_std::debug::print;

    #[test]
    fun test_vec_append() {
        let vec = vector[1, 3, 5];
        vector::push_back(&mut vec, 666);
        print(&vec);
        let ve2 = vector[6, 7, 8];
        vector::append(&mut vec, ve2);
        print(&vec)
    }

    #[test]
    fun test_reverse_apped() {
        let v1 = vector[1, 3, 5];
        let v2 = vector[2, 4, 6];
        vector::reverse_append(&mut v1, v2);
        print(&v1);
    }

    #[test]
    fun test_push_back() {
        let v1 = vector[1, 3, 45];
        vector::push_back(&mut v1, 999);
        print(&v1);
    }

    #[test]
    fun test_swap() {
        let v1 = vector[1, 2, 3, 4, 5];
        vector::swap(&mut v1, 1, 2);
        print(&v1);
    }

    #[test]
    fun test_reverse() {
        let v1 = vector[1, 2, 3, 45];
        vector::reverse(&mut v1, );
        print(&v1);
    }

    #[test]
    fun test_insert() {
        let v1 = vector[1, 2, 3, 45];
        vector::insert(&mut v1, 1, 666);
        print(&v1);
    }

    #[test]
    fun test_remove() {
        let v1 = vector[1, 23, 4, 5];
        vector::remove(&mut v1, 2);
        print(&v1);
    }

    #[test]
    fun test_swap_remove() {
        let vec1 = vector[1, 2, 3, 4];
        vector::swap_remove(&mut vec1, 2);
        print(&vec1);
    }

    #[test]
    fun test_trim() {
        let v1 = vector[123, 4, 5, 5];
        // cut origin vector(v1), v2 is new one
        let v2 = vector::trim(&mut v1, 2);
        print(&v1);
        print(&v2);
    }
    #[test]
    fun test_trim_reverse(){
        let v1 = vector[1,23,4,666];
        // cut origin vector(v1), than reverse new vector(v2)
        let v2 = vector::trim_reverse(&mut v1, 2);
        print(&v1);
        print(&v2);
    }
}