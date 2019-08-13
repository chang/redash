FROM redash/redash:7.0.0.b18042

USER 0
RUN apt update && apt install -yqq vim

COPY patches/view.js.diff /app/client/app/pages/queries
RUN cd /app/client/app/pages/queries && patch < view.js.diff

WORKDIR /app
RUN npm install
RUN npm run build

USER 1000
# RUN pip install flask_talisman importlib_metadata
# RUN npm install
# RUN npm run build
