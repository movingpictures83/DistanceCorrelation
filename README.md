# DistanceCorrelation
# Language: R
# Input: CSV (abundances)
# Output: CSV (correlation values) 

PluMA plugin that computes Distance Correlation (Szekely, 2005) as an estimate of multivariate independence.
Input is expected in the form of a CSV file.  Output will be a correlation matrix, also in CSV format,
where entry (i, j) is the distance correlation between rows i and j of the input matrix.

