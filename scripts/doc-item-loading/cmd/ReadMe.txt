Running the scripts:
=====================
1. Copy the Macro tab in the excel to the file given by the user for loading
2. Update column B1 in the macro tab to point to the correct path for the csv files to be exported
3. Click on the "Save CC" and "Save Sec" buttons to export the files into csv format
	- a csv folder must be created first (the exported files will be in csv folder)
	- the original tab name for cc items must be "CC checklist"
	- the original tab name for sec items must be "Collateral checklist"
	- *Note: data in excel cannot have newline in them
4. Copy the load.cmd and setup.sql to the csv folder
5. Run load.cmd from the db2cmd prompt


Cleanup:
======== 
1. At the db2cmd prompt, run cleanup.cmd
