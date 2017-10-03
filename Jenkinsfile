node('ci-community') {
  
  stage 'Checkout'
  checkout scm
  
  stage 'Setup environment'
  env.PATH = "${tool 'apache-maven-3.0.5'}/bin:${env.PATH}"
  env.LD_LIBRARY_PATH= "${env.LD_LIBRARY_PATH}:/home/${USER}/MCR_R2016b/v91/runtime/glnxa64:/home/${USER}/MCR_R2016b/v91/bin/glnxa64:/home/${USER}/MCR_R2016b/v91/sys/os/glnxa64" 
  stage 'Package and Deploy'
  sh 'mvn deploy'

}
