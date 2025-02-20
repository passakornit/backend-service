#!/usr/bin/env groovy

library(
  identifier: 'devops@main',
  retriever: modernSCM(
    [
      $class: 'GitSCMSource',
      remote: 'https://github.com/passakornit/devops-test.git',
      credentialsId: 'gith'
    ]
  )
)

mainPipeline {
  APP_NAME = 'hello-api'
}
