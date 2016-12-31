Query by Singing/Humming
---
A Query by Singing/Humming approach (QbSH) approach using Dynamic Time Warping (DTW). Workflow tutorial:

1. Download and extract the MIR-QBSH dataset and place it under `src/datasets/MIR-QBSH-corpus/`.
2. Change working directory to `src/`
3. Execute `create_dbs.sh` in order to extract the `.midi` and `.wave` pitch vectors and store them in the corresponding pickle files.
4. Execute the following:

```
./search.py --normalize --pickle-whole --database "./midi.pickle" "./wave.pickle"
```

This should iterate every element in `wave.pickle`, normalize it (maybe we should change this, as it isn't really normalization) and try to find the best matches for it in `midi.pickle`.  The MIDI pitch vectors remain unchanged and all of the preprocessing refers to the input query pitch vector. This workflow creates once the pitch vectors databases, which is a very time-consuming task, and performs normalization/preprocessing of the input query in run-time, allowing easier experimentation. Most of this approach has been adapted from [this](http://ics.p.lodz.pl/~basta/pre-prints/Stasiak_AoA_2014.pdf). The MIR dataset is preferred because it guarantees that all input queries start from the beginning, as it states:

> All queries are from the beginning of references.

IOACAS on the other hand, states:

> No guarantee for each humming starts from the beginning of the songs.

We consider a match if for each query, the ground truth is contained in the top ten matches sorted by DTW score. Thus, in the MIR corpus we were able to achieve an accuracy of 56.6% with a sample size of 988 queries. The percentage of best hits was 20.6%. Detailed log [here](http://pastebin.com/9XXu2Gmg).