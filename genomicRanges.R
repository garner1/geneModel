library(GenomicRanges)
library(BSgenome.Hsapiens.UCSC.hg19)

###################################################
### GeneModel from UCSC
###################################################
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
txdb
transcripts(txdb)

# ###################################################
# ### GeneModel from Ensembl
# ###################################################
# library(GenomicFeatures)
# txdb <- makeTxDbFromBiomart(biomart="ensembl",dataset="hsapiens_gene_ensembl")
# txdb

exonsBy(txdb, by="gene")
genelist <- genes(txdb, columns="gene_id", filter=NULL, single.strand.genes.only=FALSE)
genelist
