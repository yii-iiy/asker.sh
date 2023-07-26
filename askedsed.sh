

askedsed ()
(
    : regex=foo replace=bar sp=/ askedsed files...
    : regex=ccc replace=aaaa sp=/ askedsed xx xxx
    
    
    for f in "$@" ;
    do
        local s="${sp}${regex}${sp}${replace}${sp}" &&
        local p="${sp}${regex}${sp}" &&
        
        (
            echo &&
            echo "$f": &&
            echo &&
            echo '~~~~~~~~ before' &&
            echo "$(cat -n -- "$f" | sed -n -- "${p}p" - | grep --color=always -- "${regex}" -)" &&
            echo '~~~~~~~~' &&
            echo &&
            echo '~~~~~~~~ after' &&
            echo "$(cat -n -- "$f" | sed -n -- "s${s}pg" - | grep --color=always -- "${replace}" -)" &&
            echo '~~~~~~~~' &&
            echo &&
            
            : ) &&
        
        while read -p '(y/n)> ' -- a ;
        do
            case "$a" in yes|ok|y|o) sed -i -- "s${s}g" "$f" ; break ;; no|n|dame|d) break ;; *) ;; esac ;
        done &&
        
        :;
    done )
