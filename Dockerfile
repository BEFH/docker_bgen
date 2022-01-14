FROM centos:7.8.2003
RUN yum install -y epel-release && \
  yum install -y waf gcc wget gcc-c++ zlib-devel && \
  wget --no-check-certificate \
  https://www.well.ox.ac.uk/~gav/resources/qctool_v2.2.0-CentOS_Linux7.8.2003-x86_64.tgz && \
  tar -xzf qctool_v2.2.0-CentOS_Linux7.8.2003-x86_64.tgz --strip-components 1 && \
  mv qctool /usr/bin/ && \
  wget http://code.enkre.net/bgen/tarball/release/bgen.tgz && \
  mkdir bgen && \
  tar -xzf bgen.tgz -C bgen --strip-components 1 && \
  cd bgen && \
  ./waf configure && \
  ./waf && \
  ./build/test/unit/test_bgen && \
  ./build/apps/bgenix -g example/example.16bits.bgen -list && \
  mv ./build/apps/* /usr/bin/ && \
  cd .. && \
  rm -rf qctool_v2.2.0-CentOS_Linux7.8.2003-x86_64.tgz bgen bgen.tgz
