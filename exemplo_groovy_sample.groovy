// exemplo_groovy_sample.groovy
// Snippet Groovy genérico mostrando lógica de iteração e logs
// Adaptável para automações em EPM ou scripts internos (sem dados sensíveis)

def records = [
  [id:1, account:'1000', amount: 250.0],
  [id:2, account:'2000', amount: -100.0]
]

records.each { r ->
  println "Processando record id=${r.id} account=${r.account} amount=${r.amount}"
  if (r.amount < 0) {
    println "  -> Atenção: amount negativo detectado para id=${r.id}"
    // aqui poderia vir lógica de correção ou flag
  }
}
