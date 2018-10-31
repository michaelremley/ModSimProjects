import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from pymodelica import compile_fmu
from pyfmi import load_fmu

mfmu = compile_fmu('code.CircuitModels.RectifierModels', 'FullBridgeRectifier.mo')

beta_sweep = np.linspace(0.1, 1, 10)

gamma_sweep = pd.Series(np.linspace(0.2, 1, 5))
gamma_legends = ('gamma value: ' + gamma_sweep.agg(str)).tolist()

for gamma in np.linspace(0.2, 1, 5):
    beta_res = pd.Series(index = beta_sweep)
    for beta in beta_sweep:
        mmodel = load_fmu(mfmu)
        mmodel.set('beta', beta)
        mmodel.set('gamma', gamma)
        res = mmodel.simulate(final_time = 14)

        beta_res[beta] = res['s'][0] - res['s'][-1]
    beta_res.plot()
plt.legend(gamma_legends)
plt.show()
    