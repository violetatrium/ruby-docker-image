FROM ruby:2.5.0

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

RUN apt-get update && apt-get install -yq libpq-dev nodejs vim-common postgresql-client-9.6 libfftw3-dev fftw3

RUN npm install elasticdump -g
RUN ACCEPT_HIGHCHARTS_LICENSE=YES npm install highcharts-export-server -g
