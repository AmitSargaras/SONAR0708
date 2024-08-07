Instructions for Loading the Checklist Template Global Document Items:
=======================================================================


Getting the CSV file from user excel file:
===========================================
1. Copy the Macro tab in the excel to the file given by the user for loading
2. Update column B1 in the macro tab to point to the correct path for the csv files to be exported
3. Click on the "Save CC" and "Save Sec" buttons to export the files into csv format
	- a csv folder must be created first (the exported files will be in csv folder)
	- the original tab name for cc items must be "CC checklist"
	- the original tab name for sec items must be "Collateral checklist"
	- *Note: data in excel cannot have newline in them


Loading:
=========
1. CC Items to be in csv file call: cc.csv
2. Sec Items to be in csv file call: sec.csv
3. Place load.sh and setup.sql in the same folder with cc.csv and sec.csv
4. Ensure that the environment setup (db name, db user etc) in load.sh is correct
5. chmod 777 load.sh
6. Call ./load.sh - this will perform all the necessary steps


To cleanup:
===========
1. Ensure that the environment setup (db name, db user etc) in cleanup.sh is correct
2. chmod 777 cleanup.sh
3. Call ./cleanup.sh


*To note: login user need to have the permission to execute scripts