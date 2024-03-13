module 0x42::VectorDemo {

    #[test_only]
    use std::vector;
    #[test_only]
    use aptos_std::debug::print;

    const ARR: vector<u64> = vector[1, 4, 455, 235, 56, 16, 666,999];

    #[test]
    fun test_arr() {
        print(&ARR);
    }

    #[test]
    fun test_empty_vector(){
        let is_empty = vector::is_empty(&ARR);
        print(&is_empty);
    }
    #[test]
    fun test_vec_len(){
        let len = vector::length(&ARR);
        print(&len);
    }

    #[test]
    fun test_borrow(){
        let br = vector::borrow(&ARR,2);
        print(br);
    }

    #[test]
    fun test_borrow_mut(){
        let arr_m = vector[1,3,999,5,6,76];
        let mu = vector::borrow_mut(&mut arr_m, 2);
        print(mu);
        *mu = 666;
        print(mu);
    }
    #[test]
    fun test_contain(){
        let n = 42;
        let n2 = 666;
        let ct = vector::contains(&ARR, &n);
        print(&ct);
        let ct2 = vector::contains(&ARR,&n2);
        print(&ct2);
    }
    #[test]
    fun test_index_of(){
        let n = 666;
        let n2 = 999;
        let (idx, e) = vector::index_of(&ARR, &n);
        let (idx2, e2) = vector::index_of(&ARR, &n2);
        print(&idx);
        print(&e);
        print(&idx2);
        print(&e2);
    }


}