# qctool v2.2.0 and bgen v1.1.7
FROM gcc:11.2.0-bullseye
RUN apt-get update && apt-get install -y --no-install-recommends zlib1g-dev liblapack-dev && \
  mkdir qctool && \
  wget "https://enkre.net/cgi-bin/code/qctool/tarball/86639c1ad4/qctool-86639c1ad4.tar.gz" && \
  tar -xzf qctool-86639c1ad4.tar.gz -C qctool --strip-components 1 && \
  cd qctool && \
  python3 ./waf configure && \
  python3 ./waf && \
  mv build/release/apps/qctool_v2.2.0 /usr/bin/qctool && \
  mv build/release/apps/hptest_v2.2.0 /usr/bin/hptest && \
  mv build/release/apps/inthinnerator_v2.2.0 /usr/bin/inthinnerator && \
  mv build/release/apps/ldbird_v2.2.0 /usr/bin/ldbird && \
  mv build/release/apps/selfmap_v2.2.0 /usr/bin/selfmap && \
  cd .. && \
  wget https://enkre.net/cgi-bin/code/bgen/tarball/6ac2d582f9/BGEN-6ac2d582f9.tar.gz && \
  mkdir bgen && \
  tar -xzf BGEN-6ac2d582f9.tar.gz -C bgen --strip-components 1 && \
  cd bgen && \
  python3 ./waf configure && \
  python3 ./waf && \
  ./build/test/unit/test_bgen && \
  ./build/apps/bgenix -g example/example.16bits.bgen -list && \
  rm build/apps/*.o && \
  mv ./build/apps/* /usr/bin/ && \
  cd .. && \
  rm -rf *.tar.gz bgen qctool
