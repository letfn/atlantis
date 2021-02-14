#!/usr/bin/env groovy

library 'defn/jenkins-kiki@main'

def config = [
  role: 'letfn--atlantis',
  roleId: '491687f4-f642-db68-2967-e548ff4f5d82',
  pipelineSecrets: [[
    path: 'kv/pipeline/letfn--atlantis',
    secretValues: [
      [vaultKey: 'MEH1']
    ]
  ]]
]

goreleaserMain(config) {
  if (env.TAG_NAME) {
    stage('Test Docker image') {
      sh("/env.sh figlet -f /j/chunky.flf test docker")
      sh "/env.sh docker run --rm --entrypoint /main defn/atlantis:v0.16.1-${env.GORELEASER_CURRENT_TAG.minus('v')}-amd64"
    }
  }
  else {
    stage('Test') {
      sh("/env.sh figlet -f /j/chunky.flf test")
      sh "uname -a"
    }
  }
}
