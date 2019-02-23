version 15
adopath + ../../ado

program main
    auto_example
end

program auto_example 
    sysuse auto, clear 

    clonevar by_group = rep78
    replace by_group = 2 if missing(by_group)

    leave_one_out_median mpg, gen(mpg_loom)
    leave_one_out_median mpg, by(by_group) gen(mpg_loom_by_group)

    sum mpg_loom*
end

* EXECUTE
main
