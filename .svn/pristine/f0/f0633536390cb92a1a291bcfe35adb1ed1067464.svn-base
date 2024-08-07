$hash_total_file = @ARGV[0];
$data_file = @ARGV[1];
$trailer_output_file = @ARGV[2];

$length_of_trailer_count = 10;
$length_of_hash_total = 15;

## ------------------------------------------------
## Preparing hash total
## ------------------------------------------------

open(HASH_TOTAL_FILE, $hash_total_file);
if (! -e HASH_TOTAL_FILE) {
  print "[error] Hash total file [$hash_total_file] not found, exiting program. \n";
  exit(0);
}

@hash_total_line = <HASH_TOTAL_FILE>;
$hash_total_value = $hash_total_line[0];
close(HASH_TOTAL_FILE);

$length_of_hash_total_value = length($hash_total_value);
$required_zero_pad_num_of_hash_total = $length_of_hash_total - $length_of_hash_total_value;

for ($i = 0; $i < $required_zero_pad_num_of_hash_total; $i++) {
	$hash_total_value = "0" . $hash_total_value
}


## ------------------------------------------------
## Preparing trailer count
## ------------------------------------------------

open(DATA_FILE, $data_file);
if (! -e DATA_FILE) {
  print "[error] Data file [$data_file] not found, exiting program. \n";
  exit(0);
}
@data_lines = <DATA_FILE>;
$num_of_data = @data_lines;
$length_of_data_num = length($num_of_data);
$required_zero_pad_num = $length_of_trailer_count - $length_of_data_num;

for ($i = 0; $i < $required_zero_pad_num; $i++) {
	$num_of_data = "0" . $num_of_data
}

## ------------------------------------------------
## Preparing actual trailer details
## ------------------------------------------------

open(TRAILER_FILE, ">$trailer_output_file");
print TRAILER_FILE "T" . $num_of_data . $hash_total_value; 
close(TRAILER_FILE);
