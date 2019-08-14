FROM redash/redash:7.0.0.b18042

USER 0
RUN apt update && apt install -yqq vim

COPY patches/view.js.diff /app/client/app/pages/queries
RUN cd /app/client/app/pages/queries && patch < view.js.diff

COPY patches/CeleryStatus.jsx.diff /app/client/app/components/admin
RUN cd /app/client/app/components/admin && patch < CeleryStatus.jsx.diff

WORKDIR /app
RUN npm install
# RUN npm run build
RUN npm run clean
RUN node node_modules/.bin/webpack

# RUN npm install
# RUN npm update caniuse-lite browserslist
# RUN npm run build



# USER 1000
