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


> Note: Raw EBSD files (`.ang`) are not included here by default (they are often large).  
> If you add them, place them inside each condition folder or a dedicated `data/` directory.

---

## Sample conditions

- **AS**: As-printed / as-built
- **SR400**: Stress-relieved at 400 °C
- **SR450**: Stress-relieved at 450 °C
- **SR500**: Stress-relieved at 500 °C
- **SR550**: Stress-relieved at 550 °C
- **SA1100**: Solution annealed at 1100 °C

---

## Requirements

- **MATLAB** (R20xxa or newer recommended)
- **MTEX** (v6.x recommended)
- EBSD input format: **`.ang`** (hex grid supported)

---

## What the scripts generate

For each condition:
- **Ferrite (α-Fe) ODF**: φ₂ = 0°, 45°, 65°
- **Austenite (γ-Fe) ODF**: φ₂ = 0°, 45°, 65°
- Exported as high-resolution PNG (e.g., 600 dpi), suitable for manuscripts.

All scripts use:
- `calcDensity(..., 'halfwidth', 10° , 'resolution', 10°)`
- plot window: **0–90° × 0–90°** in (φ₁, Φ)
- colorbar labeled **MRD** (multiples of random distribution)

---

## How to run (MATLAB Online or Desktop)

1. Put the correct `.ang` file for the condition in the same folder as the script  
   (default expected name is `0.ang`).
2. Open the script for the condition and run it.

Example:
- Run: `MTEX MATLAB scripts/AS_hex.m`
- Output:
  - `figures/AS/AS_Ferrite_ODF_phi2_0_45_65.png`
  - `figures/AS/AS_Austenite_ODF_phi2_0_45_65.png`

---

## Common troubleshooting

### Phase name mismatch (Ferrite/Austenite not found)
The scripts include **robust phase selection** using name matching, but if yours are unusual:
- inspect `ebsd.mineralList`
- update the phase labels in the script if needed

### Orientation reference frame (EDAX/ANG conventions)
If your maps appear flipped/rotated, adjust:
- `convertEuler2SpatialReferenceFrame` setting (`setting 1` vs `setting 2`)

---

