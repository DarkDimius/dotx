# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
##
# Your previous /Users/xeno_by/.bash_profile file was backed up as /Users/xeno_by/.bash_profile.macports-saved_2013-06-10_at_22:03:04
##

# MacPorts Installer addition on 2013-06-10_at_22:03:04: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

