
# Mapping Diffusion and Functional MRI to the Cortical Surface

## 1. Brief Introduction to Diffusion and Functional MRI

You're already quite familiar with structural MRI (sMRI), which we mainly use to study brain anatomy and macrostructure. Two other commonly used MRI modalities are diffusion MRI (dMRI) and functional MRI (fMRI). Briefly, dMRI looks at how water molecules move within brain tissue. Because this movement is influenced by tissue microstructure, we can use it to study white matter and cortical microstructural properties. The fMRI is a bit different. It measures changes in blood oxygenation over time, which indirectly reflect neural activity. We can use it to study brain activity and functional connectivity between different brain regions.

Let's briefly look at how they differ.

| | Structural MRI (sMRI) | Diffusion MRI (dMRI) | Functional MRI (fMRI) |
|---|---|---|---|
| **Data** | 3D: a single brain volume | 4D: a series of volumes acquired with different diffusion weightings and directions | 4D: a series of volumes acquired over time |
| **Imaging principle** | Measures differences in tissue relaxation properties to distinguish brain tissues | Measures the movement of water molecules in brain tissue | Measures changes in blood oxygenation (BOLD signal) associated with neural activity |
| **Applications** | Regional brain volume, cortical thickness, surface area, sulcal depth | White matter connectivity, cortical microstructure | functional connectivity |
| **Preprocessing** | Bias field correction, brain extraction | Bias field correction, brain extraction, **denoising, motion and distortion correction** | Bias field correction, brain extraction, **denoising, motion and distortion correction** |
| **Preprocessing tools** | Neonates: dHCP structural pipeline; Children and adults: FreeSurfer (`recon-all`), ciftify | FSL (TOPUP/EDDY); MRtrix SHARD; QSIPrep | dHCP fMRI pipeline; HCP fMRI pipelines; fMRIPrep |

**Understanding 4D dMRI and fMRI data:**

For dMRI, the 4th dimension represents different diffusion-weighted measurements, including different gradient directions and b-values. For fMRI, the 4th dimension represents time, allowing us to track how the brain signal changes over time.

**Preprocessing:**

One important thing to know is that **diffusion and functional MRI are usually acquired using EPI sequences, which are particularly sensitive to image distortions. So, compared with structural MRI, they usually require additional preprocessing, especially motion and distortion correction.**

### Useful References and Preprocessing Pipelines

This tutorial won't focus on dMRI/fMRI preprocessing, but here are some useful references and links to commonly used preprocessing pipelines. One thing to keep in mind is that **neonatal MRI data usually require different preprocessing pipelines from childhood and adult data**, due to differences in brain development and imaging characteristics. The pipelines listed below are widely used in neuroimaging research. They follow broadly similar principles but may differ in specific processing steps. The choice of pipeline depends on your data and research needs.

#### 1. sMRI

**Neonates:**

- Makropoulos, Antonios et al. “The developing human connectome project: A minimal processing pipeline for neonatal cortical surface reconstruction.” *NeuroImage* vol. 173 (2018): 88–112. doi:10.1016/j.neuroimage.2018.01.054      **the original dHCP structural pipeline, including drawEM segmentation, surface reconstruction and feature generation**  
  [https://github.com/biomedia/dhcp-structural-pipeline](https://github.com/biomedia/dhcp-structural-pipeline)

- Ma, Qiang et al. “The Developing Human Connectome Project: A fast deep learning-based pipeline for neonatal cortical surface reconstruction.” *Medical Image Analysis* vol. 100 (2025): 103394. doi:10.1016/j.media.2024.103394      **the deep learning-based pipeline (faster than the original one), including surface reconstruction and feature generation**  
  [https://github.com/m-qiang/dhcp-dl-neonatal](https://github.com/m-qiang/dhcp-dl-neonatal)

**Children and adults:**

- **FreeSurfer (`recon-all`):** surface reconstruction and feature generation [https://surfer.nmr.mgh.harvard.edu/fswiki/recon-all](https://surfer.nmr.mgh.harvard.edu/fswiki/recon-all)
- **ciftify:** to convert freesurfer outputs to HCP-style outputs for visualization and surface registration [https://edickie.github.io/ciftify/#/](https://edickie.github.io/ciftify/#/)

#### 2. dMRI

**Neonates:**

- Bastiani, Matteo et al. “Automated processing pipeline for neonatal diffusion MRI in the developing Human Connectome Project.” *NeuroImage* vol. 185 (2019): 750–763. doi:10.1016/j.neuroimage.2018.05.064  
  [https://git.fmrib.ox.ac.uk/matteob/dHCP_neo_dMRI_pipeline_release](https://git.fmrib.ox.ac.uk/matteob/dHCP_neo_dMRI_pipeline_release)

**Children and adults:**

- **QSIPrep:** Cieslak, Matthew et al. “QSIPrep: an integrative platform for preprocessing and reconstructing diffusion MRI data.” *Nature Methods* vol. 18,7 (2021): 775–778. doi:10.1038/s41592-021-01185-5  
  [https://github.com/PennLINC/qsiprep](https://github.com/PennLINC/qsiprep)

**General diffusion MRI preprocessing software** (Most of the neonatal and adult preprocessing pipelines listed above directly call commands from the software listed below.):

- **FSL TOPUP/EDDY:** [https://fsl.fmrib.ox.ac.uk/fsl/docs/diffusion/index.html](https://fsl.fmrib.ox.ac.uk/fsl/docs/diffusion/index.html)
- **MRtrix SHARD reconstruction:** [https://github.com/dchristiaens/shard-recon](https://github.com/dchristiaens/shard-recon)

#### 3. fMRI

**Neonates:**

- Fitzgibbon, Sean P et al. “The developing Human Connectome Project (dHCP) automated resting-state functional processing framework for newborn infants.” *NeuroImage* vol. 223 (2020): 117303. doi:10.1016/j.neuroimage.2020.117303  
  [https://git.fmrib.ox.ac.uk/seanf/dhcp-neonatal-fmri-pipeline](https://git.fmrib.ox.ac.uk/seanf/dhcp-neonatal-fmri-pipeline)

**Children and adults: Both pipelines follow broadly similar fMRI preprocessing steps**

- **HCP fMRI pipeline:** Supports preprocessing of multiple MRI modalities, including structural and functional MRI.
  Glasser, Matthew F et al. “The minimal preprocessing pipelines for the Human Connectome Project.” NeuroImage vol. 80 (2013): 105-24. doi:10.1016/j.neuroimage.2013.04.127   [https://github.com/Washington-University/HCPpipelines](https://github.com/Washington-University/HCPpipelines)

- **fMRIPrep:** Focuses on functional MRI preprocessing
  Esteban, Oscar et al. “fMRIPrep: a robust preprocessing pipeline for functional MRI.” *Nature Methods* vol. 16,1 (2019): 111–116. doi:10.1038/s41592-018-0235-4  
  [https://github.com/poldracklab/fmriprep](https://github.com/poldracklab/fmriprep)

## 2. Volume-to-Surface Mapping

