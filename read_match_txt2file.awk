#
# Created by Xiangpan Ji, 2019/08/15
#

BEGIN{
    FS = " "

    if( inputlist=="" || inputlist==0) {
	print 
	print "awk -v inputlist=Inputlist_Filename -f awkfile file_SelectedEvents"
	print 
	exit
    }
    
}

{
    run    = $1
    subrun = $2
    event  = $3

    # print " ---> NR FNR " NR " " FNR
    # FNR: the record number (typically the line number) in the current file 
    # NR:  the total record number
    # NF:  the total number of fields in a record

    # while( (getline line<"test.txt")>0 ) {
    # 	print line
    # }
    
    # system(  )

    awkstring = sprintf("grep %d_%d_%d %s", run, subrun, event, inputlist)
    system(awkstring)

	
}

END{

}
