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