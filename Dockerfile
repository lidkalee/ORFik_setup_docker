FROM rocker/rstudio:4.2.2

# Install system dependencies for ORFik.
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends libbz2-dev liblzma-dev \
    && rm -rf /var/lib/apt/lists/*
RUN Rscript -e "install.packages('devtools')"
# Install ORFik R package from GitHub.
RUN Rscript -e "devtools::install_github('Roleren/ORFik')"


CMD ["/init"]

