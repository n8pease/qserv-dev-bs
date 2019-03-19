# This script sets up a shell for qserv development. It presumes that qserv has already been installed.
# If VS Code is installed it will be launched if you include the `-c` argument.
# If Eclipse is installed it will be launched if you include the `-e` argument.

OPTIND=1
LAUNCH_ECLIPSE=0
LAUNCH_CODE=0

while getopts "ec" flag; do
	case ${flag} in
		e) 	LAUNCH_ECLIPSE=1
			;;
	        c)      LAUNCH_CODE=1
			;;
	esac
done


. lsst_stack/loadLSST.bash
cd code/lsst/qserv
setup -t qserv-dev -r .
setup -t qserv-dev -k -r ~/code/lsst/qserv_testdata/

if [ $LAUNCH_ECLIPSE = 1 ]
then
	eclipse &
fi
unset LAUNCH_ECLIPSE
if [ $LAUNCH_CODE = 1 ]
then
	code &
fi
unset LAUNCH_CODE
