#! /bin/sh

# Generate graph of verilog file includes from a given file

function show_help() {
    echo "Usage: $0 [-h] [-p SEARCH_PATH] [-b BASE_DIR] FILE"
    echo "-h				-- show this page"
    echo "-p SEARCH_PATH	-- path to also search when finding files, separated by :"
    echo "-b BASE_DIR		-- print paths relative to BASE_DIR"
    echo "FILE				-- the verilog to begin with"
}

search_path="../../rtl/verilog/openmsp430/:../../rtl/verilog/openmsp430/periph/"
base_dir="/home/anton/uni/swp_2019/Repos/sancus-core-fork"
declare -a search_paths

function run() {
    # dirname
    currfile=$1
    local indent=$2
    echo "$indent$(realpath --relative-to=$base_dir $currfile)"
    pushd $(dirname $currfile) &>/dev/null
    includes=$(grep -o "\`include \"[^\"]*\"" $(basename $currfile) | sed -e "s/\`include \"//" -e "s/\"//")
    for i in $includes ; do
        # echo "next: $i"
        next=
        if [ -e "$i" ] ; then
            next="$i"
        else
        	for p in $search_paths ; do
            	# echo "checking: $p$i"
    			if [ -e "$p$i" ] ; then
        			next="$p$i"
        			break
        		fi
    		done
        fi
		if [ -z "$next" ] ; then
    		echo "File not found: '$i'"
        else
            run "$next" "$indent  "
        fi
    done
    popd &>/dev/null
}

while getopts "hp:b:" opt; do
    case $opt in
    h) show_help; exit 0;;
    p) search_path="$OPTARG";;
    b) base_dir=$(realpath $OPTARG);;
    ?) show_help; exit 2;;
    esac
done
search_paths=()
while read -r p ; do
	#if [ -d "$p" ] ; then
		rp=$(realpath $p)
		search_paths+=" $rp/"
	#fi
done <<< ${search_path/:/$'\n'}
shift $(($OPTIND - 1))
run $1 ""
