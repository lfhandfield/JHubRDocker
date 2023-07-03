FROM bioconductor/bioconductor_docker:devel

RUN sudo apt-get update && apt-get install -y \
  build-essential vim man xclip libc6-dbg gdb wget valgrind python3.11 python3-pip\
	--no-install-recommends
RUN sudo pip3 install scanpy scipy scrublet umap palantir matplotlib jupyterlab rpy2 umap scikit-learn
RUN sudo R -e "install.packages(c('Seurat','BiocManager', 'pheatmap', 'ggplot2', 'grid','gridExtra'))"
RUN sudo R -e "BiocManager::install(c('DESeq2', 'SingleCellExperiment', 'gProfileR','slingshot') )"
RUN sudo pip3 install cellxgene 


CMD ["jupyter notebook --port=8888 --no-browser --allow-root"]
