# fcs-file-renamer

A small R utility to rewrite the **internal metadata of `.fcs` (flow cytometry) files** so that
the embedded `$FIL` keyword matches the actual file name on disk.

## Why
FCS files store the original acquisition name in their metadata (`$FIL`). After renaming files
on disk this metadata becomes stale, which breaks downstream tools (e.g. FlowJo, `flowCore`)
that read the internal name. This script keeps the two in sync.

## Usage
```r
source("rename_FCS_files.R")
# Point the script at a folder of .fcs files; it reads each file,
# updates the $FIL keyword to the current filename, and writes it back.
```
Requires the [`flowCore`](https://bioconductor.org/packages/flowCore/) Bioconductor package.

## Example data
`input/Unstained.fcs` is a small unstained-control file included so the workflow can be run
end-to-end; output is written to `output/`.

---
Author: **Dillon Corvino** · [dilloncorvino.com](https://dilloncorvino.com)
