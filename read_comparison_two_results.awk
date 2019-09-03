BEGIN{
    FS = " "

    TOTAL_EVENT = 50
    
    for(idx=0; idx<TOTAL_EVENT; idx++) {
	array_AA_evt2flag[idx] = 0
	array_BB_evt2flag[idx] = 0
    }

    #
    # 21 wrong light
    # 22 through muon
    # 23 stop muon
    # 24 others
    #
    # 11 numu
    # 12 nue
    # 13 nu-nc
    #

    wrl = 21
    tgm = 22
    stm = 23
    ooo = 24
    
    numu = 11
    nue  = 12
    nunc = 13

    str_flag[wrl] = "wrl"
    str_flag[tgm] = "tgm"
    str_flag[stm] = "stm"
    str_flag[ooo] = "ooo"
    str_flag[numu] = "numu"
    str_flag[nue] = "nue"
    str_flag[nunc] = "nunc"
    str_flag[0] = "NULL"

    
    stat_AA_total     = 0
    stat_AA_flag[wrl] = 0
    stat_AA_flag[tgm] = 0
    stat_AA_flag[stm] = 0
    stat_AA_flag[ooo] = 0
    stat_AA_flag[numu] = 0
    stat_AA_flag[nue]  = 0
    stat_AA_flag[nunc] = 0

    
    stat_BB_total     = 0
    stat_BB_flag[wrl] = 0
    stat_BB_flag[tgm] = 0
    stat_BB_flag[stm] = 0
    stat_BB_flag[ooo] = 0
    stat_BB_flag[numu] = 0
    stat_BB_flag[nue]  = 0
    stat_BB_flag[nunc] = 0
    
}

{
    str_length = length($5)
    event_id = substr($5, 1, str_length-1)
    flag_type = $2

    if( FILENAME=="data_extbnb/original_London_first50" ) {
	array_AA_evt2flag[event_id] = flag_type
    }
    else {
	array_BB_evt2flag[event_id] = flag_type
    }
    
}

END{

    ############################################## AA
    
    for(idx=0; idx<TOTAL_EVENT; idx++) {
	flag_user = array_AA_evt2flag[idx]
	if( flag_user!=0 ) {
	    stat_AA_total++
	    stat_AA_flag[flag_user]++
	}
    }
    print "\n Results from A: "
    format_AA_strr = "%5s %5s %5s %5s %5s %5s %5s %5s\n"
    printf(format_AA_strr, "TOT", "wrl", "tgm", "stm", "ooo", "numu", "nue", "nunc")
    format_AA_stat = "%5d %5d %5d %5d %5d %5d %5d %5d\n"
    printf(format_AA_stat,
	   stat_AA_total,
	   stat_AA_flag[wrl],
	   stat_AA_flag[tgm],
	   stat_AA_flag[stm],
	   stat_AA_flag[ooo],
	   stat_AA_flag[numu],
	   stat_AA_flag[nue],
	   stat_AA_flag[nunc])
    format_AA_statREL = "%5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f\n\n"
    printf(format_AA_statREL,
	   stat_AA_total*100./stat_AA_total,
	   stat_AA_flag[wrl]*100./stat_AA_total,
	   stat_AA_flag[tgm]*100./stat_AA_total,
	   stat_AA_flag[stm]*100./stat_AA_total,
	   stat_AA_flag[ooo]*100./stat_AA_total,
	   stat_AA_flag[numu]*100./stat_AA_total,
	   stat_AA_flag[nue]*100./stat_AA_total,
	   stat_AA_flag[nunc]*100./stat_AA_total)

    ############################################## BB
    
    for(idx=0; idx<TOTAL_EVENT; idx++) {
	flag_user = array_BB_evt2flag[idx]
	if( flag_user!=0 ) {
	    stat_BB_total++
	    stat_BB_flag[flag_user]++
	}
    }
    print "\n Results from B: "
    format_BB_strr = "%5s %5s %5s %5s %5s %5s %5s %5s\n"
    printf(format_BB_strr, "TOT", "wrl", "tgm", "stm", "ooo", "numu", "nue", "nunc")
    format_BB_stat = "%5d %5d %5d %5d %5d %5d %5d %5d\n"
    printf(format_BB_stat,
	   stat_BB_total,
	   stat_BB_flag[wrl],
	   stat_BB_flag[tgm],
	   stat_BB_flag[stm],
	   stat_BB_flag[ooo],
	   stat_BB_flag[numu],
	   stat_BB_flag[nue],
	   stat_BB_flag[nunc])
    format_BB_statREL = "%5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f %5.1f\n\n"
    printf(format_BB_statREL,
	   stat_BB_total*100./stat_BB_total,
	   stat_BB_flag[wrl]*100./stat_BB_total,
	   stat_BB_flag[tgm]*100./stat_BB_total,
	   stat_BB_flag[stm]*100./stat_BB_total,
	   stat_BB_flag[ooo]*100./stat_BB_total,
	   stat_BB_flag[numu]*100./stat_BB_total,
	   stat_BB_flag[nue]*100./stat_BB_total,
	   stat_BB_flag[nunc]*100./stat_BB_total)

    ############################################## comparison

    stat_common_total     = 0
    stat_common_flag[wrl] = 0
    stat_common_flag[tgm] = 0
    stat_common_flag[stm] = 0
    stat_common_flag[ooo] = 0
    stat_common_flag[numu] = 0
    stat_common_flag[nue]  = 0
    stat_common_flag[nunc] = 0

    for(idx=0; idx<TOTAL_EVENT; idx++) {
	flag_user_AA = array_AA_evt2flag[idx]
	flag_user_BB = array_BB_evt2flag[idx]
	if( flag_user_AA!=0 ) {
	    if( flag_user_AA==flag_user_BB ) {
		stat_common_total++
		if( flag_user_AA==wrl )  stat_common_flag[wrl]++
		if( flag_user_AA==tgm )  stat_common_flag[tgm]++
		if( flag_user_AA==stm )  stat_common_flag[stm]++
		if( flag_user_AA==ooo )  stat_common_flag[ooo]++
		if( flag_user_AA==numu ) stat_common_flag[numu]++
		if( flag_user_AA==nue )  stat_common_flag[nue]++
		if( flag_user_AA==nunc ) stat_common_flag[nunc]++		
	    }
	}
    }

    printf "\n Common between A and B\n"
    format_CMP_strr = "%5s %5s %5s %5s %5s %5s %5s %5s\n"
    printf(format_CMP_strr, "TOT", "wrl", "tgm", "stm", "ooo", "numu", "nue", "nunc")
    format_CMP_stat = "%5d %5d %5d %5d %5d %5d %5d %5d\n\n"
    printf(format_CMP_stat,
	   stat_common_total,
	   stat_common_flag[wrl],
	   stat_common_flag[tgm],
	   stat_common_flag[stm],
	   stat_common_flag[ooo],
	   stat_common_flag[numu],
	   stat_common_flag[nue],
	   stat_common_flag[nunc])  

    #############################

    type_comparison = nunc
    print "\n Differences: " str_flag[type_comparison]
    
    for(idx=0; idx<TOTAL_EVENT; idx++) {
    	flag_user_AA = array_AA_evt2flag[idx]
    	flag_user_BB = array_BB_evt2flag[idx]

    	view_nominal = flag_user_AA
    	view_cmp = flag_user_BB
	
    	if( view_nominal!=0 ) {
    	    if( view_nominal!=view_cmp ) {
    		if( view_nominal==type_comparison ) {
    		    format = "Event %3d, Nominal/Cmp %2d %2d, %s %s\n"
    		    printf(format, idx, view_nominal, view_cmp, str_flag[view_nominal], str_flag[view_cmp])
    		}
    	    }
    	}
    }
    print ""



    

    
}

