set -A disabled_config_items\
  "PasswordAuthentication"\
  "ChallengeResponseAuthentication"

for config_item in ${disabled_config_items[@]}
do
  echo "$config_item no"
done
