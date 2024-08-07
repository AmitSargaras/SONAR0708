$action = @ARGV[0];
if (lc($action) ne 'gen' && lc($action) ne 'check') {
	print "[info] [usage]: hash_total (gen|check) datafile [hashtotalfile] <col,length>";
	exit(0);
}
$param_start_idx = (lc($action) eq 'gen') ? 2 : 3 ;

$data_file = @ARGV[1];
open(DATA_FILE, $data_file);
if (! -e DATA_FILE) {
	print "[error] [$data_file] not found!\n";
	exit(0);
}
@lines = <DATA_FILE>;

if (lc($action) eq 'check') {
	$hash_total_file = @ARGV[2];
	open(HASH_TOTAL_FILE, $hash_total_file);
	if (! -e HASH_TOTAL_FILE) {
		print "[error] [$hash_total_file] not found.\n";
		exit(0);
	}
	@hash_total_line = <HASH_TOTAL_FILE>;
	$host_hash_total = $hash_total_line[0];
	close(HASH_TOTAL_FILE);
}

$grand_hash_total = 0;
foreach $idx_arg ($param_start_idx .. $#ARGV) {

	##########################################
	# Collect argument from console
	#
	# in the form of:
	# 	1,7 8,5 ...
	# 	from 1st char, take 7 chars
	# 	from 8th char, take 5 chars
	#
	# or in the form of 
	# 	1 3 4
	# 	take value in 1st, 3rd and 4th token
	#
	##########################################

	$param = $ARGV[$idx_arg];
	$idx_of_comma = index($param, ',');
	if ($idx_of_comma > 0) {
		@param_array = split(/,/, $param);
		print "[info] Calculating Hash Total for POS: [" . $param_array[0] . "] LENGTH [" . $param_array[1] . "]\n";		
	}

	######################################
	# Magic Key, for Modulo purpose
	#
	######################################	

	$magic_key = 17;
	$grand_sum = 0;
	$token = 1;

	@tmp_lines = @lines;
	foreach $line (@tmp_lines) {

		##########################################
		# Take the number according to parameters
		# Strip off Non-Digit characters
		# 	-123.456 => 123456
		#
		# And split into Array
		#	123456 => [1, 2, 3, 4, 5, 6]
		#	
		##########################################
		
		if ($idx_of_comma > 0) {
			$line = substr($line, $param_array[0]-1, $param_array[1]);
		} else {
			@line_tokens = split(/,/, $line);
			$line = $line_tokens[$param*1 - 1];
		}

		$line =~ s/\D//g;
		@digit_array = split(undef, $line);

		##########################################
		# Add up each digit in array 
		# and ADD the running token
		# 	123456 => 1 + 2 + 3 + 4 + 5 + 6
		#		   => 21
		#
		# 	21 + TOKEN(2) => 23
		#	
		##########################################
		
		$digit_sum = 0;
		foreach $digit (@digit_array) {
			$digit_sum += $digit;
		}
		$digit_sum += ($token % 10);

		$grand_sum += $digit_sum;
		$token++;
	}

	#############################################
	# Modulo the Grand Sum to Magic Key
	#	550 % 17 => 6
	#
	# Add 1 to remainder
	# 
	# Finally the hash total = 
	#	Grand Sum * Remainder => 550 * 6 => 3300
	#	
	#############################################
	
	$remainder = ($grand_sum % $magic_key) + 1;
	$hash_total = $grand_sum * $remainder;

	print "[info] Grand Sum: [$grand_sum] Remainder: [$remainder] Hash Total: [$hash_total]\n";

	$grand_hash_total += $hash_total;
}

print "[info] Grand Hash Total: [$grand_hash_total]\n";

close(DATA_FILE);

if (lc($action) eq 'check') {
	if ($host_hash_total == $grand_hash_total) {
		print "[info] Hash Total Match.\n";
		
		$hash_total_go_file = $data_file . ".htgo";
	
		open(HT_FILE,">$hash_total_go_file") || die("Cannot Open File: [$hash_total_go_file]");
		print HT_FILE "HTGO";
		close(HT_FILE);
	}
	else {
		print "[error] Hash Total Not Match! Host [$host_hash_total] vs Computed [$grand_hash_total].\n";
	}
}