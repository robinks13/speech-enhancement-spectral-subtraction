# Speech Enhancement Through Spectral Subtraction

A MATLAB speech-enhancement project that reduces additive white Gaussian noise with a frame-by-frame spectral-subtraction algorithm. The workflow estimates the noise power spectrum from initial silence frames, subtracts it from each speech frame, and reconstructs the signal with overlap-add processing.

The project also compares spectral estimators and studies how noise affects speech signals. The included report is in French.

## Results

The report evaluates the algorithm with input speech-to-noise ratios (SNRs) of 5, 10, and 15 dB.

| Input SNR | Output SNR | SNR gain |
| ---: | ---: | ---: |
| 5.0 dB | 8.6 dB | 3.6 dB |
| 10.0 dB | 13.2 dB | 3.2 dB |
| 15.0 dB | 17.8 dB | 2.8 dB |

These are the values reported for the speech sample and experiment described in the project report. The noise is randomly generated, so a new run may produce slightly different values.

## Method

- Add white Gaussian noise at a selected target SNR.
- Divide the speech signal into 512-sample frames with 50% overlap.
- Apply a Hamming window and estimate the noise power spectrum from the first five frames.
- Subtract the estimated noise power from each frame’s power spectrum, flooring negative values at zero.
- Preserve the noisy phase, apply the inverse FFT, and reconstruct the signal with overlap-add.
- Compare input and output SNR.

## Repository layout

```text
matlab/
  ts224.mlx          Main MATLAB Live Script
  ajout_bruit.m      Helper to add noise at a target SNR
docs/
  report-fr.pdf      Project report (French)
```

## Requirements and data

- MATLAB
- Signal Processing Toolbox for functions such as `pwelch`, `spectrogram`, and `hamming`
- The speech input file `fcno03fz.mat`, which is not included in this repository

The Live Script loads `fcno03fz.mat` from MATLAB’s current folder. Place an authorized speech sample with that variable name in the `matlab/` folder, then set `matlab/` as the current folder in MATLAB. Do not publish speech data unless you have permission to share it.

## Run

Open `matlab/ts224.mlx` in MATLAB and run the sections. The helper function `matlab/ajout_bruit.m` must remain on the MATLAB path.

## Scope and limitations

This is an academic signal-processing project. The evaluation reports SNR gain for the sample used in the report; it does not establish perceptual quality across speakers or environments. Spectral subtraction can also introduce musical-noise artifacts, so listening tests or additional metrics would be useful for a broader evaluation.

## Français

Projet MATLAB de rehaussement de la parole par soustraction spectrale. Le signal est traité par trames de 512 échantillons avec 50 % de recouvrement. Le rapport fourni présente des gains de RSB de 3,6 dB, 3,2 dB et 2,8 dB pour des RSB d’entrée de 5 dB, 10 dB et 15 dB. Le fichier audio source n’est pas inclus.
