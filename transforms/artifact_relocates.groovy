if (this.args.size() < 2) {
  println "ERROR: Not enough arguments !"
  exit(-1)
}
// println "Replacing dependency... $args"
def gav1 = args[0].split(':')
def gav2 = args[1].split(':')

// println gav1
// println gav2

def deps = root.dependencies.dependency.findAll{it.name() == 'dependency' }

def dependencies = root.dependencies.dependency.findAll{it.artifactId.text() == gav1[1] && it.groupId.text() == gav1[0] && it.version.text() == gav1[2] }

//println dependencies

dependencies.each{
  it.groupId[0].value = gav2[0]
  it.artifactId[0].value = gav2[1]
  it.version[0].value = gav2[2]
}

