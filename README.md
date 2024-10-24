## Re-analysis of mobile mRNA datasets raises questions about the extent of long-distance mRNA communication

In this study we used the following published datasets, including the archived reads from NCBI as follows. _Cuscuta pentagona_ [1](https://www.science.org/doi/10.1126/science.1253122): PRJNA257158. This dataset was incomplete and partly corrupt. _Vitis vinifera_ [2](https://link.springer.com/article/10.1186/s12870-015-0626-y): SRP058158 and SRP058157. _Solanum lycopersicum_, _Nicotiana benthamiana_ [3](https://pubmed.ncbi.nlm.nih.gov/29720554/): SRP111187. _Arabidopsis thaliana_ [4](https://www.nature.com/articles/nplants201525): PRJNA271927. _Citrullus lanatus L._ [5](https://www.nature.com/articles/s41438-019-0236-1): PRJNA553072. We also used the deposited Supplementary datasets to obtain the numbers of identified mRNAs. For each of the graft studies, we downloaded the reference genome sequence that matched the one that was used in the original paper with the same annotations; these were all publicly available in Ensembl plants [6](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8728113/). The raw reads were mapped to the references using hisat2 (v.2.1.0) [7](https://www.nature.com/articles/s41587-019-0201-4), and processed by samtools (v1.9) [8](https://academic.oup.com/gigascience/article/10/2/giab008/6137722), the expression levels were quantified with Stringtie (v1.3.5) [9](https://www.nature.com/articles/nprot.2016.095). The variants were called with bcftools (v1.10.2) [8](https://academic.oup.com/gigascience/article/10/2/giab008/6137722)) using ```bcftools mpileup -A -q 0 -Q 0 -B -d 500000 –annotate FORMAT/AD, FORMAT/ADF, FORMAT/ADR, FORMAT/DP, FORMAT/SP, INFO/AD, INFO/ADF, INFO/ADR’.``` The NCBI nucleotide database was downloaded on (21/Oct/2022) and (blast+ v2.9.0) [10](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-10-421) was for alignments. The resulting vcf files from these pipelines were then analysed as detailed in the jupyter notebooks below.
Probabilities of errors were calculated from a standard binomial distribution. The statistical comparison of error rates was performed
using baymobil [11](https://royalsocietypublishing.org/doi/10.1098/rsif.2022.0644) [12](https://europepmc.org/article/ppr/ppr616564).

List of figures / tables:

- [Table 1](Jupyter_notebooks/Table1.ipynb): Total numbers of reported mobile mRNAs in Arabidopsis thaliana (2) and Vitis girdiana (3) that can be explained by expected sequencing noise.
- [Figure 1](Jupyter_notebooks/Figure2.ipynb): The distributions of nucleotides at SNP and non-SNP positions can be informative for evaluating the evidence for the alternate allele.
- [Supplemental Fig. S1](R_code/): Published criteria for defining mobile mRNAs based on absolute read counts suffer from read-depth dependencies.
- [Supplemental Fig. S6](R_code/): The uncertainty in the determination of the error rate depends on the read depth.
- [Supplemental Fig. S7](R_code): Most SNPs in mobile mRNAs do not have evidence for the alternate allele.
- [Supplemental Fig. S8](R_code): Overlay of the ratios of nucleotides at SNP and non-SNP position.
- [Supplemental Fig. S9](R_code): Some datasets exhibit features that can be interpreted either as non-selective whole transcriptome movement or contamination. 
- [Supplemental Fig. S 10](R_code): Genome assembly incompleteness can lead to mapping challenges that may result in the identification of non-mobile transcripts being defined as mobile.

  References:
1. Kim, G., LeBlanc, M. L., Wafula, E. K., DePamphilis, C. W., & Westwood, J. H. (2014). Genomic-scale exchange of mRNA between a parasitic plant and its hosts. Science, 345(6198), 808-811.
2. Yang Y, et al. (2015) Messenger RNA exchange between scions and rootstocks in grafted grapevines. BMC Plant Biology 15(1):251.
3. Xia C, et al. (2018) Elucidation of the Mechanisms of Long-Distance mRNA Movement in a Nicotiana benthamiana/Tomato Heterograft System. Plant Physiology 177(2):745–758.
4. Thieme CJ, et al. (2015) Endogenous Arabidopsis messenger RNAs transported to distant tissues. Nature Plants 1(4):15025.
5. Wang Y, et al. (2020) A universal pipeline for mobile mrna detection and insights into heterografting advantages under chilling stress. Horticulture Research 7(1):13.
6. Yates A, et al. (2021) Ensembl Genomes 2022: an expanding genome resource for non-vertebrates. Nucleic Acids Research 50(D1):D996–D1003.
7. Kim D, Paggi JM, Park C, Bennett C, Salzberg SL (2019) Graph-based genome alignment and genotyping with HISAT2 and HISAT-genotype. Nature Biotechnology 37(8):907–915.
8. Danecek P, et al. (2021) Twelve years of SAMtools and BCFtools. GigaScience 10(2). giab008.
9. Pertea M, Kim D, Pertea GM, Leek JT, Salzberg SL (2016) Transcript-level expression analysis of RNA-seq experiments with HISAT, StringTie and Ballgown. Nature Protocols 11(9):1650–1667.
10. Camacho C, et al. (2009) BLAST+: architecture and applications. BMC Bioinformatics 10(1):421.
11. Tomkins M, et al. (2022) Exact Bayesian inference for the detection of graft-mobile transcripts from sequencing data. Journal of The Royal Society Interface 19(197):20220644.
12. Hoerbst F, Morris RJ, Melissa T (2023) baymobil: A Python package for detection of graft-mobile mRNA using exact Bayesian inference on RNA-Seq data.
