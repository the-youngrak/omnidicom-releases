# OmniDICOM — DICOM Viewer & Metadata Editor for Mac and Windows

Open, compare, measure and edit DICOM studies in a desktop workspace built for **research and education**. This is the official OmniDICOM download repository, maintained by the product's developer.

**[Download OmniDICOM](https://omnidicom.com/#download) · [Try the free synthetic CT sample](samples/README.md) · [Read the practical guides](https://omnidicom.com/guides)**

![OmniDICOM metadata editor displaying a synthetic test study](https://omnidicom.com/img/metadata-editor.png)

*Actual application capture with synthetic data. Toolbar layout can vary by version.*

## Download and start a trial

| Your computer | Official installer | Requirements |
|---|---|---|
| Mac | [Download for macOS (.pkg)](https://omnidicom.com/download/mac?src=github) | Apple silicon, macOS 13 or later; Developer ID signed and notarized |
| Windows | [Download for Windows (.exe)](https://omnidicom.com/download/windows?src=github) | 64-bit Windows 10/11; Authenticode signed by Youngrak Choi |

Open the installer and follow its prompts. The **14-day Professional trial starts on first launch**; connect to the internet for that first launch. No payment card is required. Trial image exports are watermarked. Continued use requires a paid licence; [current plans and prices](https://omnidicom.com/pricing) are on the official website.

The buttons above always point to the current public release. [Versioned installers and SHA-256 checksums](https://github.com/the-youngrak/omnidicom-releases/releases) remain available for verification. On Windows, if SmartScreen or Edge shows a warning, [read the installation and signature-check instructions](https://omnidicom.com/#windows-warning).

## What you can do

| Task | Included capability |
|---|---|
| Open and organize studies | DICOM folders, DICOMDIR, ZIP archives and multi-frame studies; local archive |
| View and compare | Window/level, zoom, pan, cine playback and synchronized layouts |
| Edit DICOM metadata | Search tag names and values, edit supported fields and save across the selected series |
| Measure | Distances, angles, regions of interest and regional statistics |
| Explore volumes | Multiplanar reconstruction (MPR), MIP, 3D volume rendering and volume cutting |
| Review angiography | DSA subtraction and mask alignment tools |
| Transfer studies | PACS and DICOMweb connectivity |
| Export | DICOM, PNG/JPEG/BMP images and supported MP4/WMV video workflows |

Basic includes the viewer workflows above. Professional adds advanced processing and quantitative analysis. See the [full feature overview](https://omnidicom.com/#capabilities) for plan details and current availability.

**Metadata edits save in place.** Make a copy first when you need the original files. Editing a patient name or ID is not a complete anonymization procedure.

## Start without patient data

The [free practice sample](samples/README.md) contains **24 synthetic CT slices** of a geometric phantom, not a patient scan. Use it to learn folder opening, scrolling and metadata editing before working with your own research data.

- [Open DICOM files on a Mac](https://omnidicom.com/open-dicom-mac) — installation and first-study steps; the in-app folder workflow also applies to Windows.
- [Edit and save DICOM metadata](https://omnidicom.com/edit-dicom-metadata) — work on a copy, edit a supported tag and reopen to verify.
- [Export DICOM images and cine video](https://omnidicom.com/export-dicom-images-video) — choose the scope, format and destination.
- [Full user manual](https://omnidicom.com/manual).

## Local workflow and intended use

Image viewing and processing happen locally. Licence activation and periodic validation require an internet connection; PACS transfers use the destinations you select. Read the [privacy policy](https://omnidicom.com/privacy) for details, including update checks.

**Research and educational use only. Not for diagnosis, treatment or clinical decisions.** This sample is not a diagnostic or image-quality benchmark.

## Support and licensing

- [Support and contact](https://omnidicom.com/contact) — include the app version, operating system and error message. Do not include patient data in an initial support request.
- [Terms](https://omnidicom.com/terms) · [Refund policy](https://omnidicom.com/refund).

OmniDICOM is proprietary software. **This repository hosts public installers and documentation; the application source code is not published here.**
