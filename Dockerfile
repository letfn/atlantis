FROM runatlantis/atlantis:v0.16.1

RUN apk add bash

COPY main /main

COPY service /service

ENTRYPOINT [ "/service" ]

CMD [ "server" ]
