#!/bin/sh
#
if type tclsh > /dev/null 2>&1 ; then echo "tclsh";exit; fi
if type tclsh8.6 > /dev/null 2>&1 ; then echo "tclsh8.6" ;exit; fi
if type tclsh8.5 > /dev/null 2>&1 ; then echo "tclsh8.5" ;exit; fi
echo "$0: tclsh required" ; \
exit 1

