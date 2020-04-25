FROM netlify/build:8e315e54bc4032a32e73290be556cde4f8348c12

ENV NETLIFY_REPO_URL="/opt/repo"
ENV NETLIFY_BUILD_BASE="/opt/buildhome"
ENV NETLIFY_REPO_DIR="$NETLIFY_BUILD_BASE/repo"

WORKDIR $NETLIFY_REPO_URL
COPY ./ ./
RUN mkdir -p $NETLIFY_REPO_DIR
RUN cp -p -r $NETLIFY_REPO_URL/* $NETLIFY_REPO_DIR/
RUN build ./scripts/netlify.sh
