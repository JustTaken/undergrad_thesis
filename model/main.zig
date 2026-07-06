const std = @import("std");

pub fn main() void {
	std.debug.print("Hello world\n", .{});
}

test "Hello world" {
	return error.Testing;
}

const real = f32;

const Variables = struct {
	var: Variable;
	flux: Flux;
	nitrogen: Nitrogen;
	carbon: Carbon;
	yield: Yield;
	k: Constk;
	K: ConstK;
	soluble: Soluble;
	soluble_in: SolubleIn;
	particulate: Particulate;
	particulate_in: ParticulateIn;
	ph: Ph;
	rate: Rate;
	inhibition: Inhibition;
	pressure: Pressure;
	differential: Differential;

	fn init() Variables {
		const variables =
		const variable = Variable {
			.E = 2.71828,
			.R = 0.083145,
			.T_base = 298.15,
			.T_ad = 308.15,
			.T_op = 308.15,
			.P_atm = 1.013,

			.V_ad_liq = 3400,
			.V_ad_gas = 300,
			.Q_ad = 170.0,
			.Q_gas = 0.0,
			.Q_ch4 = 0.0,
		};

		const frac: real = (1.0 / variable.T_base - 1.0 / variable.T_ad);

		const pressure = Pressure {
			.p_gas_h2o = 0.0313 * exp(5290.0 * frac),
			.p_gas_h2 = 0.0,
			.p_gas = 0.0,
			.p_gas_ch4 = 0.0,
			.p_gas_co2 = 0.0,
		};

		const flux = Flux {
			.f_SI_c = 0.10,
			.f_XI_c = 0.20,
			.f_ch_c = 0.20,
			.f_pr_c = 0.20,
			.f_li_c = 0.30,
			.f_fa_li = 0.95,
			.f_h2_aa = 0.06,
			.f_va_aa = 0.23,
			.f_bu_aa = 0.26,
			.f_pro_aa = 0.05,
			.f_ac_aa = 0.40,
			.f_h2_su = 0.19,
			.f_bu_su = 0.13,
			.f_pro_su = 0.27,
			.f_ac_su = 0.41,
			.f_pro_c4 = 0.54,
			.f_ac_fa = 0.7,
			.f_ac_pro = 0.57,
			.f_ac_c4_8 = 0.31,
			.f_ac_c4_9 = 0.8,
			.f_h2_fa = 0.30,
			.f_h2_c4_8 = 0.15,
			.f_h2_c4_9 = 0.20,
			.f_h2_pro = 0.43,
		};

		const nitrogen = Nitrogen {
			.N_c = 0.0376 / 14.0,
			.N_I = 0.06 / 14.0,
			.N_aa = 0.0070,
			.N_bac = 0.08 / 14,
		};

		const carbon = Carbon {
			.C_c = 0.02786,
			.C_SI = 0.03,
			.C_ch = 0.0313,
			.C_li = 0.022,
			.C_XI = 0.03,
			.C_su = 0.0313,
			.C_aa = 0.03,
			.C_fa = 0.0217,
			.C_bu = 0.025,
			.C_pro = 0.0268,
			.C_ac = 0.0313,
			.C_bac = 0.0313,
			.C_va = 0.024,
			.C_ch4 = 0.0156,
		};

		const yield = Yield {
			.Y_su = 0.10,
			.Y_aa = 0.08,
			.Y_fa = 0.06,
			.Y_c4 = 0.06,
			.Y_pro = 0.04,
			.Y_ac = 0.05,
			.Y_h2 = 0.06,
		};

		const k = Constk {
			.k_dis = 0.5,
			.k_hyd_ch = 10,
			.k_hyd_pr = 10,
			.k_hyd_li = 10,
			.k_m_su = 30,
			.k_m_aa = 50,
			.k_m_fa = 6,
			.k_m_c4 = 20,
			.k_m_pro = 13,
			.k_m_ac = 8,
			.k_m_h2 = 35,
			.k_dec_Xsu = 0.02,
			.k_dec_Xaa = 0.02,
			.k_dec_Xfa = 0.02,
			.k_dec_Xc4 = 0.02,
			.k_dec_Xpro = 0.02,
			.k_dec_Xac = 0.02,
			.k_dec_Xh2 = 0.02,
			.k_p = 5 * pow(10.0, 4.0),
		};

		const K = constK {
			.K_A_Bva = pow(10.0, 10.0),
			.K_A_Bbu = pow(10.0, 10.0),
			.K_A_Bpro = pow(10.0, 10.0),
			.K_A_Bac = pow(10.0, 10.0),
			.K_A_Bco2 = pow(10.0, 10.0),
			.K_A_BIN = pow(10.0, 10.0),
			.K_La = 200.0,
			.K_S_IN = pow(10.0, -4.0),
			.K_S_su = 0.5;,
			.K_S_aa = 0.3,
			.K_S_fa = 0.4,
			.K_I_h2_fa = 5 * pow(10.0, -6.0),
			.K_S_c4 = 0.2,
			.K_I_h2_c4 = pow(10, -5),
			.K_S_pro = 0.1,
			.K_I_h2_pro = 3.5 * pow(10.0, -6.0),
			.K_S_ac = 0.15,
			.K_I_nh3 = 0.0018,
			.K_S_h2 = 7 * pow(10, -6),
			.K_w = pow(10, -14.0) * exp((55900.0 / (100.0 * var[R])) * frac),
			.K_a_va = pow(10.0, -4.86),
			.K_a_bu = pow(10.0, -4.82),
			.K_a_pro = pow(10.0, -4.88),
			.K_a_ac = pow(10.0, -4.76),
			.K_a_co2 = pow(10.0, -6.35) * exp((7646.0 / (100.0 * var[R])) * frac),
			.K_a_IN = pow(10.0, -9.25) * exp((51965.0 / (100.0 * var[R])) * frac),
			.K_H_co2 = 0.035 * exp((-19410.0 / (100.0 * var[R]))* frac),
			.K_H_ch4 = 0.0014 * exp((-14240.0 / (100.0 * var[R])) * frac),
			.K_H_h2 = 7.8 * pow(10.0, -4) * exp(-4180.0 / (100.0 * var[R]) * frac),
		};

		const soluble_in = Soluble {
			.S_su = 0.01,
			.S_aa = 0.001,
			.S_fa = 0.001,
			.S_va = 0.001,
			.S_bu = 0.001,
			.S_pro = 0.001,
			.S_ac = 0.001,
			.S_h2 = 10e-8,
			.S_ch4 = 10e-5,
			.S_IC = 0.04,
			.S_IN = 0.01,
			.S_I = 0.02,
			.S_cat = 0.04,
			.S_an = 0.02,
			.S_H_ion = 1.0,
			.S_va_ion = 0.0,
			.S_bu_ion = 0.0,
			.S_pro_ion = 0.0,
			.S_ac_ion = 0.0,
			.S_hco3_ion = 0.0,
			.S_co2 = 0.0,
			.S_nh3 = 0.0,
			.S_nh4_ion = 0.0,
			.S_gas_h2 = 0.0,
			.S_gas_ch4 = 0.0,
			.S_gas_co2 = 0.0,
		};

		const particulate_in = Particulate {
			.X_c = 2.0,
			.X_ch = 5.0,
			.X_pr = 20.0,
			.X_li = 5.0,
			.X_su = 0.0,
			.X_aa = 0.01,
			.X_c4 = 0.01,
			.X_pro = 0.01,
			.X_ac = 0.01,
			.X_h2 = 0.01,
			.X_I = 25.0,
		};

		const soluble = Soluble {
			.S_su = 0.012394,
			.S_aa = 0.0055432,
			.S_fa = 0.10741,
			.S_va = 0.012333,
			.S_bu = 0.014003,
			.S_pro = 0.017584,
			.S_ac = 0.089315,
			.S_h2 = 2.51e-07,
			.S_ch4 = 0.05549,
			.S_IC = 0.095149,
			.S_IN = 0.094468,
			.S_I = 0.13087,
			.S_cat = 1.08e-47,
			.S_an = 0.0052101,
			.S_H_ion = 5.46e-08,
			.S_va_ion = 0.012284,
			.S_bu_ion = 0.013953,
			.S_pro_ion = 0.017511,
			.S_ac_ion = 0.089035,
			.S_hco3_ion = 0.08568,
			.S_co2 = S[S_IC] - S[S_hco3_ion],
			.S_nh3 = 0.001884,
			.S_nh4_ion = S[S_IN] - S[S_nh3],
			.S_gas_h2 = 1.10e-05,
			.S_gas_ch4 = 1.6535,
			.S_gas_co2 = 0.01354,
		};

		const particulate = Particulate {
			.X_c = 0.10792,
			.X_ch = 0.020517,
			.X_pr = 0.08422,
			.X_li = 0.043629,
			.X_su = 0.31222,
			.X_aa = 0.93167,
			.X_fa = 0.33839,
			.X_c4 = 0.33577,
			.X_pro = 0.10112,
			.X_ac = 0.67724,
			.X_h2 = 0.28484,
			.X_I = 17.2162,
		};

		const pH = Ph {
			.pH_UL_aa = 5.5,
			.pH_LL_aa = 4.0,
			.pH_UL_ac = 7.0,
			.pH_LL_ac = 6.0,
			.pH_UL_h2 = 6.0,
			.pH_LL_h2 = 5.0,
		};

		const inhibition = Inhibition {
			.I_IN_lim = 0.0,
			.I_h2_fa = 0.0,
			.I_h2_c4 = 0.0,
			.I_h2_pro = 0.0,
			.I_nh3 = 0.0,
			.I_pH_aa = 0.0,
			.I_pH_ac = 0.0,
			.I_pH_h2 = 0.0,
		};

		const differential = Differential {
			.D_S_va_ion = 0.0,
			.D_S_bu_ion = 0.0,
			.D_S_pro_ion = 0.0,
			.D_S_ac_ion = 0.0,
			.D_S_hco3_ion = 0.0,
			.D_S_nh3 = 0.0,
			.D_S_co2 = 0.0,
			.D_S_H_ion = 0.0,
			.D_S_nh4_ion = 0.0,
		};

		Variables variables = {
			.var = var,
			.f = f,
			.N = N,
			.C = C,
			.Y = Y,
			.k = k,
			.K = K,
			.S = S,
			.S_in = S_in,
			.X = X,
			.X_in = X_in,
			.pH = pH,
			.rate = rate,
			.I = I,
			.p = p,
			.D = D,
		};

		return variables;
	}
};

const Flux = struct {
	SI_c: real,
	XI_c: real,
	ch_c: real,
	pr_c: real,
	li_c: real,
	fa_li: real,
	h2_aa: real,
	va_aa: real,
	bu_aa: real,
	pro_aa: real,
	ac_aa: real,
	h2_su: real,
	bu_su: real,
	pro_su: real,
	ac_su: real,
	pro_c4: real,
	ac_fa: real,
	ac_pro: real,
	ac_c4_8: real,
	ac_c4_9: real,
	h2_fa: real,
	h2_c4_8: real,
	h2_c4_9: real,
	h2_pro: real,
};

const Nitrogen = struct {
	N_c: real,
	N_I: real,
	N_aa: real,
	N_bac: real,
};

const Carbon = struct {
	C_c: real,
	C_SI: real,
	C_ch: real,
	C_li: real,
	C_pr: real,
	C_XI: real,
	C_su: real,
	C_aa: real,
	C_fa: real,
	C_bu: real,
	C_pro: real,
	C_ac: real,
	C_bac: real,
	C_va: real,
	C_ch4: real,
};

const Yield = struct {
	Y_su: real,
	Y_aa: real,
	Y_fa: real,
	Y_c4: real,
	Y_pro: real,
	Y_ac: real,
	Y_h2: real,
};

const Rate = struct {
	rate_1: real,
	rate_2: real,
	rate_3: real,
	rate_4: real,
	rate_5: real,
	rate_6: real,
	rate_7: real,
	rate_8: real,
	rate_9: real,
	rate_10: real,
	rate_11: real,
	rate_12: real,
	rate_13: real,
	rate_14: real,
	rate_15: real,
	rate_16: real,
	rate_17: real,
	rate_18: real,
	rate_19: real,
	rate_T_8: real,
	rate_T_9: real,
	rate_T_10: real,
};

const Constk = struct {
	k_dis: real,
	k_hyd_ch: real,
	k_hyd_pr: real,
	k_hyd_li: real,
	k_m_su: real,
	k_m_aa: real,
	k_m_fa: real,
	k_m_c4: real,
	k_m_pro: real,
	k_m_ac: real,
	k_m_h2: real,
	k_dec_Xsu: real,
	k_dec_Xaa: real,
	k_dec_Xfa: real,
	k_dec_Xc4: real,
	k_dec_Xpro: real,
	k_dec_Xac: real,
	k_dec_Xh2: real,
	k_p: real,
};

const ConstK = struct {
	K_S_IN: real,
	K_S_su: real,
	K_S_aa: real,
	K_S_fa: real,
	K_I_h2_fa: real,
	K_S_c4: real,
	K_I_h2_c4: real,
	K_S_pro: real,
	K_I_h2_pro: real,
	K_S_ac: real,
	K_I_nh3: real,
	K_S_h2: real,
	K_w: real,
	K_a_va: real,
	K_a_bu: real,
	K_a_pro: real,
	K_a_ac: real,
	K_a_co2: real,
	K_a_IN: real,
	K_A_Bva: real,
	K_A_Bbu: real,
	K_A_Bpro: real,
	K_A_Bac: real,
	K_A_Bco2: real,
	K_A_BIN: real,
	K_La: real,
	K_H_co2: real,
	K_H_ch4: real,
	K_H_h2: real,
};

const Soluble = struct {
	S_su: real,
	S_aa: real,
	S_fa: real,
	S_va: real,
	S_bu: real,
	S_pro: real,
	S_ac: real,
	S_h2: real,
	S_ch4: real,
	S_IC: real,
	S_IN: real,
	S_I: real,
	S_cat: real,
	S_an: real,
	S_H_ion: real,
	S_va_ion: real,
	S_bu_ion: real,
	S_pro_ion: real,
	S_ac_ion: real,
	S_hco3_ion: real,
	S_co2: real,
	S_nh3: real,
	S_nh4_ion: real,
	S_gas_h2: real,
	S_gas_ch4: real,
	S_gas_co2: real,
};

const Particulate = struct {
	X_c: real,
	X_ch: real,
	X_pr: real,
	X_li: real,
	X_su: real,
	X_aa: real,
	X_fa: real,
	X_c4: real,
	X_pro: real,
	X_ac: real,
	X_h2: real,
	X_I: real,
};

const Ph = struct {
	pH_UL_aa: real,
	pH_LL_aa: real,
	pH_UL_ac: real,
	pH_LL_ac: real,
	pH_UL_h2: real,
	pH_LL_h2: real,
};

const Inhibition = struct {
	I_IN_lim: real,
	I_h2_fa: real,
	I_h2_c4: real,
	I_h2_pro: real,
	I_nh3: real,
	I_5: real,
	I_6: real,
	I_7: real,
	I_8: real,
	I_9: real,
	I_10: real,
	I_11: real,
	I_12: real,
	I_pH_aa: real,
	I_pH_ac: real,
	I_pH_h2: real,
};

const Pressure = struct {
	p_gas_h2: real,
	p_gas_ch4: real,
	p_gas_co2: real,
	p_gas_h2o: real,
	p_gas: real,
};
const Differential = struct {
	D_S_su: real,
	D_S_aa: real,
	D_S_fa: real,
	D_S_va: real,
	D_S_bu: real,
	D_S_pro: real,
	D_S_ac: real,
	D_S_h2: real,
	D_S_ch4: real,
	D_S_IC: real,
	D_S_IN: real,
	D_S_I: real,
	D_S_cat: real,
	D_S_an: real,
	D_X_c: real,
	D_X_ch: real,
	D_X_pr: real,
	D_X_li: real,
	D_X_su: real,
	D_X_aa: real,
	D_X_fa: real,
	D_X_c4: real,
	D_X_pro: real,
	D_X_ac: real,
	D_X_h2: real,
	D_X_I: real,
	D_S_gas_h2: real,
	D_S_gas_ch4: real,
	D_S_gas_co2: real,
	D_S_va_ion: real,
	D_S_bu_ion: real,
	D_S_pro_ion: real,
	D_S_ac_ion: real,
	D_S_hco3_ion: real,
	D_S_nh3: real,
	D_S_co2: real,
	D_S_H_ion: real,
	D_S_nh4_ion: real,
};

const Variable = struct {
	E: real,
	R: real,

	T_base: real,
	T_ad: real,
	T_op: real,

	P_atm: real,

	V_ad_liq: real,
	V_ad_gas: real,

	Q_ad: real,
	Q_gas: real,
	Q_ch4: real,
};


real get_K_pH(real lower, real upper) {
	return pow(10, -(lower + upper) / 2);
}

real get_n(real lower, real upper) {
	return 3.0 / (upper - lower);
}

real equ(Variables* v) {
	v->S[S_va_ion] = (v->K[K_a_va] * v->S[S_va]) / (v->K[K_a_va] + v->S[S_H_ion]);
	v->S[S_bu_ion] = (v->K[K_a_bu] * v->S[S_bu]) / (v->K[K_a_bu] + v->S[S_H_ion]);
	v->S[S_pro_ion] = (v->K[K_a_pro] * v->S[S_pro]) / (v->K[K_a_pro] + v->S[S_H_ion]);
	v->S[S_ac_ion] = (v->K[K_a_ac] * v->S[S_ac]) / (v->K[K_a_ac] + v->S[S_H_ion]);
	v->S[S_hco3_ion] = (v->K[K_a_co2] * v->S[S_IC]) / (v->K[K_a_co2] + v->S[S_H_ion]);
	v->S[S_nh3] = (v->K[K_a_IN] * v->S[S_IN]) / (v->K[K_a_IN] + v->S[S_H_ion]);

	real value = v->S[S_cat] + v->S[S_IN] - v->S[S_nh3] + v->S[S_H_ion] - v->S[S_hco3_ion] - v->S[S_ac_ion] / 64.0 - v->S[S_pro_ion] / 112.0 - v->S[S_bu_ion] / 160.0 - v->S[S_va_ion] / 208.0 - v->K[K_w] / v->S[S_H_ion] - v->S[S_an];

	// printf("%.12f, %.12f, %.12f, %.12f\n", v->K[K_a_IN], v->S[S_IN], v->S[S_H_ion], v->S[S_nh3]);
	//printf("%.12f, %.12f, %.12f, %.12f, %.12f, %.12f, %.12f, %.12f, %.12f, equ: %.12f, ", v->S[S_cat], v->S[S_an], v->K[K_w], v->S[S_va_ion], v->S[S_bu_ion], v->S[S_pro_ion], v->S[S_ac_ion], v->S[S_hco3_ion], v->S[S_nh3], value * 1000);

	return value;
}

real grad_equ(Variables* v) {
	real value = 1 + v->K[K_a_IN] * v->S[S_IN] / ((v->K[K_a_IN] + v->S[S_H_ion]) * (v->K[K_a_IN] + v->S[S_H_ion])) + v->K[K_a_co2] * v->S[S_IC] / ((v->K[K_a_co2] + v->S[S_H_ion]) * (v->K[K_a_co2] + v->S[S_H_ion])) + 1.0 / 64.0 * v->K[K_a_ac] * v->S[S_ac] / ((v->K[K_a_ac] + v->S[S_H_ion]) * (v->K[K_a_ac] + v->S[S_H_ion])) + 1.0 / 112.0 * v->K[K_a_pro] * v->S[S_pro] / ((v->K[K_a_pro] + v->S[S_H_ion]) * (v->K[K_a_pro] + v->S[S_H_ion])) + 1.0 / 160.0 * v->K[K_a_bu] * v->S[S_bu] / ((v->K[K_a_bu] + v->S[S_H_ion]) * (v->K[K_a_bu] + v->S[S_H_ion])) + 1.0 / 208.0 * v->K[K_a_va] * v->S[S_va] / ((v->K[K_a_va] + v->S[S_H_ion]) * (v->K[K_a_va] + v->S[S_H_ion])) + v->K[K_w] / (v->S[S_H_ion] * v->S[S_H_ion]);

	// printf("grad: %f\n", value);

	return value;
}

void iterate_pH_solver(Variables* v) {
	real delta = 1.0;
	real tol = 0.000000001;
	u32 max_steps = 10;
	u32 i = 0;

	// printf("ION BEFORE: %f\n", v->S[S_H_ion] * 1000);

	while ((delta >= tol || delta <= -tol) && (i <= max_steps)) {
		delta = equ(v) / grad_equ(v);

		v->S[S_H_ion] = v->S[S_H_ion] - delta;

		if (v->S[S_H_ion] <= 0) {
			v->S[S_H_ion] = tol;
		}

		i++;
	}

	// printf("ION AFTER: %f\n", v->S[S_H_ion] * 1000);
}

void iterate_I(Variables* v) {
	iterate_pH_solver(v);

	v->I[I_IN_lim] = 1.0 / (1.0 + v->K[K_S_IN] / v->K[K_S_IN]);
	v->I[I_h2_fa] = 1.0 / (1.0 + v->S[S_h2] / v->K[K_I_h2_fa]);
	v->I[I_h2_c4] = 1.0 / (1.0 + v->S[S_h2] / v->K[K_I_h2_c4]);
	v->I[I_h2_pro] = 1.0 / (1.0 + v->S[S_h2] / v->K[K_I_h2_pro]);
	v->I[I_nh3] = 1.0 / (1.0 + v->S[S_h2] / v->K[K_I_nh3]);

	real K_pH_aa = get_K_pH(v->pH[pH_LL_aa], v->pH[pH_UL_aa]);
	real K_pH_ac = get_K_pH(v->pH[pH_LL_ac], v->pH[pH_UL_ac]);
	real K_pH_h2 = get_K_pH(v->pH[pH_LL_h2], v->pH[pH_UL_h2]);

	real n_aa = get_n(v->pH[pH_LL_aa], v->pH[pH_UL_aa]);
	real n_ac = get_n(v->pH[pH_LL_ac], v->pH[pH_UL_ac]);
	real n_h2 = get_n(v->pH[pH_LL_h2], v->pH[pH_UL_h2]);

	real p_aa = pow(K_pH_aa, n_aa);
	real p_ac = pow(K_pH_ac, n_ac);
	real p_h2 = pow(K_pH_h2, n_h2);

	v->I[I_pH_aa] = p_aa / (pow(v->S[S_H_ion], n_aa) + p_aa);
	v->I[I_pH_ac] = p_ac / (pow(v->S[S_H_ion], n_ac) + p_ac);
	v->I[I_pH_h2] = p_h2 / (pow(v->S[S_H_ion], n_h2) + p_h2);
	v->I[I_5] = v->I[I_pH_aa] * v->I[I_IN_lim];
	v->I[I_6] = v->I[I_pH_aa] * v->I[I_IN_lim];
	v->I[I_7] = v->I[I_pH_aa] * v->I[I_IN_lim] * v->I[I_h2_fa];
	v->I[I_8] = v->I[I_pH_aa] * v->I[I_IN_lim] * v->I[I_h2_c4];
	v->I[I_9] = v->I[I_pH_aa] * v->I[I_IN_lim] * v->I[I_h2_c4];
	v->I[I_10] = v->I[I_pH_aa] * v->I[I_IN_lim] * v->I[I_h2_pro];
	v->I[I_11] = v->I[I_pH_ac] * v->I[I_IN_lim] * v->I[I_nh3];
	v->I[I_12] = v->I[I_pH_h2] * v->I[I_IN_lim];
}

void iterate_gas(Variables* v) {
	v->p[p_gas_h2] = v->S[S_gas_h2] * (v->var[R] * v->var[T_ad]) / 16.0;
	v->p[p_gas_ch4] = v->S[S_gas_ch4] * (v->var[R] * v->var[T_ad]) / 64.0;
	v->p[p_gas_co2] = v->S[S_gas_co2] * (v->var[R] * v->var[T_ad]);

	v->p[p_gas] = v->p[p_gas_h2] + v->p[p_gas_ch4] + v->p[p_gas_co2] + v->p[p_gas_h2o];

	v->var[Q_gas] = v->var[k_p] * (v->p[p_gas] - v->var[P_atm]) * v->p[p_gas] / v->var[P_atm];
	v->var[Q_ch4] = v->var[Q_gas] * (v->p[p_gas_ch4] / v->p[p_gas]);
}

void iterate_rate(Variables* v) {
	iterate_gas(v);
	iterate_I(v);

	v->rate[rate_1] = v->k[k_dis] * v->X[X_c];
	v->rate[rate_2] = v->k[k_hyd_ch] * v->X[X_ch];
	v->rate[rate_3] = v->k[k_hyd_pr] * v->X[X_pr];
	v->rate[rate_4] = v->k[k_hyd_li] * v->X[X_li];
	v->rate[rate_5] = v->k[k_m_su] * v->S[S_su] / (v->K[K_S_su] + v->S[S_su]) * v->X[X_su] * v->I[5];
	v->rate[rate_6] = v->k[k_m_aa] * v->S[S_aa] / (v->K[K_S_aa] + v->S[S_aa]) * v->X[X_aa] * v->I[6];
	v->rate[rate_7] = v->k[k_m_fa] * v->S[S_fa] / (v->K[K_S_fa] + v->S[S_fa]) * v->X[X_fa] * v->I[7];
	v->rate[rate_8] = v->k[k_m_c4] * v->S[S_va] / (v->K[K_S_c4] + v->S[S_va]) * v->X[X_c4] * v->S[S_va] / (v->S[S_bu] + v->S[S_va] ) * v->I[8];
	v->rate[rate_9] = v->k[k_m_c4] * v->S[S_bu] / (v->K[K_S_c4] + v->S[S_bu]) * v->X[X_c4] * v->S[S_bu] / (v->S[S_va] + v->S[S_bu] ) * v->I[9];
	v->rate[rate_10] = v->k[k_m_pro] * v->S[S_pro] / (v->K[K_S_pro] + v->S[S_pro]) * v->X[X_pro] * v->I[10];
	v->rate[rate_11] = v->k[k_m_ac] * v->S[S_ac] / (v->K[K_S_ac] + v->S[S_ac]) * v->X[X_ac] * v->I[11];
	v->rate[rate_12] = v->k[k_m_h2] * v->S[S_h2] / (v->K[K_S_h2] + v->S[S_h2]) * v->X[X_h2] * v->I[12];
	v->rate[rate_13] = v->k[k_dec_Xsu] * v->X[X_su];
	v->rate[rate_14] = v->k[k_dec_Xaa] * v->X[X_aa];
	v->rate[rate_15] = v->k[k_dec_Xfa] * v->X[X_fa];
	v->rate[rate_16] = v->k[k_dec_Xc4] * v->X[X_c4];
	v->rate[rate_17] = v->k[k_dec_Xpro] * v->X[X_pro];
	v->rate[rate_18] = v->k[k_dec_Xac] * v->X[X_ac];
	v->rate[rate_19] = v->k[k_dec_Xh2] * v->X[X_h2];

	v->rate[rate_T_8] = v->K[K_La] * (v->S[S_h2] - 16.0 * v->K[K_H_h2] * v->p[p_gas_h2]);
	v->rate[rate_T_9] = v->K[K_La] * (v->S[S_ch4] - 64.0 * v->K[K_H_ch4] * v->p[p_gas_ch4]);
	v->rate[rate_T_10] = v->K[K_La] * (v->S[S_co2] - v->K[K_H_co2] * v->p[p_gas_co2]);
}
void print_variables(Variables* v) {
	printf("I_pH_aa: %.12f\nI_pH_ac: %.12f\nI_pH_h2: %.12f\nI_IN_lim: %.12f\nI_h2_fa: %.12f\nI_h2_c4: %.12f\nI_h2_pro: %.12f\nI_nh3: %.12f\nI_5: %.12f\nI_6: %.12f\nI_7: %.12f\nI_8: %.12f\nI_9: %.12f\nI_10: %.12f\nI_11: %.12f\nI_12: %.12f\nrate_1: %.12f\nrate_2: %.12f\nrate_3: %.12f\nrate_4: %.12f\nrate_5: %.12f\nrate_6: %.12f\nrate_7: %.12f\nrate_8: %.12f\nrate_9: %.12f\nrate_10: %.12f\nrate_11: %.12f\nrate_12: %.12f\nrate_13: %.12f\nrate_14: %.12f\nrate_15: %.12f\nrate_16: %.12f\nrate_17: %.12f\nrate_18: %.12f\nrate_19: %.12f\np_gas_h2: %.12f\np_gas_ch4: %.12f\np_gas_co2: %.12f\np_gas: %.12f\nQ_gas: %.12f\nQ_ch4: %.12f\nrate_T_8: %.12f\nrate_T_9: %.12f\nrate_T_10: %.12f\nD_S_su: %.12f\nD_S_aa: %.12f\nD_S_fa: %.12f\nD_S_va: %.12f\nD_S_bu: %.12f\nD_S_pro: %.12f\nD_S_ac: %.12f\nD_S_h2: %.12f\nD_S_ch4: %.12f\nD_S_IC: %.12f\nD_S_IN: %.12f\nD_S_I: %.12f\nD_X_c: %.12f\nD_X_ch: %.12f\nD_X_pr: %.12f\nD_X_li: %.12f\nD_X_su: %.12f\nD_X_aa: %.12f\nD_X_fa: %.12f\nD_X_c4: %.12f\nD_X_pro: %.12f\nD_X_ac: %.12f\nD_X_h2: %.12f\nD_X_I: %.12f\nD_S_cat: %.12f\nD_S_an: %.12f\nD_S_H_ion: %.12f\nD_S_va_ion: %.12f\nD_S_bu_ion: %.12f\nD_S_pro_ion: %.12f\nD_S_ac_ion: %.12f\nD_S_hco3_ion: %.12f\nD_S_co2: %.12f\nD_S_nh3: %.12f\nD_S_nh4_ion: %.12f\nD_S_gas_h2: %.12f\nD_S_gas_ch4: %.12f\nD_S_gas_co2: %.12f\n", v->I[I_pH_aa], v->I[I_pH_ac], v->I[I_pH_h2], v->I[I_IN_lim], v->I[I_h2_fa], v->I[I_h2_c4], v->I[I_h2_pro], v->I[I_nh3], v->I[I_5], v->I[I_6], v->I[I_7], v->I[I_8], v->I[I_9], v->I[I_10], v->I[I_11], v->I[I_12], v->rate[rate_1], v->rate[rate_2], v->rate[rate_3], v->rate[rate_4], v->rate[rate_5], v->rate[rate_6], v->rate[rate_7], v->rate[rate_8], v->rate[rate_9], v->rate[rate_10], v->rate[rate_11], v->rate[rate_12], v->rate[rate_13], v->rate[rate_14], v->rate[rate_15], v->rate[rate_16], v->rate[rate_17], v->rate[rate_18], v->rate[rate_19], v->p[p_gas_h2], v->p[p_gas_ch4], v->p[p_gas_co2], v->p[p_gas], v->var[Q_gas], v->var[Q_ch4], v->rate[rate_T_8], v->rate[rate_T_9], v->rate[rate_T_10], v->D[D_S_su], v->D[D_S_aa], v->D[D_S_fa], v->D[D_S_va], v->D[D_S_bu], v->D[D_S_pro], v->D[D_S_ac], v->D[D_S_h2], v->D[D_S_ch4], v->D[D_S_IC], v->D[D_S_IN], v->D[D_S_I], v->D[D_X_c], v->D[D_X_ch], v->D[D_X_pr], v->D[D_X_li], v->D[D_X_su], v->D[D_X_aa], v->D[D_X_fa], v->D[D_X_c4], v->D[D_X_pro], v->D[D_X_ac], v->D[D_X_h2], v->D[D_X_I], v->D[D_S_cat], v->D[D_S_an], v->D[D_S_H_ion], v->D[D_S_va_ion], v->D[D_S_bu_ion], v->D[D_S_pro_ion], v->D[D_S_ac_ion], v->D[D_S_hco3_ion], v->D[D_S_co2], v->D[D_S_nh3], v->D[D_S_nh4_ion], v->D[D_S_gas_h2], v->D[D_S_gas_ch4], v->D[D_S_gas_co2]);

	// printf("D_S_su: %f, D_S_aa: %f, D_S_fa: %f, D_S_va: %f, D_S_bu: %f, D_S_pro: %f, D_S_ac: %f, D_S_h2: %f, D_S_ch4: %f, D_S_IC: %f, D_S_IN: %f, D_S_I: %f, D_S_cat: %f, D_S_an: %f, D_S_gas_h2: %f, D_S_gas_ch4: %f, D_S_gas_co2: %f, D_X_c: %f, D_X_ch: %f, D_X_pr: %f, D_X_li: %f, D_X_su: %f, D_X_aa: %f, D_X_fa: %f, D_X_c4: %f, D_X_pro: %f, D_X_ac: %f, D_X_h2: %f, D_X_I: %f\n", v->D[D_S_su], v->D[D_S_aa], v->D[D_S_fa], v->D[D_S_va], v->D[D_S_bu], v->D[D_S_pro], v->D[D_S_ac], v->D[D_S_h2], v->D[D_S_ch4], v->D[D_S_IC], v->D[D_S_IN], v->D[D_S_I], v->D[D_S_cat], v->D[D_S_an], v->D[D_S_gas_h2], v->D[D_S_gas_ch4], v->D[D_S_gas_co2], v->D[D_X_c], v->D[D_X_ch], v->D[D_X_pr], v->D[D_X_li], v->D[D_X_su], v->D[D_X_aa], v->D[D_X_fa], v->D[D_X_c4], v->D[D_X_pro], v->D[D_X_ac], v->D[D_X_h2], v->D[D_X_I]);
}

void iterate_differential(Variables* v) {
	iterate_rate(v);

	real tau = (v->var[Q_ad] / v->var[V_ad_liq]);

	real sum = 0.0
	+ (-v->C[C_c] + v->f[f_SI_c] * v->C[C_SI] * v->f[f_ch_c] * v->C[C_ch] + v->f[f_pr_c] * v->C[C_pr] + v->f[f_li_c] * v->C[C_li] + v->f[f_XI_c] * v->C[C_XI]) * v->rate[rate_1]
	+ (-v->C[C_ch] + v->C[C_su]) * v->rate[rate_2]
	+ (-v->C[C_pr] + v->C[C_aa]) * v->rate[rate_3]
	+ (-v->C[C_li] + (1 - v->f[f_fa_li]) * v->C[C_su] + v->f[f_fa_li] * v->C[C_fa]) * v->rate[rate_4]
	+ (-v->C[C_su] + (1 - v->Y[Y_su]) * (v->f[f_bu_su] * v->C[C_bu] + v->f[f_pro_su] * v->C[C_pro] + v->f[f_ac_su] * v->C[C_ac]) + v->Y[Y_su] * v->C[C_bac]) * v->rate[rate_5]
	+ (-v->C[C_aa] + (1 - v->Y[Y_aa]) * (v->f[f_va_aa] * v->C[C_aa] + v->f[f_bu_aa] * v->C[C_bu] + v->f[f_pro_aa] * v->C[C_pro] + v->f[f_ac_aa] * v->C[C_ac]) + v->Y[Y_aa] * v->C[C_bac]) * v->rate[rate_6]
	+ (-v->C[C_fa] + (1 - v->Y[Y_aa]) * v->f[f_ac_fa] * v->C[C_ac] + v->Y[Y_fa] * v->C[C_bac]) * v->rate[rate_7]
	+ (-v->C[C_va] + (1 - v->Y[Y_c4]) * v->f[f_pro_c4] * v->C[C_pro] + (1 - v->Y[Y_c4]) * v->f[f_ac_c4_8] * v->C[C_ac] + v->Y[Y_c4] * v->C[C_bac]) * v->rate[rate_8]
	+ (-v->C[C_bu] + (1 - v->Y[Y_c4]) * v->f[f_ac_c4_9] * v->C[C_ac] + v->Y[Y_c4] * v->C[C_bac]) * v->rate[rate_9]
	+ (-v->C[C_pro] + (1 - v->Y[Y_pro]) * v->f[f_ac_pro] * v->C[C_ac] + v->Y[Y_pro] * v->C[C_bac]) * v->rate[rate_10]
	+ (-v->C[C_ac] + (1 - v->Y[Y_ac]) * v->C[C_ch4] + v->Y[Y_ac] * v->C[C_bac]) * v->rate[rate_11]
	+ ((1 - v->Y[Y_h2]) * v->C[C_ch4] + v->Y[Y_h2] * v->C[C_bac]) * v->rate[rate_12]
	+ (-v->C[C_bac] + v->C[C_c]) * (v->rate[rate_13] + v->rate[rate_14] + v->rate[rate_15] + v->rate[rate_16] + v->rate[rate_17] + v->rate[rate_18] + v->rate[rate_19]);

	v->D[D_S_su] = tau * (v->S_in[S_su] - v->S[S_su]) + v->rate[rate_2] + (1 - v->f[f_fa_li]) * v->rate[rate_4] - v->rate[rate_5];
	v->D[D_S_aa] = tau * (v->S_in[S_aa] - v->S[S_aa]) + v->rate[rate_3] - v->rate[rate_6];
	v->D[D_S_fa] = tau * (v->S_in[S_fa] - v->S[S_fa]) + v->f[f_fa_li] * v->rate[rate_4] - v->rate[rate_7];
	v->D[D_S_va] = tau * (v->S_in[S_va] - v->S[S_va]) + (1 - v->Y[Y_aa]) * v->f[f_va_aa] * v->rate[rate_6] - v->rate[rate_8];
	v->D[D_S_bu] = tau * (v->S_in[S_bu] - v->S[S_bu]) + (1 - v->Y[Y_su]) * v->f[f_bu_aa] * v->rate[rate_5] + (1 + v->Y[Y_aa]) * v->f[f_bu_aa] * v->rate[rate_6] - v->rate[rate_9];
	v->D[D_S_pro] = tau * (v->S_in[S_pro] - v->S[S_pro]) + (1 - v->Y[Y_su]) * v->f[f_pro_su] * v->rate[rate_5] + (1 - v->Y[Y_aa]) * v->f[f_pro_aa] * v->rate[rate_6] + (1 - v->Y[Y_c4]) * v->f[f_pro_c4] * v->rate[rate_8] - v->rate[rate_10];
	v->D[D_S_ac] = tau * (v->S_in[S_ac] - v->S[S_ac]) + (1 - v->Y[Y_su]) * v->f[f_ac_su] * v->rate[rate_5] + (1 - v->Y[Y_aa]) * v->f[f_ac_aa] * v->rate[rate_6] + (1 - v->Y[Y_fa]) * v->f[f_ac_fa] * v->rate[rate_7] + (1 - v->Y[Y_c4]) * v->f[f_ac_c4_8] * v->rate[rate_8] + (1 - v->Y[Y_c4]) * v->f[f_ac_c4_9] * v->rate[rate_9] + (1 - v->Y[Y_pro]) * v->f[f_ac_pro] * v->rate[rate_10] - v->rate[rate_11];
	v->D[D_S_h2] = tau * (v->S_in[S_h2] - v->S[S_h2]) + (1 - v->Y[Y_su]) * v->f[f_h2_su] * v->rate[rate_5] + (1 - v->Y[Y_aa]) * v->f[f_h2_aa] * v->rate[rate_6] + (1 - v->Y[Y_fa]) * v->f[f_h2_fa] * v->rate[rate_7] + (1 - v->Y[Y_c4]) * v->f[f_h2_c4_8] * v->rate[rate_8] + (1 - v->Y[Y_c4]) * v->f[f_h2_c4_9] * v->rate[rate_9] + (1 - v->Y[Y_pro]) * v->f[f_h2_pro] * v->rate[rate_10] - v->rate[rate_12] - v->rate[rate_T_8];
	v->D[D_S_ch4] = tau * (v->S_in[S_ch4] - v->S[S_ch4]) + (1 - v->Y[Y_ac]) * v->rate[rate_11] + (1 + v->Y[Y_h2]) * v->rate[rate_12] - v->rate[rate_T_9];
	v->D[D_S_IC] = tau * (v->S_in[S_IC] - v->S[S_IC]) - sum - v->rate[rate_T_10];
	v->D[D_S_IN] = tau * (v->S_in[S_IN] - v->S[S_IN]) - v->Y[Y_su] * v->N[N_bac] * v->rate[rate_5] + (v->N[N_aa] - v->Y[Y_aa] * v->N[N_bac]) * v->rate[rate_6] - v->Y[Y_fa] * v->N[N_bac] * v->rate[rate_7] - v->Y[Y_c4] * v->N[N_bac] * v->rate[rate_8] - v->Y[Y_c4] * v->N[N_bac] * v->rate[rate_9] - v->Y[Y_pro] * v->N[N_bac] * v->rate[rate_10] - v->Y[Y_ac] * v->N[N_bac] * v->rate[rate_11] - v->Y[Y_h2] * v->N[N_bac] * v->rate[rate_12] + (v->N[N_bac] - v->N[N_c]) * (v->rate[rate_13] + v->rate[rate_14] + v->rate[rate_15] + v->rate[rate_16] + v->rate[rate_17] + v->rate[rate_18] + v->rate[rate_19]) + (v->N[N_c] - v->f[f_XI_c] * v->N[N_I] - v->f[f_SI_c] * v->N[N_I] - v->f[f_pr_c] * v->N[N_aa]) * v->rate[rate_1];
	v->D[D_S_I] = tau * (v->S_in[S_I] - v->S[S_I]) + v->f[f_SI_c] * v->rate[rate_1];
	v->D[D_S_cat] = tau * (v->S_in[S_cat] - v->S[S_cat]);
	v->D[D_S_an] = tau * (v->S_in[S_an] - v->S[S_an]);
	v->D[D_S_gas_h2] = (v->var[Q_gas] / v->var[V_ad_gas] * -v->S[S_gas_h2]) * (v->rate[rate_T_8] * v->var[V_ad_liq] / v->var[V_ad_gas]);
	v->D[D_S_gas_ch4] = (v->var[Q_gas] / v->var[V_ad_gas] * -v->S[S_gas_ch4]) * (v->rate[rate_T_9] * v->var[V_ad_liq] / v->var[V_ad_gas]);
	v->D[D_S_gas_co2] = (v->var[Q_gas] / v->var[V_ad_gas] * -v->S[S_gas_co2]) * (v->rate[rate_T_10] * v->var[V_ad_liq] / v->var[V_ad_gas]);

	v->D[D_X_c] = tau * (v->X_in[X_c] - v->X[X_c]) - v->rate[rate_1] + v->rate[rate_13] + v->rate[rate_14] + v->rate[rate_15] + v->rate[rate_16] + v->rate[rate_17] + v->rate[rate_18] + v->rate[rate_19];
	v->D[D_X_ch] = tau * (v->X_in[X_ch] - v->X[X_ch]) + v->f[f_ch_c] * v->rate[rate_1] - v->rate[rate_2];
	v->D[D_X_pr] = tau * (v->X_in[X_pr] - v->X[X_pr]) + v->f[f_pr_c] * v->rate[rate_1] - v->rate[rate_3];
	v->D[D_X_li] = tau * (v->X_in[X_li] - v->X[X_li]) + v->f[f_li_c] * v->rate[rate_1] - v->rate[rate_4];
	v->D[D_X_su] = tau * (v->X_in[X_su] - v->X[X_su]) + v->Y[Y_su] * v->rate[rate_5] - v->rate[rate_13];
	v->D[D_X_aa] = tau * (v->X_in[X_aa] - v->X[X_aa]) + v->Y[Y_aa] * v->rate[rate_6] - v->rate[rate_14];
	v->D[D_X_fa] = tau * (v->X_in[X_fa] - v->X[X_fa]) + v->Y[Y_fa] * v->rate[rate_7] - v->rate[rate_15];
	v->D[D_X_c4] = tau * (v->X_in[X_c4] - v->X[X_c4]) + v->Y[Y_c4] * v->rate[rate_8] + v->Y[Y_c4] * v->rate[rate_9] - v->rate[rate_16];
	v->D[D_X_pro] = tau * (v->X_in[X_pro] - v->X[X_pro]) + v->Y[Y_pro] * v->rate[rate_10] - v->rate[rate_17];
	v->D[D_X_ac] = tau * (v->X_in[X_ac] - v->X[X_ac]) + v->Y[Y_ac] * v->rate[rate_11] - v->rate[rate_18];
	v->D[D_X_h2] = tau * (v->X_in[X_h2] - v->X[X_h2]) + v->Y[Y_h2] * v->rate[rate_12] - v->rate[rate_19];
	v->D[D_X_I] = tau * (v->X_in[X_I] - v->X[X_I]) + v->f[f_XI_c] * v->rate[rate_1];
}

void solve(Variables* v, real delta, u32 iterations) {
	for(int i = 0; i < iterations; i++) {
		iterate_differential(v);
		print_variables(v);

		v->S[S_su] += v->S[D_S_su] * delta;
		v->S[S_aa] += v->S[D_S_aa] * delta;
		v->S[S_fa] += v->S[D_S_fa] * delta;
		v->S[S_va] += v->S[D_S_va] * delta;
		v->S[S_bu] += v->S[D_S_bu] * delta;
		v->S[S_pro] += v->S[D_S_pro] * delta;
		v->S[S_ac] += v->S[D_S_ac] * delta;
		v->S[S_h2] += v->S[D_S_h2] * delta;
		v->S[S_ch4] += v->S[D_S_ch4] * delta;
		v->S[S_IC] += v->S[D_S_IC] * delta;
		v->S[S_IN] += v->S[D_S_IN] * delta;
		v->S[S_I] += v->S[D_S_I] * delta;
		v->S[S_cat] += v->D[D_S_cat] * delta;
		v->S[S_an] += v->D[D_S_an] * delta;
		v->S[S_gas_h2] += v->D[D_S_gas_h2] * delta;
		v->S[S_gas_ch4] += v->D[D_S_gas_ch4] * delta;
		v->S[S_gas_co2] += v->D[D_S_gas_co2] * delta;

		v->X[X_c] += v->D[D_X_c] * delta;
		v->X[X_ch] += v->D[D_X_ch] * delta;
		v->X[X_pr] += v->D[D_X_pr] * delta;
		v->X[X_li] += v->D[D_X_li] * delta;
		v->X[X_su] += v->D[D_X_su] * delta;
		v->X[X_aa] += v->D[D_X_aa] * delta;
		v->X[X_fa] += v->D[D_X_fa] * delta;
		v->X[X_c4] += v->D[D_X_c4] * delta;
		v->X[X_pro] += v->D[D_X_pro] * delta;
		v->X[X_ac] += v->D[D_X_ac] * delta;
		v->X[X_h2] += v->D[D_X_h2] * delta;
		v->X[X_I] += v->D[D_X_I] * delta;
	}
}
	
int main() {
	real mult = 1000000;
	Variables variables = init_variables();
	printf("%f\n", variables.S[S_H_ion] * mult);

	solve(&variables, 0.001, 1);

	printf("%f\n", variables.S[S_H_ion] * mult);
	return 0;
}
