# port scan
sudo nmap -sP 192.168.1.0/24


# install on new comp
cd ~
git init .
mv .gitconfig .gitconfig.old
git remote add origin https://github.com/ahm4711/dotfiles.git
git pull origin master
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# C# code cleanup
# remove regions
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b -e '/#\(end\)\?region/ d' -i

# remove xml doc
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b -e '/^[ \t]*\/\/\/ / d' -i

# remove BOM
find . -iname '*.csproj' -print0 | xargs -0 -L1 sed -b -e '1s/^\xef\xbb\xbf//' -i
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b -e '1s/^\xef\xbb\xbf//' -i

# remove header
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b -e '/^\/\/ <copyright /,/^\/\/ <author / d' -i

#tabs to spaces
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b 's/\t/    /g' -i

# remove empty lines
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b 's/[ \t]*\r$/\r/' -i

# remove duplicate empty lines
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b '/.\r/,/^\r$/!d' -i


# remove attributes
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b -e '/^[ \t]*\[DefaultProperty[ \t]*(.*)\]\r$/ d' -i
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b -e '/^[ \t]*\[Description[ \t]*(.*)\]\r$/ d' -i
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b -e '/^[ \t]*\[Browsable[ \t]*(.*)\]\r$/ d' -i
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b -e '/^[ \t]*\[Localizable[ \t]*(.*)\]\r$/ d' -i
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b -e '/^[ \t]*\[\(System\.Reflection\.\)\?Obfuscation[ \t]*(.*)\]\r$/ d' -i
find . -iname '*.cs' -print0 | xargs -0 -L1 sed -b -e '/^[ \t]*\[CLSCompliant[ \t]*(.*)\]\r$/ d' -i

# Movement Mappings
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>

# dotfiles
change to dir of current file
:cd %:h

[s ]s navigate spelling errors
z= correct word
zg add current word to spell file
zw remove current word from spell file

Select the first block: ctrl-v move "ay
Select the second block: ctrl-v move c ctrl-o "aP <Esc> 


Surround word with double quotes

ciw""<Esc>P
ciw'<C-r><C-o>"'<esc>


Swap words

yiw
viwp
#
viwp


Remove mapping from insert mode

iunmap MAPPING

Paste into command line

CTRL-R
	CTRL-W word 
	CTRL-A WORD
    

delete a word
    daw
