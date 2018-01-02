[ -n "$PS1" ] && source ~/.bash_profile;

#Temp alias for education openshift
alias curlos="curl -v -k -H 'Authorization: Bearer eroVraiHOt732QZp6EKrU9Q34OcxhJKKGEHO7l7g2Og' https://ukdigitalapp.paas.education.gov.uk.test:8443/oapi/v1/projects"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/kalbirsohi/.sdkman"
[[ -s "/Users/kalbirsohi/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/kalbirsohi/.sdkman/bin/sdkman-init.sh"
