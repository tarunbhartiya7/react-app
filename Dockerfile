FROM tarunbhartiya7/webapp

RUN rm /var/www/html/*.*

ADD ./build /var/www/html

