install_dir=`dirname $0`

pom=pom.xml
if [ $# -ne 0 ]; then
  pom=$1
fi

# list of known relocates
$install_dir/pom_transform.sh $pom $install_dir/transforms/artifact_relocates.groovy "icu4j:icu4j:2.6.1" "com.ibm.icu:icu4j:2.6.1"

# how to bump parent jars
$install_dir/pom_transform.sh $pom $install_dir/transforms/bump_parent_pom.groovy "group:jar-parent:1.0-SNAPSHOT" "group:jar-parent:1.1-SNAPSHOT"
