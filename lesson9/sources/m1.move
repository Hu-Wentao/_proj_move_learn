module MyPackage::M1{
    friend MyPackage::M2;
    fun foo():u64{
        666
    }

    public fun foo2():u64{
        777
    }

    public(friend) fun foo3():u64{
        888
    }

}