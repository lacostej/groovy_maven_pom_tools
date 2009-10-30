def url = null
if (args.size() > 0) {
  url = args[0]
}

def get_svn_url() {
  def command = """svn info"""
  def proc = command.execute()
  proc.waitFor()
  if (proc.exitValue() != 0) {
    return
  }
  return new StringReader(proc.in.text).readLines().findAll{ it.startsWith("URL:")}[0][4..-1].trim()
}


def svn_url = 'scm:svn:' + get_svn_url()

def scm = root.scm[0]

if (scm == null) {
  scm = root.appendNode('scm')  
} else {
  scm.children().clear()
}

scm.appendNode('connection', svn_url)
scm.appendNode('developerConnection', svn_url)
if (url != null) {
  scm.appendNode('url', args[0])
}

