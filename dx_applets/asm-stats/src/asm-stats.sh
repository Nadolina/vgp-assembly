#!/bin/bash
# asm-stats 0.0.1
# Generated by dx-app-wizard.
#
# Basic execution pattern: Your app will run on a single machine from
# beginning to end.
#
# Your job's input variables (if any) will be loaded as environment
# variables before this script runs.  Any array inputs will be loaded
# as bash arrays.
#
# Any code outside of main() (or any entry point you may add) is
# ALWAYS executed, followed by running the entry point itself.
#
# See https://wiki.dnanexus.com/Developer-Portal for tutorials on how
# to modify this file.

main() {

    echo "Value of asm: '$asm'"
    echo "Value of gsize: '$gsize'"

    # The following line(s) use the dx command-line tool to download your file
    # inputs to the local file system using variable names for the filenames. To
    # recover the original filenames, you can use the output of "dx describe
    # "$variable" --name".

    dx download "$asm" -o asm.fasta.gz
    gunzip asm.fasta.gz
	
	java -jar -Xmx1g /opt/java/fastaContigSize.jar asm.fasta

	c=$c
	if [[ "$c" == "c" ]]; then
			exit 0
	fi

    dx-jobutil-add-output asm_stats "$asm_stats" --class=string
}
