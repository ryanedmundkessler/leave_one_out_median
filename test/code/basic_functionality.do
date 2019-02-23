version 15
adopath + ../../ado

program main
    test_odd_number_obs
    test_even_number_obs
    test_odd_number_obs_by_group
    test_odd_number_even_by_group
end

program test_odd_number_obs
    matrix test_col = (1 \ 2 \ 3 \ 4 \ 5)
    matrix correct_looms = (3.5 \ 3.5 \ 3 \ 2.5 \ 2.5)  
    test_loom, test_col(test_col) correct_looms(correct_looms)

    matrix test_col = (1 \ 3 \ 3 \ 4 \ 5)
    matrix correct_looms = (3.5 \ 3.5 \ 3.5 \ 3 \ 3)    
    test_loom, test_col(test_col) correct_looms(correct_looms)

    matrix test_col = (1 \ 2 \ 3 \ 3 \ 5)
    matrix correct_looms = (3 \ 3 \ 2.5 \ 2.5 \ 2.5)    
    test_loom, test_col(test_col) correct_looms(correct_looms)

    matrix test_col = (1 \ 3 \ 3 \ 3 \ 5)
    matrix correct_looms = (3 \ 3 \ 3 \ 3 \ 3)  
    test_loom, test_col(test_col) correct_looms(correct_looms)

    matrix test_col = (1 \ 2 \ . \ 4 \ 5)
    matrix correct_looms = (4 \ 4 \ 3 \ 2 \ 2)  
    test_loom, test_col(test_col) correct_looms(correct_looms)

    matrix test_col = (1 \ 2 \ 0 \ 4 \ 5)
    matrix correct_looms = (3 \ 2.5 \ 3 \ 1.5 \ 1.5)    
    test_loom, test_col(test_col) correct_looms(correct_looms)

    matrix test_col = (1 \ 2 \ -0.5 \ 4 \ 5)
    matrix correct_looms = (3 \ 2.5 \ 3 \ 1.5 \ 1.5)
    test_loom, test_col(test_col) correct_looms(correct_looms)

    matrix test_col = (5 \ 3 \ 4 \ 1 \ 2)
    matrix correct_looms = (2.5 \ 3 \ 2.5 \ 3.5 \ 3.5)  
    test_loom, test_col(test_col) correct_looms(correct_looms)
end

program test_odd_number_obs_by_group
    qui set obs 10
    qui gen groupvar = 1 if _n <= 5
    qui replace groupvar = 2 if _n > 5
    
    matrix test_col1 = (1 \ 2 \ 3 \ 4 \ 5)
    matrix test_col2 = (1 \ 2 \ 3 \ 4 \ 5)
    matrix correct_looms1 = (3.5 \ 3.5 \ 3 \ 2.5 \ 2.5) 
    matrix correct_looms2 = (3.5 \ 3.5 \ 3 \ 2.5 \ 2.5) 
    matrix test_col = (test_col1 \ test_col2)
    matrix correct_looms = (correct_looms1 \ correct_looms2)
    test_loom, test_col(test_col) correct_looms(correct_looms) by(groupvar)

    matrix test_col1 = (1 \ 2 \ . \ 4 \ 5)
    matrix test_col2 = (1 \ 2 \ 3 \ . \ 5)
    matrix correct_looms1 = (4 \ 4 \ 3 \ 2 \ 2)
    matrix correct_looms2 = (3 \ 3 \ 2 \ 2.5 \ 2)
    matrix test_col = (test_col1 \ test_col2)
    matrix correct_looms = (correct_looms1 \ correct_looms2)
    test_loom, test_col(test_col) correct_looms(correct_looms) by(groupvar)

    matrix test_col1 = (5 \ 3 \ 4 \ 1 \ 2)
    matrix test_col2 = (1 \ 3 \ 3 \ 3 \ 5)
    matrix correct_looms1 = (2.5 \ 3 \ 2.5 \ 3.5 \ 3.5) 
    matrix correct_looms2 = (3 \ 3 \ 3 \ 3 \ 3) 
    matrix test_col = (test_col1 \ test_col2)
    matrix correct_looms = (correct_looms1 \ correct_looms2)
    test_loom, test_col(test_col) correct_looms(correct_looms) by(groupvar)

    matrix test_col1 = (1 \ 3 \ 3 \ 4 \ 5)
    matrix test_col2 = (1 \ 2 \ 3 \ 3 \ 5)
    matrix correct_looms1 = (3.5 \ 3.5 \ 3.5 \ 3 \ 3)   
    matrix correct_looms2 = (3 \ 3 \ 2.5 \ 2.5 \ 2.5)   
    matrix test_col = (test_col1 \ test_col2)
    matrix correct_looms = (correct_looms1 \ correct_looms2)
    test_loom, test_col(test_col) correct_looms(correct_looms) by(groupvar)

    drop groupvar
end

program test_even_number_obs
    matrix test_col = (1 \ 2 \ 3 \ 4 \ 5 \ 6)
    matrix correct_looms = (4 \ 4 \ 4 \ 3 \ 3 \ 3)  
    test_loom, test_col(test_col) correct_looms(correct_looms)

    matrix test_col = (1 \ 2 \ . \ 4 \ . \ 6)
    matrix correct_looms = (4 \ 4 \ 3 \ 2 \ 3 \ 2)  
    test_loom, test_col(test_col) correct_looms(correct_looms)

    matrix test_col = (1 \ 2 \ 3 \ 3 \ 5 \ 6)
    matrix correct_looms = (3 \ 3 \ 3 \ 3 \ 3 \ 3)
    test_loom, test_col(test_col) correct_looms(correct_looms)

    matrix test_col = (1 \ 2 \ 2 \ 4 \ 5 \ 6)
    matrix correct_looms = (4 \ 4 \ 4 \ 2 \ 2 \ 2)  
    test_loom, test_col(test_col) correct_looms(correct_looms)

    matrix test_col = (1 \ 2 \ 3 \ 4 \ 4 \ 6)
    matrix correct_looms = (4 \ 4 \ 4 \ 3 \ 3 \ 3)
    test_loom, test_col(test_col) correct_looms(correct_looms)

    matrix test_col = (6 \ 4 \ 5 \ 2 \ 1 \ 3)
    matrix correct_looms = (3 \ 3 \ 3 \ 4 \ 4 \ 4)
    test_loom, test_col(test_col) correct_looms(correct_looms)
end

program test_odd_number_even_by_group
    qui set obs 12
    qui gen groupvar = 1 if _n < 7
    qui replace groupvar = 2 if _n >= 7
    
    matrix test_col1 = (1 \ 2 \ . \ 4 \ . \ 6)
    matrix test_col2 = (1 \ . \ 3 \ . \ 5 \ 6)
    matrix correct_looms1 = (4 \ 4 \ 3 \ 2 \ 3 \ 2) 
    matrix correct_looms2 = (5 \ 4 \ 5 \ 4 \ 3 \ 3)
    matrix test_col = (test_col1 \ test_col2)
    matrix correct_looms = (correct_looms1 \ correct_looms2)
    test_loom, test_col(test_col) correct_looms(correct_looms) by(groupvar)

    matrix test_col1 = (1 \ 2 \ 3 \ 4 \ 5 \ 6)
    matrix test_col2 = (1 \ 2 \ 3 \ 3 \ 5 \ 6)
    matrix correct_looms1 = (4 \ 4 \ 4 \ 3 \ 3 \ 3) 
    matrix correct_looms2 = (3 \ 3 \ 3 \ 3 \ 3 \ 3)
    matrix test_col = (test_col1 \ test_col2)
    matrix correct_looms = (correct_looms1 \ correct_looms2)
    test_loom, test_col(test_col) correct_looms(correct_looms) by(groupvar)

    matrix test_col1 = (6 \ 4 \ 5 \ 2 \ 1 \ 3)
    matrix test_col2 = (1 \ 2 \ 3 \ 4 \ 4 \ 6)
    matrix correct_looms1 = (3 \ 3 \ 3 \ 4 \ 4 \ 4) 
    matrix correct_looms2 = (4 \ 4 \ 4 \ 3 \ 3 \ 3)
    matrix test_col = (test_col1 \ test_col2)
    matrix correct_looms = (correct_looms1 \ correct_looms2)
    test_loom, test_col(test_col) correct_looms(correct_looms) by(groupvar)

    drop groupvar
end

program test_loom
    syntax, test_col(name) correct_looms(name) [ by(varlist) ]
    
    qui svmat test_col, n(test_col)
    qui svmat correct_looms, n(correct_looms)
    if "`by'" == "" {
        leave_one_out_median test_col, gen(calculated_looms)
    }
    else {
    leave_one_out_median test_col, gen(calculated_looms) by(`by')
    }
    assert calculated_looms == correct_looms
    drop test_col correct_looms calculated_looms
    
    di "Test passed"
end

* EXECUTE
main
