$data_file = @ARGV[0];
$file_type = @ARGV[1];


print "[info] argv0 = [@ARGV[0]] !\n";
print "[info] argv1 = [@ARGV[1]] !\n";


open(DATA_INFILE, $data_file);
if (! -e DATA_INFILE) {
	print "[error] [$data_file] not found!\n";
	exit(0);
}

if ((lc($file_type) ne 'sh') && (lc($file_type) ne 'cmd')) {
	print "[error] Usage: perl gather_info.pl [file_name] [sh|cmd]";
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
# Striping the last line which is non-ascii code
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
for ($i=0; $i<$end; $i++) {
	print DATA_OUT $lines[$i];
}
close(DATA_OUT);

unlink($lockfile);