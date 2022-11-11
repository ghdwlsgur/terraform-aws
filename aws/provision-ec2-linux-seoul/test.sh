
set -e -o pipefail 

check_library() {
	echo "Checking Dependencies..."
	jq_path=$(whereis jq | awk '{ print $2 }')
	if [ jq_path == "" ]; then 
		echo "jq IS NOT INSTALLED"
		exit 
	else 
		echo "jq IS INSTALLED"
	fi 

	rsync_path=$(whereis rsync | awk '{ print $2 }')
	if [ rsync_path == "" ]; then
		echo "rsync IS NOT INSTALLED"
		exit
	else 
		echo "rsync IS INSTALLED"
	fi 
}

get_outline_info() {
	local key_pair="~/.ssh/linux.pem"
	local ec2_hostname="ec2-user"
	local outline_file_location="~/test/test.txt"
	local destination_location="./"

	rsync -avz -delete -partial -e "ssh -i $key_pair" $ec2_hostname@52.79.219.11:$outline_file_location $destination_location
}


main(){
	#local test="/go/good"
	#test2="ssh $test"
	#echo $test2
	check_library && get_outline_info
}

main 
