#!\bin\csh
#set kk = $1 
set cmt = $1
set stype = `cat seis_type`
foreach seis ($stype)
	echo $seis
	#echo $stype

	set dir = `pwd`
#	set cmt = 200801151752A
     
      echo "rm all the dir:"
	rm -r /tigress-hsm/lei/SOURCE/input_files/$cmt"/MEASURE_cmt_LHZ_"$seis
	rm -r /tigress-hsm/lei/SOURCE/input_files/$cmt"/MEASURE_cmt_LHR_"$seis 
	rm -r /tigress-hsm/lei/SOURCE/input_files/$cmt"/MEASURE_cmt_LHT_"$seis 
      echo "mkdir:"
	mkdir -p /tigress-hsm/lei/SOURCE/input_files/$cmt"/MEASURE_cmt_LHZ_"$seis 
	mkdir -p /tigress-hsm/lei/SOURCE/input_files/$cmt"/MEASURE_cmt_LHR_"$seis 
	mkdir -p /tigress-hsm/lei/SOURCE/input_files/$cmt"/MEASURE_cmt_LHT_"$seis 

# NOTE: First make sure that you have extracted OBSERVED and SYNTHETIC seismograms in the defined directories below. 
#       You should modify the directories of seismograms and where you would like to store the input files.

# VERTICAL COMPONENT
	set z = `ls "/tigress-hsm/lei/9s-seismograms/OBSD_final/"$cmt"_"$seis"/CMT"/*LHZ* | wc -l` 
	echo $z
	echo $z > /tigress-hsm/lei/SOURCE/input_files/$cmt"/input_cmt_LHZ_"$seis
	foreach i ("/tigress-hsm/lei/9s-seismograms/OBSD_final/"$cmt"_"$seis"/CMT/"*LHZ*)
		 set sta = `echo $i | awk 'BEGIN { FS = "CMT/" } ; { print $2 }' | awk -F. '{print ($1)}'`
   	set nw = `echo $i | awk -F. '{print ($2)}'` 
   	set nm = `echo $i | awk -F. '{print ($3)}'` 
   	set cmp = `echo $i | awk -F. '{print ($4)}'` 

   	set a = "/tigress-hsm/lei/9s-seismograms/SYNT_final/"$cmt"_"$seis"/CMT/"$sta"."$nw"."$nm"."$cmp".sem"
   	set b = "/tigress-hsm/lei/SOURCE/input_files/"$cmt"/MEASURE_cmt_"$cmp"_"$seis"/"$sta"."$nw"."$nm"."$cmp
   	echo $i >> /tigress-hsm/lei/SOURCE/input_files/$cmt"/input_cmt_"$cmp"_"$seis
   	echo $a >> /tigress-hsm/lei/SOURCE/input_files/$cmt"/input_cmt_"$cmp"_"$seis
   	echo $b >> /tigress-hsm/lei/SOURCE/input_files/$cmt"/input_cmt_"$cmp"_"$seis
	end



# RADIAL COMPONENT
	set z = `ls "/tigress-hsm/lei/9s-seismograms/OBSD_final/"$cmt"_"$seis"/CMT"/*LHR* | wc -l`
	echo $z
	echo $z > /tigress-hsm/lei/SOURCE/input_files/$cmt"/input_cmt_LHR_"$seis

	foreach i ("/tigress-hsm/lei/9s-seismograms/OBSD_final/"$cmt"_"$seis"/CMT/"*LHR*)
		set sta = `echo $i | awk 'BEGIN { FS = "CMT/" } ; { print $2 }' | awk -F. '{print ($1)}'`
	#	echo $sta
   	set nw = `echo $i | awk -F. '{print ($2)}'`
   	set nm = `echo $i | awk -F. '{print ($3)}'`
   	set cmp = `echo $i | awk -F. '{print ($4)}'`

   	set a = "/tigress-hsm/lei/9s-seismograms/SYNT_final/"$cmt"_"$seis"/CMT/"$sta"."$nw"."$nm"."$cmp".sem"
  		set b = "/tigress-hsm/lei/SOURCE/input_files/"$cmt"/MEASURE_cmt_"$cmp"_"$seis"/"$sta"."$nw"."$nm"."$cmp
   	echo $i >> /tigress-hsm/lei/SOURCE/input_files/$cmt"/input_cmt_"$cmp"_"$seis
  		echo $a >> /tigress-hsm/lei/SOURCE/input_files/$cmt"/input_cmt_"$cmp"_"$seis
   	echo $b >> /tigress-hsm/lei/SOURCE/input_files/$cmt"/input_cmt_"$cmp"_"$seis
	end



# TRANSVERSE COMPONENT

	set z = `ls "/tigress-hsm/lei/9s-seismograms/OBSD_final/"$cmt"_"$seis"/CMT"/*LHT* | wc -l`
	echo $z
	echo $z > /tigress-hsm/lei/SOURCE/input_files/$cmt"/input_cmt_LHT_"$seis

	foreach i ("/tigress-hsm/lei/9s-seismograms/OBSD_final/"$cmt"_"$seis"/CMT/"*LHT*)
   	set sta = `echo $i | awk 'BEGIN { FS = "CMT/" } ; { print $2 }' | awk -F. '{print ($1)}'`
   	set nw = `echo $i | awk -F. '{print ($2)}'`
   	set nm = `echo $i | awk -F. '{print ($3)}'`
   	set cmp = `echo $i | awk -F. '{print ($4)}'`

   	set a = "/tigress-hsm/lei/9s-seismograms/SYNT_final/"$cmt"_"$seis"/CMT/"$sta"."$nw"."$nm"."$cmp".sem"
   	set b = "/tigress-hsm/lei/SOURCE/input_files/"$cmt"/MEASURE_cmt_"$cmp"_"$seis"/"$sta"."$nw"."$nm"."$cmp
   	echo $i >> /tigress-hsm/lei/SOURCE/input_files/$cmt"/input_cmt_"$cmp"_"$seis
   	echo $a >> /tigress-hsm/lei/SOURCE/input_files/$cmt"/input_cmt_"$cmp"_"$seis
   	echo $b >> /tigress-hsm/lei/SOURCE/input_files/$cmt"/input_cmt_"$cmp"_"$seis
	end


end

#
