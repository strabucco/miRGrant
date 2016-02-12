#compare 5 lists of mircoRNAs to see which are common among lists
#start by importing librarys and file to use
library(dplyr)
#process data to remove undesired characters
lists<-read.csv("miRSum.csv")
lists[,1:5]<-lapply(lists[,1:5], FUN=function(x) gsub("\\*","", x))
lists[,1:5]<-lapply(lists[,1:5], FUN=function(x) gsub("#", "", x))
lists[,1:5]<-lapply(lists[,1:5], FUN=function(x) gsub("-3p", "", x))
lists[,1:5]<-lapply(lists[,1:5], FUN=function(x) gsub("-5p", "", x))


#intersect each list together to find 2 list overlap
#Petriv compared with all lists
PetrivXGuo<-intersect(lists$PNAS.2010.QPCR.Petriv, lists$PNSA.2010.Guo.Capture.GSE22450)
PetrivXGSE<-intersect(lists$PNAS.2010.QPCR.Petriv, lists$Genome.Biol.2011.QOCR.GSE28036)
PetXSu<-intersect(lists$PNAS.2010.QPCR.Petriv, lists$Nat.Commu.2013.Su.GSE45882..10.TPM)
petXImm<-intersect(lists$PNAS.2010.QPCR.Petriv, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)
#Guo compared with all other lists
GuoXGSE<-intersect(lists$PNSA.2010.Guo.Capture.GSE22450, lists$Genome.Biol.2011.QOCR.GSE28036)
GuoXSU<-intersect(lists$PNSA.2010.Guo.Capture.GSE22450, lists$Nat.Commu.2013.Su.GSE45882..10.TPM)
GuoXImm<-intersect(lists$PNSA.2010.Guo.Capture.GSE22450, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)
#GenomeBio paper compared with all other lists
GSEXSU<-intersect(lists$Genome.Biol.2011.QOCR.GSE28036, lists$Nat.Commu.2013.Su.GSE45882..10.TPM)
GSEXImm<-intersect(lists$Genome.Biol.2011.QOCR.GSE28036, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)
#Su to Immunol paper
SuXImm<-intersect(lists$Nat.Commu.2013.Su.GSE45882..10.TPM, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)
#intersect 2 list overlap to each other list to find 3 list overlap and repeat until all lists compared

#Petrive and Guo compared with all others
PetXGuoXGSE<-intersect(PetrivXGuo, lists$Genome.Biol.2011.QOCR.GSE28036)
PetXGuoXSu<-intersect(PetrivXGuo, lists$Nat.Commu.2013.Su.GSE45882..10.TPM)
PetXGuoXImm<-intersect(PetrivXGuo, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)
#Petriv and Genome bio compared with all others
PetXGseXSu<-intersect(PetrivXGSE, lists$Nat.Commu.2013.Su.GSE45882..10.TPM)
PetXGseXImm<-intersect(PetrivXGSE, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)
#Petriv, Su, and immuno compared
PetXSuXImm<-intersect(PetXSu, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)

#Guo and genome bio compared with all others

GuoXGseXSu<-intersect(GuoXGSE, lists$Nat.Commu.2013.Su.GSE45882..10.TPM)
GuoXGseXImm<-intersect(GuoXGSE, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)

#Guo, Su, and immuno
GuoXSuXImm<-intersect(GuoXSU, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)

#Genome bio, Su, Immuno
GSEXSuXImm<-intersect(GSEXSU, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)

#Petriv, Guo, Genome Bio and others compared 4 way
PetGuoGseXSu<-intersect(PetXGuoXGSE, lists$Nat.Commu.2013.Su.GSE45882..10.TPM)
PetGuoGseXImm<-intersect(PetXGuoXGSE, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)

#Petriv, Genome Bio, Su, and Imm
PetGseSuXImm<-intersect(PetXGseXSu, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)
PetGuoSuXImm<-intersect(PetXGuoXSu, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)

#Guo, genome bio, Su, and imm

GuoGseSuXImm<-intersect(GuoXGseXSu, lists$Immunol.cell.biol.2015.GSE57442..10.RPM)




