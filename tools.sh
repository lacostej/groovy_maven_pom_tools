export GROOVY_XML_TOOLS_HOME=/home/jerome/Code/Customers/Me/groovy_xml_tools.git

export CLASSPATH=$GROOVY_XML_TOOLS_HOME:$PATH

function svncommit() {
  svn diff | less
  PS3="Do you want to commit ?"
  select answer in y n
  do
    [ "$answer" = "y" ] && svn commit -m "$1"
    break
  done
}
