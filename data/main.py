import numpy as np
from scipy.optimize import linprog
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt
import pandas as pd

def get_bounds(eoh, nh_4, nh_4_initial):
    v_glc_max = 0.105 if eoh < 10.0 else max(0.04, 0.105 - 0.03 * (eoh - 10.0))
    v_nh_4_max = 0.3 if nh_4 > 0.1 else (nh_4 * 3.0)
    v_atp_min = 1.3 + (1.8 * (eoh / 12.0)) if eoh < 12.0 else 3.1

    return v_nh_4_max, v_atp_min, v_glc_max

df_stoichiometry = pd.read_csv("stoichiometry.csv", index_col=0)

T = df_stoichiometry.values

reaction_count = T.shape[1]
metabolit_count = T.shape[0]

c = np.zeros(reaction_count)
bounds = [(0, None)] * reaction_count

c[37] = - 1

y0 = [200.0, 0.3, 0.1, 0.0, 0.0] # Glicose, Amônia, Biomassa, Etanol, Glicerol [21, 22]

v_glc_max, v_nh_4_max, v_atp_min = get_bounds(y0[3], y0[1], y0[1])
bounds[0] = (0, v_glc_max)
bounds[1] = (0, v_nh_4_max)
bounds[2] = (v_atp_min, None)

result = linprog(c, A_eq=T, b_eq=np.zeros(metabolit_count), bounds=bounds, method="highs")

if result.success:
    print(result.x)
else:
    print(result.message)
