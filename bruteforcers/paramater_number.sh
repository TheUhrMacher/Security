if [ "$1" == "-h" ]; then
  echo "./parameter_number.sh DOMAIN_NAME PARAMETER_NAME UNWANTED_RESPONSE"
  exit 0
fi

# Customize user-agent
ua="Mozilla/5.0 (Windows NT 6.1; Win64,x64, rv:59.0) Gecko/20100101 Firefox/59.0"
# 0-10000 as baseline
for i in {0..10000}
do
  # Get the response of the parameter request
  response=$(curl -s --max-time 5 --max-limit 100K -A "$ua" "$1?$2=$i")
  # Filter out the common error response
  echo "$response" | egrep -q "$3" | tee parameter_number_response.txt
  # sleep $(((RANDOM%5)+1))
done