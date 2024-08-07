use Text::CSV;

$action = @ARGV[0];
if (lc($action) ne 'gen' && lc($action) ne 'check') {
	print "[info] [usage]: hash_total (gen|check) datafile [hashtotalfile] <col,length>";
	exit(0);
}
#hash total parameter index always start with 3rd position
$param_start_idx = 3;#(lc($action) eq 'gen') ? 2 : 3 ;

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

#------------------------------------------------
# fetch argument from console
#
# i) fixed length format, in the form of:
#   1,7 8,5
#   <start index of 1st char>, <no. of chars to fetch>
#   <start index of 8th char>, <no. of chars to fetch>
#
# ii) CSV format, in the form of 
#   1 3 4
#   fetch value in 1st, 3rd and 4th token
#
#------------------------------------------------

$param = $ARGV[$idx_arg];
$idx_of_comma = index($param, ',');
if ($idx_of_comma > 0) {
  @param_array = split(/,/, $param);
  print "[info] Calculating Hash Total for POS: [" . $param_array[0] . "] LENGTH [" . $param_array[1] . "]\n";    
}

#-------------------------------------
# Magic Key, for Modulo purpose
#
#-------------------------------------
$magic_key = 17;
$grand_sum = 0;
$token = 1;

@tmp_lines = @lines;
$get_sign = "";
foreach $line (@tmp_lines) {
    
  if ($line =~ /^D/) {

      #-------------------------------------------------------------------
      # fetch the numbers according to parameters, i.e
      # <start index of 1st char> and <length of chars to fetch>
      # Strip off Non-Digit characters
      #
      # And split into Array
      #  1234.56 => [1, 2, 3, 4, 5, 6]
      #
      # And split into Array
      #  -99881.22 => [-9, 9, 8, 8, 1, 2, 2]
      #
      #-------------------------------------------------------------------
      if ($idx_of_comma > 0) {
        # <start index of 1st char> and <length of chars to fetch>
        $line = substr($line, $param_array[0]-1, $param_array[1]);
        $get_sign = substr($line, 0,1);
      } else {
	    $csv = Text::CSV->new();              # create a new object
 		$status  = $csv->parse($line);        # parse a CSV string into fields
 		@line_tokens = $csv->fields();        # get the parsed fields   
		$line = $line_tokens[$param*1 - 1];

		# --------------------------------------------------------
		# Split sign and value field into Array
		#  11:12 => [11, 12]
		#  with token 11 carry sign and token 12 carry value
		# --------------------------------------------------------
        if (index($param, ':') > 0){
	        @param_array = split(/:/, $param);
			$get_sign = $line_tokens[$param_array[0]*1 - 1];
			$line = $line_tokens[$param_array[1]*1 - 1];
		}    
      }

      $line =~ s/\D//g;
      @digit_array = split(undef, $line);

	  #------------------------------------------
	  # Add up each digit in array 
	  # and ADD the running token
	  #   -123456 => -1 + 2 + 3 + 4 + 5 + 6
	  #       => 19
	  #
	  #   19 + (if TOKEN=2) => 21
	  #  
	  #------------------------------------------
      if ( @digit_array > 0 ) {
        $digit_sum = 0;
        foreach $digit (@digit_array) {

          if ($get_sign eq '-' ) {
            if ($digit >0) {

              #------------------------------------------
              # if the digit array = {- 0 0 0 0 2 0 0 8 9}
              # then search and determine the first number > 0
              # 
              # in this case is 2, then it is re-defined as -2
              #
              # then add up all the digits, i.e. -2+8+9 = 15
              #  
              #------------------------------------------
                $digit_sum -= $digit;
                $get_sign ="";
            }
          }
          else {
            $digit_sum += $digit;
          }
        }
        $digit_sum += ($token % 10);
        $grand_sum += $digit_sum;
        $token++;
      }
    }
}

#--------------------------------------------
# Modulo the Grand Sum to Magic Key
#  if (Grand sum=550) % 8 => 6
#
# Add 1 to remainder
# 
# Finally the hash total = 
#  Grand Sum * Remainder => 550 * (6+1) => 3850
#  
#--------------------------------------------

$remainder = ($grand_sum % $magic_key) + 1;
$hash_total = $grand_sum * $remainder;

print "[info] Grand Sum: [$grand_sum] Remainder: [$remainder] Hash Total: [$hash_total]\n";
$grand_hash_total += $hash_total;

}

close(DATA_FILE);

if (lc($action) eq 'check') {
	if ($host_hash_total == $grand_hash_total) {
		print "[info] Hash Total Match. Host [$host_hash_total] vs Computed [$grand_hash_total].\n";
		$hash_total_go_file = $data_file . ".htgo";
	
		open(HT_FILE,">$hash_total_go_file") || die("Cannot Open File: [$hash_total_go_file]");
		print HT_FILE "HTGO";
		close(HT_FILE);
	}
	else {
		print "[error] Hash Total Not Match! Host [$host_hash_total] vs Computed [$grand_hash_total].\n";
	}
}
elsif (lc($action) eq 'gen') {
	$hash_total_output_file = @ARGV[2];
	open(HASH_TOTAL_OUTPUT_FILE, ">$hash_total_output_file");
	print HASH_TOTAL_OUTPUT_FILE $grand_hash_total;
	close(HASH_TOTAL_OUTPUT_FILE);
}