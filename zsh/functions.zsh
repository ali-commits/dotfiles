#######################################################################
#   __                  _   _                 
#  / _|_   _ _ __   ___| |_(_) ___  _ __  ___ 
# | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
# |  _| |_| | | | | (__| |_| | (_) | | | \__ \
# |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
#                                             

### functions 
take() # create dirctory and cd to it
{ 
        mkdir $1 && cd $1
}

# auto list dirs (with colorls) when cd to directory 
if  command -v colorls &> /dev/null
then
    chpwd() colorls --group-directories-first
else
    chpwd() ls
fi

# create alias if command exists
cmd_alias() {
    if command -v $2 &> /dev/null
    then
        a=$1
        shift
        alias $a="$*"
    fi
}

