
install_dir=`dirname $0`
export GROOVY_XML_TOOLS_HOME=$install_dir/groovy_xml_tools

# override if you want
#export GROOVY_XML_TOOLS_HOME=/home/jerome/Code/Customers/Me/groovy_xml_tools.git

export CLASSPATH=$GROOVY_XML_TOOLS_HOME:$PATH

function svncommit() {
  changes=`svn diff | wc -l`
  if [ $changes = 0 ]; then
    echo "no changes for $1"
    exit
  fi
  svn diff | less
  PS3="Do you want to commit ?"
  select answer in y n
  do
    [ "$answer" = "y" ] && svn commit -m "$1"
    break
  done
}
