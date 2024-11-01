function mc
    set SHELL_PID %self
    set MC_PWD_FILE "/tmp/mc-$USER/mc.pwd.$SHELL_PID"
    mkdir -p "/tmp/mc-$USER/"

    set MC_BIN (command -v mc)
    $MC_BIN --nosubshell -P $MC_PWD_FILE $argv

    if test -r $MC_PWD_FILE
        set MC_PWD (cat $MC_PWD_FILE)
        if test -n "$MC_PWD"
            and test -d "$MC_PWD"
            cd "$MC_PWD"
        end

        rm $MC_PWD_FILE
    end
end
