A set of bash and groovy scripts used to clean up a large number of maven POMs.

Based on groovy_xml_tools [1]

Features
* reorder a POM based on a model
* apply groovy transformation scripts (some provided by default)
* ask you be auto-committing

To get started:

* edit your default_pom_model.xml
* create some transformation scripts under transforms/
* create a set of pom_transformations scripts, use example_pom_transforms.sh as example



[1] http://github.com/lacostej/groovy_xml_tools
