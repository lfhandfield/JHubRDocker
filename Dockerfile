FROM bioconductor/bioconductor_docker:devel

RUN apt-get update && apt-get install -y \
  build-essential vim man xclip libc6-dbg gdb wget valgrind\
	--no-install-recommends
RUN sudo pip3 install scanpy scipy scrublet umap palantir matplotlib jupyterlab rpy2 umap sklearn

CMD ["hostname -I > whereisit && jupyter notebook --port=5000 --no-browser --allow-root"]
