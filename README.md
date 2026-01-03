# MTEX/MATLAB scripts and exported texture figures for EBSD-based orientation distribution function (ODF) analysis of Laser Powder Bed Fusion (LPBF) Super Duplex Stainless Steel (SDSS) 2507.

This repository is organized for **reproducible texture processing**: each sample condition has a dedicated MTEX script that (i) loads the `.ang` file, (ii) computes phase-specific ODFs for ferrite (α-Fe) and austenite (γ-Fe), (iii) plots **φ₂ sections at 0°, 45°, 65°**, and (iv) exports publication-ready PNG figures.

---

## Repository structure

L-PBF_SDSS/
├─ MTEX MATLAB scripts/ # MTEX scripts (one per condition)
│ ├─ AS_hex.m
│ ├─ SR400_hex.m
│ ├─ SR450_hex.m
│ ├─ SR500_hex.m
│ ├─ SR550_hex.m
│ └─ SA1100_hex.m
│
├─ figures/ # Exported images (auto-generated)
│ ├─ AS/
│ ├─ SR400/1h
│ ├─ SR450/1h
│ ├─ SR500/1h
│ ├─ SR550/1h
│ └─ SA1100/15 minutes
│
└─ README.md

