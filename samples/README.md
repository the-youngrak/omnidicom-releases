# Free synthetic DICOM CT sample

A small practice dataset for learning DICOM workflows without patient data: **24 generated CT slices of a geometric cylinder**, 128 × 128 pixels each, in one series.

**[Download the synthetic CT sample (ZIP)](https://omnidicom.com/omnidicom-synthetic-ct.zip)**

The sample download is free and requires no account. It is separate from the OmniDICOM application's 14-day trial and paid licences.

## Practice workflow

1. Download and unzip the archive. Keep the 24 `.dcm` files together in their folder.
2. Open the folder in OmniDICOM and wait for loading to finish.
3. Check that the series has 24 images, then scroll through them.
4. Make a second copy of the folder before metadata editing. Find **Series Description**, edit its value, select **Save Changes**, then reopen the copy to check that it was saved.
5. Keep the untouched folder if you want to repeat the exercise.

[Install OmniDICOM on Mac or Windows](https://omnidicom.com/#download) · [Metadata editing guide](https://omnidicom.com/edit-dicom-metadata) · [Export guide](https://omnidicom.com/export-dicom-images-video)

## What the sample represents

The images and identifying fields are generated test data. The patient label `TEST^HARNESS` and ID `TH001` do not describe a person. This is a simple geometric phantom, not realistic anatomy, a patient scan, or evidence of compatibility with every DICOM dataset.

It is **not for diagnosis, clinical use, quantitative calibration or image-quality benchmarking**. Changing identifying fields alone is not full DICOM anonymization.

This sample and these guides are provided by the developer of OmniDICOM. No testimonials, clinical validation or third-party endorsement are implied.
