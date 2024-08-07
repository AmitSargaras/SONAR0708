$data_file = @ARGV[0];
$file_type = @ARGV[1];
$fmt_type = @ARGV[2];

open(DATA_INFILE, $data_file);
if (! -e DATA_INFILE) {
	print "[error] [$data_file] not found!\n";
	exit(0);
}

if ((lc($file_type) ne 'sh') && (lc($file_type) ne 'cmd')) {
	print "[error] Usage: perl gather_info.pl [file_name] [sh|cmd] [csv|fxln]";
	exit(0);
}

if ( length($fmt_type) > 0 && (lc($fmt_type) ne 'csv') ) {
	print "[error] Usage: perl gather_info.pl [file_name] [sh|cmd] [csv|fxln]";
	exit(0);
}

#########################
# Initialize Lines Array
#
#########################

@lines = <DATA_INFILE>;
$num = @lines;
$end = $num - 1;
print "[info] Num of lines: [$num]\n";

##############################
# Getting header and trailer
#
##############################
$rec_type_hdr = substr($lines[0], 0, 1);
$rec_type_tlr = 'NA';

$found=0;
for ($i=$end; ($i>0) && ($found==0) ; $i--) {
	$rec_type_tlr = substr($lines[$i], 0, 1);
	if ($rec_type_tlr eq 'T') {
		$end=$i;
		$found=1;
	}
}

##############################
# Checking header and trailer
#
##############################
if (($rec_type_hdr ne 'H') || ($rec_type_tlr ne 'T')) {
	print "[error] There is not record type of [H] or [T]\n";
	exit(0);
}

########################
# Getting Header values
#
########################
if ( (lc($fmt_type) eq 'csv') ) {
	@h_array = split(/,/, $lines[0]);
	$rec_interface_id = $h_array[3];
	$rec_system_id = $h_array[5];
} else {
	@h_array = split(' ', $lines[0]);
	$num_of_array = @h_array;
	$rec_interface_id = $h_array[1];
	$rec_system_id = $h_array[2];
}
print "[info] System Id: [$rec_system_id] Interface Id: [$rec_interface_id]\n";

########################
# Getting Trailer Count
#
########################
if ( (lc($fmt_type) eq 'csv') ) {
	@t_array = split(/,/, $lines[$end]);
	$count = $t_array[1];
} else {
	$count = substr($lines[$end], 1, 10) * 1;
}
$actual_count = $end - 1;
print "[info] Records Count stated: [$count]\n";

#################
# Checking Count
#
#################
if ($count == $actual_count) {
	print "[info] Number of Records is correct.\n";
	
	$go_data_file = $data_file . ".go";

	open(GO_FILE,">$go_data_file") || die("Cannot Open File: [$go_data_file]");
	print GO_FILE "go";
	close(GO_FILE);	
} else {
	print "[error] Number of Records is not correct. Count Stated: [$count] vs Actual Count: [$actual_count]\n";
	exit(0);	
}

#######################
# Preparing Hash Total
#
#######################

if (lc($fmt_type) eq 'csv') {
	@t_array = split(/,/, $lines[$end]);
	$num_t_array = @t_array;
	if ($num_t_array > 2) {
		$hash_total = $t_array[2];
	}
} else {
	$hash_total = substr($lines[$end], 11);
}

$idx_first_space = index($hash_total, ' ');
if ($idx_first_space > 0) {
	$hash_total = substr($hash_total, 0, $idx_first_space);
}

$hash_total =~ s/\D//g;
if (length($hash_total) != 0) {
	
	$hash_total = $hash_total * 1;
	print "[info] Hash Total from HOST: [$hash_total]\n";

	$hash_total_data_file = $data_file . ".ht";

	open(HT_FILE,">$hash_total_data_file") || die("Cannot Open File: [$hash_total_data_file]");
	print HT_FILE "$hash_total";
	close(HT_FILE);
}

close(DATA_INFILE);

##############################
# Striping Header and Trailer
# Create Lock file first
#
##############################

$lockfile = "lock_the_file.loc";
while (-e $lockfile) {
sleep 2;
}
open(LOCK,">$lockfile") || die ("Cannot open lock file!\n");
close(LOCK);

open(DATA_OUT,">$data_file") || die("Cannot Open File: [$data_file]");
for ($i=1; $i<$end; $i++) {
print DATA_OUT $lines[$i];
}
close(DATA_OUT);

unlink($lockfile);