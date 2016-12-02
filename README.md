# FPGrowth-Test
Scripts for testint FP-Growth

### Script to change the object/file ID format, from any format to numerical.

The arguments are:
- The tracefile
- The column number with the object/file ID
```
./scriptChangeToFPGrowthInputFormat.sh tracefile.dat 2
```

### Script to group records in a "transaction".

The arguments are:
- The tracefile
- The window size: the number of records to include on each "transaction".
```
./scriptApplyWindow.sh tracefile.dat 150 > tracefile-output.dat
```

