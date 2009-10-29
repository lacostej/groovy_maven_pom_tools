install_dir=`dirname $0`
echo $install_dir
. $install_dir/tools.sh

pom=pom.xml

if [ $# -ne 0 ]; then
  pom=$1
fi

#export CLASSPATH=$install_dir/pom-reorder
groovy $GROOVY_XML_TOOLS_HOME/xml_prettyprint.groovy $pom > $pom.tmp
mv $pom.tmp $pom
svn diff $pom

dir=`dirname $pom`
cd $dir
#mvn install

svn status

svncommit "pretty POM"

