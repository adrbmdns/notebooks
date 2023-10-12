# Set up conda environment 

This is to set up on Dayhoff. 

```sh
conda create -n animal-spot
conda activate animal-spot

conda install -c conda-forge python=3.8.0
conda install pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 cudatoolkit=11.3 -c pytorch 
conda install -c conda-forge librosa=0.8.0
conda install -c conda-forge tensorboardx=2.1.0
conda install -c conda-forge matplotlib-base=3.3.3
conda install -c conda-forge pysoundfile=0.10.3.post1
conda install -c conda-forge scikit-image=0.18.1
conda install -c conda-forge six=1.15.0
conda install -c fastai opencv-python-headless=4.5.1.48
conda install -c conda-forge pillow=8.2.0
```

# Download ANIMAL-SPOT 

Simply clone the GitHub page. 

```sh
git clone https://github.com/ChristianBergler/ANIMAL-SPOT.git
```

# Download example data 

```sh

```

# Error training model

```
  File "/mnt/data/dayhoff/home/u1133824/.conda/envs/animal-spot/lib/python3.8/site-packages/numpy/__init__.py", line 305, in __getattr__
    raise AttributeError(__former_attrs__[attr])
AttributeError: module 'numpy' has no attribute 'complex'.
`np.complex` was a deprecated alias for the builtin `complex`. To avoid this error in existing code, use `complex` by itself. Doing this will not modify any behavior and is safe. If you specifically wanted the numpy scalar type, use `np.complex128` here.
The aliases was originally deprecated in NumPy 1.20; for more details and guidance see the original release note at:
    https://numpy.org/devdocs/release/1.20.0-notes.html#deprecations
```

numpy version is:

```
>>> print(np.__version__)
1.24.3
```

Install numpy version < 1.24 solved the issue. 

```sh
conda install -c conda-forge numpy=1.23.5 
```

