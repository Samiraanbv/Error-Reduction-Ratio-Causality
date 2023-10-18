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
ح
\هز3
حهز3
$$
x(t) = a \cdot \sin(\omega t) + b \cdot \cos(\omega t)
$$

$$
\int_{-\infty}^{\infty} e^{-x^2} \, dx = \sqrt{\pi}
$$

$$
\frac{\partial u}{\partial t} = h^2 \left(\frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} + \frac{\partial^2 u}{\partial z^2}\right)
$$

$$
F(s) = \int_{0}^{\infty} e^{-st} f(t) \, dt
$$

$$
\lim_{{x \to \infty}} \frac{1}{x} = 0
$$

Ɵ<sub>2</sub>O
