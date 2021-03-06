DIR=genes_2_2



cd /home/jp/eclipse-workspace/Toulouse/data/results/${DIR}/

#Rscript /home/jp/Desktop/eclipse-workspace/Toulouse/src/R/pattern-selection.R

Rscript /home/jp/Desktop/eclipse-workspace/Toulouse/src/R/geneOntologyEnrichment.R -s 1A
Rscript /home/jp/Desktop/eclipse-workspace/Toulouse/src/R/geneOntologyEnrichment.R -s 1B
Rscript /home/jp/Desktop/eclipse-workspace/Toulouse/src/R/geneOntologyEnrichment.R -s 2A
Rscript /home/jp/Desktop/eclipse-workspace/Toulouse/src/R/geneOntologyEnrichment.R -s 2B
Rscript /home/jp/Desktop/eclipse-workspace/Toulouse/src/R/geneOntologyEnrichment.R -s 3A
Rscript /home/jp/Desktop/eclipse-workspace/Toulouse/src/R/geneOntologyEnrichment.R -s 3B

print("cluster.ontology")
Rscript /home/jp/Desktop/eclipse-workspace/Toulouse/src/R/cluster.ontology.R 

stop()

cat pc9.genes.pattern1A.txt  pc9.genes.pattern2A.txt > pc9.genes.1A.2A.txt
cat pc9.genes.pattern1B.txt  pc9.genes.pattern2B.txt > pc9.genes.1B.2B.txt


cat h4.genes.pattern1A.txt  h4.genes.pattern2A.txt > h4.genes.1A.2A.txt
cat h4.genes.pattern1B.txt  h4.genes.pattern2B.txt > h4.genes.1B.2B.txt

wc -l pc9.genes.1A.2A.txt
wc -l pc9.genes.1B.2B.txt
wc -l h4.genes.1A.2A.txt
wc -l h4.genes.1B.2B.txt

#393
wc -l /home/jp/eclipse-workspace/Toulouse/data/gene.symbol.rnabindingprotein_human.csv 
grep -f /home/jp/eclipse-workspace/Toulouse/data/gene.symbol.rnabindingprotein_human.csv -Hrn /home/jp/eclipse-workspace/Toulouse/data/results/${DIR}/ | grep genes.pattern | sed -r 's/.genes.pattern/\t/' | sed -r s'/.txt:[0-9]+:/\t/' | sed -r s'/.*\///' > /home/jp/eclipse-workspace/Toulouse/data/results/majorRegulators/${DIR}_rna.tsv
awk -F "\t" '{print $3}' /home/jp/eclipse-workspace/Toulouse/data/results/majorRegulators/rna.tsv > ~/Desktop/eclipse-workspace/Toulouse/data/rna.txt

#1640
wc -l /home/jp/eclipse-workspace/Toulouse/data/gene.symbol.dnabindingprotein_human.csv 
grep -f /home/jp/eclipse-workspace/Toulouse/data/gene.symbol.dnabindingprotein_human.csv -Hrn /home/jp/eclipse-workspace/Toulouse/data/results/${DIR}/ | grep genes.pattern | sed -r 's/.genes.pattern/\t/' | sed -r s'/.txt:[0-9]+:/\t/' | sed -r s'/.*\///' > /home/jp/eclipse-workspace/Toulouse/data/results/majorRegulators/${DIR}_dna.tsv
awk -F "\t" '{print $3}' /home/jp/eclipse-workspace/Toulouse/data/results/majorRegulators/dna.tsv > ~/Desktop/eclipse-workspace/Toulouse/data/dna.txt

#430
wc -l /home/jp/eclipse-workspace/Toulouse/data/gene.symbol.chromatinRemodelers_human.csv
grep -f /home/jp/eclipse-workspace/Toulouse/data/gene.symbol.chromatinRemodelers_human.csv -Hrn /home/jp/eclipse-workspace/Toulouse/data/results/${DIR}/ | grep genes.pattern | sed -r 's/.genes.pattern/\t/' | sed -r s'/.txt:[0-9]+:/\t/' | sed -r s'/.*\///' > /home/jp/eclipse-workspace/Toulouse/data/results/majorRegulators/${DIR}_chrom.tsv
awk -F "\t" '{print $3}' /home/jp/eclipse-workspace/Toulouse/data/results/majorRegulators/chrom.tsv > ~/Desktop/eclipse-workspace/Toulouse/data/chrom.txt
