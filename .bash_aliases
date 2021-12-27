[ -r /d/_src/Dev/bash_scripts.d/tmux ] && . /d/_src/Dev/bash_scripts.d/tmux

alias cds='cd /d/_src'
alias vi=vim
alias nvi='start /c/Neovim/bin/nvim-qt.exe'

lic.attach() {
    tmr.attach lic $1
}

lic.restart() {
    tmr.kill lic $1
    lic.start $1 --purgeServer
}

lic.start() {
    tmr.new lic "$1" "-d c://LicensingServer3//LicensingServer3 --password=fred --listenAt=http://*/licensing/$1" $2
}

mpc() {
    make -C ~/_src/LabCognition.Base build && make -C ~/_src/PanoramaCloud build
}
