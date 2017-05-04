library(GenomicRanges)
library(BSgenome.Hsapiens.UCSC.hg19)

###################################################
### GeneModel from UCSC
###################################################
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
txdb
cdslist <- cdsBy(txdb, by = "gene")
length(cdslist)
names(cdslist)[10:13]
cdslist[11:12]

txlist <- transcriptsBy(txdb, by = "gene")
length(txlist)
names(txlist)[10:13]
txlist[11:12]

cds_seqs <- extractTranscriptSeqs(Hsapiens,cdsBy(txdb, by="tx",use.names=TRUE))
cds_seqs
translate(cds_seqs)
##########################
# supportedUCSCtables(genome="hg19")
# hg19KG_txdb <- makeTxDbFromUCSC(genome = "hg19", tablename = "knownGene")
# head(getChromInfoFromUCSC("hg19"))
# saveDb(hg19KG_txdb,file = "hg19tx.sqlite")
# hg19KG_txdb <- loadDb("hg19tx.sqlite")

###################
# Extract exons and introns for a gene
###################
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
txdb

library(GenomicFeatures)
track2 <- "66008" #select a gene with entrez id
# get transcript for a given gene
track2_txs <- transcriptsBy(txdb, by="gene")[[track2]]
track2_txs
# get transcripts names
track2_tx_names <- mcols(track2_txs)$tx_name
track2_tx_names
# extract the exon region
track2_exbytx <- exonsBy(txdb,"tx",use.names=TRUE)[track2_tx_names]
elementNROWS(track2_exbytx)
# extract introns
track2_inbytx <- intronsByTranscript(txdb,use.names=TRUE)[track2_tx_names]
elementNROWS(track2_inbytx)
# get DNA sequences
library(BSgenome.Hsapiens.UCSC.hg19)
trak2_ex_seqs <- getSeq(Hsapiens,track2_exbytx) # from exons
trak2_in_seqs <- getSeq(Hsapiens,track2_inbytx) # from introns
trak2_ex_seqs[["uc002uyb.4"]]
