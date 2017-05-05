library(GenomicRanges)
###################
# Extract exons and introns for a gene
###################
# extract introns
# get DNA sequences
# ## Write an XStringSet object to a FASTA (or FASTQ) file:
# library(Biostrings)
# for (ind in seq(length(trak2_ex_seqs)) ){
#   writeXStringSet(trak2_ex_seqs[[ind]], filepath='./test.fa', append=TRUE,compress=FALSE, compression_level=NA, format="fasta")  
# }

library(TxDb.Hsapiens.UCSC.hg19.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

library(GenomicFeatures)
# get transcript list grouped by gene
transByGene <- transcriptsBy(txdb, by="gene",use.names=FALSE) 
# transByGene[['66008']]
transByGene
# get DNA sequence for each transcript for each gene
library(BSgenome.Hsapiens.UCSC.hg19)
transByGene_seqs <- getSeq(Hsapiens,transByGene)
# get the entrez gene ID of all the genes in the list
entrezGID <- names(transByGene)
# Given an index of the list of genes, from 1 to length(entrezGID), one can obtain the entrez ID, the range and the seqs of the gene transcripts
ind <- 1 
entrezGID[ind]
transByGene[entrezGID[ind]] 
transByGene_seqs[[ind]]
