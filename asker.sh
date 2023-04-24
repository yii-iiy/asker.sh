


asker ()
(
    Readers ()
    {
        :
    } &&
    
    MetaVow ()
    (
        : code gen tools
        
        flags ()
        {
            : unfolder=: flags HELLO:'Hey 👻' QUESTION:'Give me some command ? 👻 > '
            
            unfold ()
            {
                : unfolder=: unfold HELLO:'Hey 👻'
                
                
                local K V && IFS="${unfolder:-$IFS}" read -r -- K V < <(echo "$1") &&
                
                : _nameas THE_"$K" THE_"$K" ASKER_"$K" "$V"
                
                echo "$K" |
                    xargs -i -- echo 'local THE_{}="${THE_{}:-${ASKER_{}:-${1:-'"$V"'}}}" &&' &&
                
                :;
            } &&
            
            eval "$(raise "$@" | xargs -i -- echo $'unfold $\'{}\' &&') :" &&
            
            :;
            
        } &&
        
        
        raise ()
        (
            local eacher="${eacher:-each}" &&
            local raiser="${raiser:-echo \"\$$eacher\"}" &&
            
            eval 'for '"$eacher"' in "$@" ; do eval "$raiser" ; done' &&
            
            :;
            
        ) &&
        
        "$@" &&
        
        :;
        
    ) &&
    
    Asker ()
    {
        _nameas ()
        {
            : FLAGS_OF_READ=' ' _nameas NAME VAL ORVAL ORVAL ...
            
            local name="$1" && shift 1 &&
            local as="$(
                eacher=per raiser='
                    test -n "$per" && { echo "$per" && break ; } ;
                    ' MetaVow raise "$@")" &&
            
            local FLAGS_OF_READ="${FLAGS_OF_READ:- -r }" &&
            read $FLAGS_OF_READ -- "$name" < <(echo "$as") &&
            
            :;
            
        } &&
        
        _ () { :; } &&
        
        "$@" && :;
    } &&
    
    eval "$(unfolder=: MetaVow flags HELLO:'Hey 👻' QUESTION:'Give me some command ? 👻 > ' CASES:'') :" &&
    
    
    
)
