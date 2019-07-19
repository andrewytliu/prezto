function _upfind() {
    dir=`pwd`
    while [ "$dir" != "/" ]; do
        p=`find "$dir" -maxdepth 1 -name $1`
        if [ ! -z $p ]; then
            echo "$p"
            return
        fi
        dir=`dirname "$dir"`
    done
}

function gw() {
    GW="$(_upfind gradlew)"
    if [ -z "$GW" ]; then
        echo "Gradle wrapper not found."
    else
        $GW --configure-on-demand --profile --parallel $@
    fi
}