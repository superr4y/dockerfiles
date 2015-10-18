#!/bin/bash

echo "export PATH=$PATH:/home/user/bin" >> ~/.profile

cat >> ~/.tmux.conf << EOF 
set -g prefix C-a
set-window-option -g mode-keys vi
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-selection
bind-key j select-pane -D
bind-key k select-pane -U
bind-key h select-pane -L
bind-key l select-pane -R
EOF

cat >> ~/.vimrc << EOF 
set number
syntax on
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set enc=utf-8
set hlsearch
set incsearch
set wildmenu
set nocompatible   
autocmd FileType python map <F5> :w<CR>:!python "%"<CR>
autocmd FileType perl map <F5> :w<CR>:!perl "%"<CR>
autocmd FileType ruby map <F5> :w<CR>:!ruby "%"<CR>
autocmd FileType tex map <F5> :w<CR>:!pdflatex %<CR>
autocmd FileType c map <F5> :w<CR>:!gcc % -o %.bin;./%.bin<CR>
autocmd FileType go map <F5> :w<CR>:!./make.sh "%"<CR>
EOF


sudo cat >> /etc/metasploitdb.yml << EOF
production:
    adapter: postgresql
    database: msf
    username: msf
    password: msf
    host: 127.0.0.1
    port: 5432
    pool: 75
    timeout: 5
EOF




mkdir ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDocmoY6maNNQr4gTvyOD0mbOCxXwtl+7pu9pjElNDxRj5pshjSVa2YlRrWfNn9pdukbn/zPN57DtsL2A1mmlxQ5z6X3/d/aBryFRsc49gQIohXh4DtQtnOgvHv5mBfWgAK44UrfUvW5emcTp3gT5PBL4/oWbaK6aJsgL+rC+5ERBWriWoU1iySBaJUH29an8aKat039RE6uC4s2UevqJOvMWn8FQecfwQjBmHDzITkFp0bPATuihvc/EzHcZhOHN8VwZtpWTqNj5YANIaeV/8/eANk8ITBZN4VV9hPbzBYS5kaCzdhIDc7bAutoK+td7+hWOjOVV+qMJuVvlr6cmIH user@t440p" >> ~/.ssh/authorized_keys
