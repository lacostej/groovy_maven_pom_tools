install_dir=`dirname $0`
echo $install_dir
. $install_dir/tools.sh

if [ $# -ne 0 ]; then
  pom=$1
  transform_script=$2
  shift
  shift
else
  echo "USAGE: $0 pom transform_script"
  exit 1
fi

echo "POM $pom"
echo "applying Transform  $transform_script"

#export CLASSPATH=$install_dir/pom-reorder
groovy $GROOVY_XML_TOOLS_HOME/xml_transform.groovy $pom $transform_script $* > $pom.tmp

mv $pom.tmp $pom

dir=`dirname $pom`
cd $dir
#mvn install

svn status

svncommit "applied POM transform $transform_script"

