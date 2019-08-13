FROM redash/redash:7.0.0.b18042

USER 0
RUN apt update && apt install -yqq vim

COPY patches/view.js.diff /app/client/app/pages/queries
RUN cd /app/client/app/pages/queries && patch < view.js.diff

RUN npm install -g n
RUN n 10

RUN mkdir /frontend
RUN cp package.json package-lock.json /frontend
RUN cp -r client /frontend/client
RUN cp webpack.config.js /frontend

WORKDIR /frontend
RUN npm install
# RUN npm run build

# RUN npm install
# RUN npm update caniuse-lite browserslist
# RUN npm run build



# USER 1000
