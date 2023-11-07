FROM alpine:latest
WORKDIR /app
RUN apk add curl
RUN echo 'http[0-9A-Za-z :\/._-]*' > urlpattern &&\ 
 echo '#!/bin/sh' > scrapelist.sh &&\
 echo 'rm -f out.l' >> scrapelist.sh &&\
 echo 'for url in $(cat in.l)' >> scrapelist.sh &&\
 echo 'do' >> scrapelist.sh &&\
 echo 'echo "$(curl -s $url)" | grep -o "$(cat urlpattern)" >> out.l' >> scrapelist.sh &&\
 echo 'done' >> scrapelist.sh &&\
 chmod 700 scrapelist.sh
CMD ["tail","-f","/dev/null"]
