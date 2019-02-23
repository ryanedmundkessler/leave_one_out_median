program leave_one_out_median, sortpreserve 
    syntax varlist(numeric min = 1 max = 1), GENerate(name) [ by(varlist) ]
    
    local x = "`varlist'"
    if "`by'" == "" {
        tempvar by
        gen byte `by' = 1 if !missing(`x') 
    }
    
    tempvar x_min x_p50 x_max x_nobs by_val_no
    bysort `by' : egen `x_min'  = min(`x')
    bysort `by' : egen `x_p50'  = median(`x')
    bysort `by' : egen `x_max'  = max(`x') 
    bysort `by' : egen `x_nobs' = count(`x')
    bysort `by' `x' : gen `by_val_no' = _n
    
    foreach stat in min p50 max  {
        tempvar x_p50_no_`stat'
        qui bysort `by' : egen `x_p50_no_`stat'' = median(`x')                  ///
            if (`x' != `x_`stat'' | `by_val_no' > 1) 
        qui bysort `by' (`x_p50_no_`stat'') :                                   ///
            replace `x_p50_no_`stat'' = `x_p50_no_`stat''[1]
    }
    
    qui gen `generate'     = `x_p50_no_min'                                     ///
       if `x' <= `x_p50' & mod(`x_nobs', 2) == 0 & !missing(`x')
    qui replace `generate' = `x_p50_no_max'                                     ///
       if `x' >  `x_p50' & mod(`x_nobs', 2) == 0 & !missing(`x')
    qui replace `generate' = `x_p50_no_min'                                     ///
       if `x' <  `x_p50' & mod(`x_nobs', 2) != 0 & !missing(`x')
    qui replace `generate' = `x_p50_no_p50'                                     ///
        if `x' == `x_p50' & mod(`x_nobs', 2) != 0 & !missing(`x')
    qui replace `generate' = `x_p50_no_max'                                     ///
        if `x' >  `x_p50' & mod(`x_nobs', 2) != 0 & !missing(`x')
    qui replace `generate' = `x_p50' if missing(`x') 
end 