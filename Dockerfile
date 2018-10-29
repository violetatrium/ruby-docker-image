FROM ruby:2.5.3

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -

RUN apt-get update && apt-get install -yq libpq-dev nodejs vim-common postgresql-client-10 libfftw3-dev fftw3 locales locales-all

RUN npm install elasticdump -g
RUN ACCEPT_HIGHCHARTS_LICENSE=YES npm install highcharts-export-server -g --unsafe-perm

RUN locale-gen en_US.UTF-8
RUN update-locale en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
