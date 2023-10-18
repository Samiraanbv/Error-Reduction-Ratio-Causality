# Error-Reduction-Ratio-Causality

# Error-Reduction-Ratio Causality (ERRC) for Causality Identification in Human EEG Signal

This repository discusses a robust causality identification method, known as error-reduction-ratio causality (ERRC), applied to human EEG signals. ERRC stands out from the conventional Granger method by efficiently identifying causality between time-varying signals, be they linear or non-linear, without necessitating a complete non-linear model. The article presents two numerical simulation examples to underscore the method's effectiveness, including its superior performance over NGC and LGC methods at low SNRs, particularly in the presence of noise.

The relevance of identifying causality cannot be overstated, especially in the context of diagnostics and assistance for individuals with Sere disease, a prevalent neurological condition affecting approximately 1% of the global population. Various methods have been employed to discern causality in diabetes. However, blindly utilizing linear and non-linear methods often proves ineffective. Herein lies the significance of the ERRC method—it discerns causality irrespective of whether a linear or non-linear pattern underpins the cause and effect relationship.

# ERRC Method
Let's consider two zero-mean signals, X={x(t)}, and Y={y(t)}, where t=1,...,M representing the signal's length, denoted by M. Assume that x(t) and y(t) are effectively modeled by the lth-order Volterra model, encompassing various delay combinations denoted by 'd'.

pic1

so that bl(k1,...,kl) are the kernels of the Volterra model. To use OLS, the signal y(t) can be modeled as a linear form.

pic2

N is the total number of model parameters that are involved in building the model, Ɵ<sub>i</sub> is the unknown parameters of the model, and ɸ<sub>i</sub>(t) are the terms of the model that are created by the combination of different delays.
Pic3

By making a bowl of regressors, you can now use the OLS algorithm to select the most important terms of the model to build the model. For this purpose, an index called ERR is used in the OLS algorithm. This index determines in percentage terms how much The increase of a certain term is reduced to the estimation variance model. Deciding where to cut off the selection of regressors depends on the nature of the data and must be carefully determined, especially when the amount of data noise is uncertain, because if the terms are selected more than the number required for the model in that particular data, over parameterization is possible. to happen, and in other words, let's start modeling noise because noise is a random process and a different realization of noise appears in each data, and modeling noise takes us away from correct and fundamental modeling of the nature of data.

The method proposed in the article to stop the regressor search is the penalized error-to-signal ratio (PESR) method.

Pic4

The algorithm used to calculate ERRC is given and it is implemented using this algorithm:

pic5

# Statistical Significance:
In order to assess the significance of causality between two signals, a time-varying threshold is statistically determined, representing a 5% probability of attributing causality to a random signal. During implementation, the ERRC method was applied to the signal y(t) and random data generated between the range of 0 to 1 to calculate the surrogate threshold. This process was repeated 150 times across all noise levels, and the results (ERRC values) were averaged. Subsequently, a line was fitted to the surrogate threshold values, allowing for the determination of the ERRC significance threshold to identify causality.

# Implementation:
In the initial example, we applied the ERRC method to simulated data with a linear causality model. We then compared its performance against two NGC methods, which estimate linear causality, and an NGC method that estimates non-linear causality. This allowed us to investigate the effectiveness of these methods in identifying causality for data with varying levels of noise (SNR). Ultimately, the results demonstrated that the ERRC method outperformed the other two methods, particularly in successfully identifying causality at higher noise levels (lower SNR).
the synthetised data:

pic6

the determined d parameter here is 2.
The variance of signal noise x(t) is 0.1 and the variance of signal noise y(t) is set according to different values ​​of SNR which is from -70 to 60dB. The causality results for each SNR value of signal y(t) are calculated 150 times and This is 150 times obtained from mediation.

# Results:
After performing 150 ERRC calculations for various SNR values and calculating their averages, we plotted the results as blue dots. Subsequently, we fitted a 10th-order function to these values, resulting in the creation of the red graph. The ERRC values were found to be statistically significant at an SNR of approximately -58dB, aligning with the value reported in the article (Figure 1.c). In contrast, the NGC and LGC methods exhibited significance at higher SNR values (4dB and -29dB, respectively). This comparison highlights the ERRC method's superior effectiveness in identifying causality compared to the mentioned methods.

pic7
