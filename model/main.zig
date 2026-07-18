const std = @import("std");
	
pub fn main() void {
	//const mult = 1000000;
	var variables = Variables.init();
	//printf("%f\n", variables.S[S_H_ion] * mult);

	solve(&variables, 0.001, 1);

	//printf("%f\n", variables.S[S_H_ion] * mult);
}

test "Hello world" {
	return error.Testing;
}

const real = f32;

const Variables = struct {
	variable: Variable = .{},
	flux: Flux = .{},
	nitrogen: Nitrogen = .{},
	carbon: Carbon = .{},
	yield: Yield = .{},
	k: Constk = .{},
	K: ConstK = .{},
	soluble: Soluble = .{},
	soluble_in: Soluble = .{},
	particulate: Particulate = .{},
	particulate_in: Particulate = .{},
	ph: Ph = .{},
	rate: Rate = .{},
	inhibition: Inhibition = .{},
	pressure: Pressure = .{},
	differential: Differential = .{},

	fn init() Variables {
		const variable = Variable {
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
			.gas_h2o = 0.0313 * std.math.exp(5290.0 * frac),
			.gas_h2 = 0.0,
			.gas = 0.0,
			.gas_ch4 = 0.0,
			.gas_co2 = 0.0,
		};

		const flux = Flux {
			.SI_c = 0.10,
			.XI_c = 0.20,
			.ch_c = 0.20,
			.pr_c = 0.20,
			.li_c = 0.30,
			.fa_li = 0.95,
			.h2_aa = 0.06,
			.va_aa = 0.23,
			.bu_aa = 0.26,
			.pro_aa = 0.05,
			.ac_aa = 0.40,
			.h2_su = 0.19,
			.bu_su = 0.13,
			.pro_su = 0.27,
			.ac_su = 0.41,
			.pro_c4 = 0.54,
			.ac_fa = 0.7,
			.ac_pro = 0.57,
			.ac_c4_8 = 0.31,
			.ac_c4_9 = 0.8,
			.h2_fa = 0.30,
			.h2_c4_8 = 0.15,
			.h2_c4_9 = 0.20,
			.h2_pro = 0.43,
		};

		const nitrogen = Nitrogen {
			.c = 0.0376 / 14.0,
			.I = 0.06 / 14.0,
			.aa = 0.0070,
			.bac = 0.08 / 14.0,
		};

		const carbon = Carbon {
			.c = 0.02786,
			.SI = 0.03,
			.ch = 0.0313,
			.li = 0.022,
			.XI = 0.03,
			.su = 0.0313,
			.aa = 0.03,
			.fa = 0.0217,
			.bu = 0.025,
			.pro = 0.0268,
			.ac = 0.0313,
			.bac = 0.0313,
			.va = 0.024,
			.ch4 = 0.0156,
		};

		const yield = Yield {
			.su = 0.10,
			.aa = 0.08,
			.fa = 0.06,
			.c4 = 0.06,
			.pro = 0.04,
			.ac = 0.05,
			.h2 = 0.06,
		};

		const k = Constk {
			.dis = 0.5,
			.hyd_ch = 10,
			.hyd_pr = 10,
			.hyd_li = 10,
			.m_su = 30,
			.m_aa = 50,
			.m_fa = 6,
			.m_c4 = 20,
			.m_pro = 13,
			.m_ac = 8,
			.m_h2 = 35,
			.dec_Xsu = 0.02,
			.dec_Xaa = 0.02,
			.dec_Xfa = 0.02,
			.dec_Xc4 = 0.02,
			.dec_Xpro = 0.02,
			.dec_Xac = 0.02,
			.dec_Xh2 = 0.02,
			.p = 5 * std.math.pow(real, 10.0, 4.0),
		};

		const K = ConstK {
			.A_Bva = std.math.pow(real, 10.0, 10.0),
			.A_Bbu = std.math.pow(real, 10.0, 10.0),
			.A_Bpro = std.math.pow(real, 10.0, 10.0),
			.A_Bac = std.math.pow(real, 10.0, 10.0),
			.A_Bco2 = std.math.pow(real, 10.0, 10.0),
			.A_BIN = std.math.pow(real, 10.0, 10.0),
			.La = 200.0,
			.S_IN = std.math.pow(real, 10.0, -4.0),
			.S_su = 0.5,
			.S_aa = 0.3,
			.S_fa = 0.4,
			.I_h2_fa = 5 * std.math.pow(real, 10.0, -6.0),
			.S_c4 = 0.2,
			.I_h2_c4 = std.math.pow(real, 10, -5),
			.S_pro = 0.1,
			.I_h2_pro = 3.5 * std.math.pow(real, 10.0, -6.0),
			.S_ac = 0.15,
			.I_nh3 = 0.0018,
			.S_h2 = 7 * std.math.pow(real, 10, -6),
			.w = std.math.pow(real, 10, -14.0) * std.math.exp((55900.0 / (100.0 * variable.R)) * frac),
			.a_va = std.math.pow(real, 10.0, -4.86),
			.a_bu = std.math.pow(real, 10.0, -4.82),
			.a_pro = std.math.pow(real, 10.0, -4.88),
			.a_ac = std.math.pow(real, 10.0, -4.76),
			.a_co2 = std.math.pow(real, 10.0, -6.35) * std.math.exp((7646.0 / (100.0 * variable.R)) * frac),
			.a_IN = std.math.pow(real, 10.0, -9.25) * std.math.exp((51965.0 / (100.0 * variable.R)) * frac),
			.H_co2 = 0.035 * std.math.exp((-19410.0 / (100.0 * variable.R)) * frac),
			.H_ch4 = 0.0014 * std.math.exp((-14240.0 / (100.0 * variable.R)) * frac),
			.H_h2 = 7.8 * std.math.pow(real, 10.0, -4) * std.math.exp(-4180.0 / (100.0 * variable.R) * frac),
		};

		const soluble_in = Soluble {
			.su = 0.01,
			.aa = 0.001,
			.fa = 0.001,
			.va = 0.001,
			.bu = 0.001,
			.pro = 0.001,
			.ac = 0.001,
			.h2 = 10e-8,
			.ch4 = 10e-5,
			.IC = 0.04,
			.IN = 0.01,
			.I = 0.02,
			.cat = 0.04,
			.an = 0.02,
			.H_ion = 1.0,
			.va_ion = 0.0,
			.bu_ion = 0.0,
			.pro_ion = 0.0,
			.ac_ion = 0.0,
			.hco3_ion = 0.0,
			.co2 = 0.0,
			.nh3 = 0.0,
			.nh4_ion = 0.0,
			.gas_h2 = 0.0,
			.gas_ch4 = 0.0,
			.gas_co2 = 0.0,
		};

		const particulate_in = Particulate {
			.c = 2.0,
			.ch = 5.0,
			.pr = 20.0,
			.li = 5.0,
			.su = 0.0,
			.aa = 0.01,
			.c4 = 0.01,
			.pro = 0.01,
			.ac = 0.01,
			.h2 = 0.01,
			.I = 25.0,
		};

		const soluble = Soluble {
			.su = 0.012394,
			.aa = 0.0055432,
			.fa = 0.10741,
			.va = 0.012333,
			.bu = 0.014003,
			.pro = 0.017584,
			.ac = 0.089315,
			.h2 = 2.51e-07,
			.ch4 = 0.05549,
			.IC = 0.095149,
			.IN = 0.094468,
			.I = 0.13087,
			.cat = 1.08e-47,
			.an = 0.0052101,
			.H_ion = 5.46e-08,
			.va_ion = 0.012284,
			.bu_ion = 0.013953,
			.pro_ion = 0.017511,
			.ac_ion = 0.089035,
			.hco3_ion = 0.08568,
			.co2 = 0.095149 - 0.08568,//S[S_IC] - S[S_hco3_ion],
			.nh3 = 0.001884,
			.nh4_ion = 0.094468 - 0.001884,//S[S_IN] - S[S_nh3],
			.gas_h2 = 1.10e-05,
			.gas_ch4 = 1.6535,
			.gas_co2 = 0.01354,
		};

		const particulate = Particulate {
			.c = 0.10792,
			.ch = 0.020517,
			.pr = 0.08422,
			.li = 0.043629,
			.su = 0.31222,
			.aa = 0.93167,
			.fa = 0.33839,
			.c4 = 0.33577,
			.pro = 0.10112,
			.ac = 0.67724,
			.h2 = 0.28484,
			.I = 17.2162,
		};

		const ph = Ph {
			.UL_aa = 5.5,
			.LL_aa = 4.0,
			.UL_ac = 7.0,
			.LL_ac = 6.0,
			.UL_h2 = 6.0,
			.LL_h2 = 5.0,
		};

		const inhibition = Inhibition {
			.IN_lim = 0.0,
			.h2_fa = 0.0,
			.h2_c4 = 0.0,
			.h2_pro = 0.0,
			.nh3 = 0.0,
			.pH_aa = 0.0,
			.pH_ac = 0.0,
			.pH_h2 = 0.0,
		};

		const differential = Differential {
			.S_va_ion = 0.0,
			.S_bu_ion = 0.0,
			.S_pro_ion = 0.0,
			.S_ac_ion = 0.0,
			.S_hco3_ion = 0.0,
			.S_nh3 = 0.0,
			.S_co2 = 0.0,
			.S_H_ion = 0.0,
			.S_nh4_ion = 0.0,
		};

		const variables = Variables {
			.variable = variable,
			.flux = flux,
			.nitrogen = nitrogen,
			.carbon = carbon,
			.yield = yield,
			.k = k,
			.K = K,
			.soluble = soluble,
			.soluble_in = soluble_in,
			.particulate = particulate,
			.particulate_in = particulate_in,
			.ph = ph,
			//.rate = rate,
			.inhibition = inhibition,
			.pressure = pressure,
			.differential = differential,
		};

		return variables;
	}
};

const Flux = struct {
	SI_c: real = 0.0,
	XI_c: real = 0.0,
	ch_c: real = 0.0,
	pr_c: real = 0.0,
	li_c: real = 0.0,
	fa_li: real = 0.0,
	h2_aa: real = 0.0,
	va_aa: real = 0.0,
	bu_aa: real = 0.0,
	pro_aa: real = 0.0,
	ac_aa: real = 0.0,
	h2_su: real = 0.0,
	bu_su: real = 0.0,
	pro_su: real = 0.0,
	ac_su: real = 0.0,
	pro_c4: real = 0.0,
	ac_fa: real = 0.0,
	ac_pro: real = 0.0,
	ac_c4_8: real = 0.0,
	ac_c4_9: real = 0.0,
	h2_fa: real = 0.0,
	h2_c4_8: real = 0.0,
	h2_c4_9: real = 0.0,
	h2_pro: real = 0.0,
};

const Nitrogen = struct {
	c: real = 0.0,
	I: real = 0.0,
	aa: real = 0.0,
	bac: real = 0.0,
};

const Carbon = struct {
	c: real = 0.0,
	SI: real = 0.0,
	ch: real = 0.0,
	li: real = 0.0,
	pr: real = 0.0,
	XI: real = 0.0,
	su: real = 0.0,
	aa: real = 0.0,
	fa: real = 0.0,
	bu: real = 0.0,
	pro: real = 0.0,
	ac: real = 0.0,
	bac: real = 0.0,
	va: real = 0.0,
	ch4: real = 0.0,
};

const Yield = struct {
	su: real = 0.0,
	aa: real = 0.0,
	fa: real = 0.0,
	c4: real = 0.0,
	pro: real = 0.0,
	ac: real = 0.0,
	h2: real = 0.0,
};

const Rate = struct {
	_1: real = 0.0,
	_2: real = 0.0,
	_3: real = 0.0,
	_4: real = 0.0,
	_5: real = 0.0,
	_6: real = 0.0,
	_7: real = 0.0,
	_8: real = 0.0,
	_9: real = 0.0,
	_10: real = 0.0,
	_11: real = 0.0,
	_12: real = 0.0,
	_13: real = 0.0,
	_14: real = 0.0,
	_15: real = 0.0,
	_16: real = 0.0,
	_17: real = 0.0,
	_18: real = 0.0,
	_19: real = 0.0,
	T_8: real = 0.0,
	T_9: real = 0.0,
	T_10: real = 0.0,
};

const Constk = struct {
	dis: real = 0.0,
	hyd_ch: real = 0.0,
	hyd_pr: real = 0.0,
	hyd_li: real = 0.0,
	m_su: real = 0.0,
	m_aa: real = 0.0,
	m_fa: real = 0.0,
	m_c4: real = 0.0,
	m_pro: real = 0.0,
	m_ac: real = 0.0,
	m_h2: real = 0.0,
	dec_Xsu: real = 0.0,
	dec_Xaa: real = 0.0,
	dec_Xfa: real = 0.0,
	dec_Xc4: real = 0.0,
	dec_Xpro: real = 0.0,
	dec_Xac: real = 0.0,
	dec_Xh2: real = 0.0,
	p: real = 0.0,
};

const ConstK = struct {
	S_IN: real = 0.0,
	S_su: real = 0.0,
	S_aa: real = 0.0,
	S_fa: real = 0.0,
	I_h2_fa: real = 0.0,
	S_c4: real = 0.0,
	I_h2_c4: real = 0.0,
	S_pro: real = 0.0,
	I_h2_pro: real = 0.0,
	S_ac: real = 0.0,
	I_nh3: real = 0.0,
	S_h2: real = 0.0,
	w: real = 0.0,
	a_va: real = 0.0,
	a_bu: real = 0.0,
	a_pro: real = 0.0,
	a_ac: real = 0.0,
	a_co2: real = 0.0,
	a_IN: real = 0.0,
	A_Bva: real = 0.0,
	A_Bbu: real = 0.0,
	A_Bpro: real = 0.0,
	A_Bac: real = 0.0,
	A_Bco2: real = 0.0,
	A_BIN: real = 0.0,
	La: real = 0.0,
	H_co2: real = 0.0,
	H_ch4: real = 0.0,
	H_h2: real = 0.0,
};

const Soluble = struct {
	su: real = 0.0,
	aa: real = 0.0,
	fa: real = 0.0,
	va: real = 0.0,
	bu: real = 0.0,
	pro: real = 0.0,
	ac: real = 0.0,
	h2: real = 0.0,
	ch4: real = 0.0,
	IC: real = 0.0,
	IN: real = 0.0,
	I: real = 0.0,
	cat: real = 0.0,
	an: real = 0.0,
	H_ion: real = 0.0,
	va_ion: real = 0.0,
	bu_ion: real = 0.0,
	pro_ion: real = 0.0,
	ac_ion: real = 0.0,
	hco3_ion: real = 0.0,
	co2: real = 0.0,
	nh3: real = 0.0,
	nh4_ion: real = 0.0,
	gas_h2: real = 0.0,
	gas_ch4: real = 0.0,
	gas_co2: real = 0.0,
};

const Particulate = struct {
	c: real = 0.0,
	ch: real = 0.0,
	pr: real = 0.0,
	li: real = 0.0,
	su: real = 0.0,
	aa: real = 0.0,
	fa: real = 0.0,
	c4: real = 0.0,
	pro: real = 0.0,
	ac: real = 0.0,
	h2: real = 0.0,
	I: real = 0.0,
};

const Ph = struct {
	UL_aa: real = 0.0,
	LL_aa: real = 0.0,
	UL_ac: real = 0.0,
	LL_ac: real = 0.0,
	UL_h2: real = 0.0,
	LL_h2: real = 0.0,
};

const Inhibition = struct {
	IN_lim: real = 0.0,
	h2_fa: real = 0.0,
	h2_c4: real = 0.0,
	h2_pro: real = 0.0,
	nh3: real = 0.0,
	_5: real = 0.0,
	_6: real = 0.0,
	_7: real = 0.0,
	_8: real = 0.0,
	_9: real = 0.0,
	_10: real = 0.0,
	_11: real = 0.0,
	_12: real = 0.0,
	pH_aa: real = 0.0,
	pH_ac: real = 0.0,
	pH_h2: real = 0.0,
};

const Pressure = struct {
	gas_h2: real = 0.0,
	gas_ch4: real = 0.0,
	gas_co2: real = 0.0,
	gas_h2o: real = 0.0,
	gas: real = 0.0,
};
const Differential = struct {
	S_su: real = 0.0,
	S_aa: real = 0.0,
	S_fa: real = 0.0,
	S_va: real = 0.0,
	S_bu: real = 0.0,
	S_pro: real = 0.0,
	S_ac: real = 0.0,
	S_h2: real = 0.0,
	S_ch4: real = 0.0,
	S_IC: real = 0.0,
	S_IN: real = 0.0,
	S_I: real = 0.0,
	S_cat: real = 0.0,
	S_an: real = 0.0,
	X_c: real = 0.0,
	X_ch: real = 0.0,
	X_pr: real = 0.0,
	X_li: real = 0.0,
	X_su: real = 0.0,
	X_aa: real = 0.0,
	X_fa: real = 0.0,
	X_c4: real = 0.0,
	X_pro: real = 0.0,
	X_ac: real = 0.0,
	X_h2: real = 0.0,
	X_I: real = 0.0,
	S_gas_h2: real = 0.0,
	S_gas_ch4: real = 0.0,
	S_gas_co2: real = 0.0,
	S_va_ion: real = 0.0,
	S_bu_ion: real = 0.0,
	S_pro_ion: real = 0.0,
	S_ac_ion: real = 0.0,
	S_hco3_ion: real = 0.0,
	S_nh3: real = 0.0,
	S_co2: real = 0.0,
	S_H_ion: real = 0.0,
	S_nh4_ion: real = 0.0,
};

const Variable = struct {
	E: real = 0.0,
	R: real = 0.0,

	T_base: real = 0.0,
	T_ad: real = 0.0,
	T_op: real = 0.0,

	P_atm: real = 0.0,

	V_ad_liq: real = 0.0,
	V_ad_gas: real = 0.0,

	Q_ad: real = 0.0,
	Q_gas: real = 0.0,
	Q_ch4: real = 0.0,
};

fn get_K_pH(lower: real, upper: real) real {
	return std.math.pow(real, 10, -(lower + upper) / 2);
}

fn get_n(lower: real, upper: real) real {
	return 3.0 / (upper - lower);
}

fn equ(v: *Variables) real {
	v.soluble.va_ion = (v.K.a_va * v.soluble.va) / (v.K.a_va + v.soluble.H_ion);
	v.soluble.bu_ion = (v.K.a_bu * v.soluble.bu) / (v.K.a_bu + v.soluble.H_ion);
	v.soluble.pro_ion = (v.K.a_pro * v.soluble.pro) / (v.K.a_pro + v.soluble.H_ion);
	v.soluble.ac_ion = (v.K.a_ac * v.soluble.ac) / (v.K.a_ac + v.soluble.H_ion);
	v.soluble.hco3_ion = (v.K.a_co2 * v.soluble.IC) / (v.K.a_co2 + v.soluble.H_ion);
	v.soluble.nh3 = (v.K.a_IN * v.soluble.IN) / (v.K.a_IN + v.soluble.H_ion);

	const value = v.soluble.cat + v.soluble.IN - v.soluble.nh3 + v.soluble.H_ion - v.soluble.hco3_ion - v.soluble.ac_ion / 64.0 - v.soluble.pro_ion / 112.0 - v.soluble.bu_ion / 160.0 - v.soluble.va_ion / 208.0 - v.K.w / v.soluble.H_ion - v.soluble.an;

	// printf("%.12f, %.12f, %.12f, %.12f\n", v.K.a_IN, v.soluble.IN, v.soluble.H_ion, v.soluble.nh3);
	//printf("%.12f, %.12f, %.12f, %.12f, %.12f, %.12f, %.12f, %.12f, %.12f, equ: %.12f, ", v.soluble.cat, v.soluble.an, v.K.w, v.soluble.va_ion, v.soluble.bu_ion, v.soluble.pro_ion, v.soluble.ac_ion, v.soluble.hco3_ion, v.soluble.nh3, value * 1000);

	return value;
}

fn grad_equ(v: *Variables) real {
	const value = 1 + v.K.a_IN * v.soluble.IN / ((v.K.a_IN + v.soluble.H_ion) * (v.K.a_IN + v.soluble.H_ion)) + v.K.a_co2 * v.soluble.IC / ((v.K.a_co2 + v.soluble.H_ion) * (v.K.a_co2 + v.soluble.H_ion)) + 1.0 / 64.0 * v.K.a_ac * v.soluble.ac / ((v.K.a_ac + v.soluble.H_ion) * (v.K.a_ac + v.soluble.H_ion)) + 1.0 / 112.0 * v.K.a_pro * v.soluble.pro / ((v.K.a_pro + v.soluble.H_ion) * (v.K.a_pro + v.soluble.H_ion)) + 1.0 / 160.0 * v.K.a_bu * v.soluble.bu / ((v.K.a_bu + v.soluble.H_ion) * (v.K.a_bu + v.soluble.H_ion)) + 1.0 / 208.0 * v.K.a_va * v.soluble.va / ((v.K.a_va + v.soluble.H_ion) * (v.K.a_va + v.soluble.H_ion)) + v.K.w / (v.soluble.H_ion * v.soluble.H_ion);

	// printf("grad: %f\n", value);

	return value;
}

fn iterate_pH_solver(v: *Variables) void {
	var delta: real = 1.0;
	const tol: real = 0.000000001;
	const max_steps = 10;
	var i: u32 = 0;

	// printf("ION BEFORE: %f\n", v.soluble.H_ion * 1000);

	while ((delta >= tol or delta <= -tol) and (i <= max_steps)) {
		delta = equ(v) / grad_equ(v);

		v.soluble.H_ion = v.soluble.H_ion - delta;

		if (v.soluble.H_ion <= 0) {
			v.soluble.H_ion = tol;
		}

		i += 1;
	}

	// printf("ION AFTER: %f\n", v.soluble.H_ion * 1000);
}

fn iterate_I(v: *Variables) void {
	iterate_pH_solver(v);

	v.inhibition.IN_lim = 1.0 / (1.0 + v.K.S_IN / v.K.S_IN);
	v.inhibition.h2_fa = 1.0 / (1.0 + v.soluble.h2 / v.K.I_h2_fa);
	v.inhibition.h2_c4 = 1.0 / (1.0 + v.soluble.h2 / v.K.I_h2_c4);
	v.inhibition.h2_pro = 1.0 / (1.0 + v.soluble.h2 / v.K.I_h2_pro);
	v.inhibition.nh3 = 1.0 / (1.0 + v.soluble.h2 / v.K.I_nh3);

	const K_pH_aa = get_K_pH(v.ph.LL_aa, v.ph.UL_aa);
	const K_pH_ac = get_K_pH(v.ph.LL_ac, v.ph.UL_ac);
	const K_pH_h2 = get_K_pH(v.ph.LL_h2, v.ph.UL_h2);

	const n_aa = get_n(v.ph.LL_aa, v.ph.UL_aa);
	const n_ac = get_n(v.ph.LL_ac, v.ph.UL_ac);
	const n_h2 = get_n(v.ph.LL_h2, v.ph.UL_h2);

	const p_aa = std.math.pow(real, K_pH_aa, n_aa);
	const p_ac = std.math.pow(real, K_pH_ac, n_ac);
	const p_h2 = std.math.pow(real, K_pH_h2, n_h2);

	v.inhibition.pH_aa = p_aa / (std.math.pow(real, v.soluble.H_ion, n_aa) + p_aa);
	v.inhibition.pH_ac = p_ac / (std.math.pow(real, v.soluble.H_ion, n_ac) + p_ac);
	v.inhibition.pH_h2 = p_h2 / (std.math.pow(real, v.soluble.H_ion, n_h2) + p_h2);
	v.inhibition._5 = v.inhibition.pH_aa * v.inhibition.IN_lim;
	v.inhibition._6 = v.inhibition.pH_aa * v.inhibition.IN_lim;
	v.inhibition._7 = v.inhibition.pH_aa * v.inhibition.IN_lim * v.inhibition.h2_fa;
	v.inhibition._8 = v.inhibition.pH_aa * v.inhibition.IN_lim * v.inhibition.h2_c4;
	v.inhibition._9 = v.inhibition.pH_aa * v.inhibition.IN_lim * v.inhibition.h2_c4;
	v.inhibition._10 = v.inhibition.pH_aa * v.inhibition.IN_lim * v.inhibition.h2_pro;
	v.inhibition._11 = v.inhibition.pH_ac * v.inhibition.IN_lim * v.inhibition.nh3;
	v.inhibition._12 = v.inhibition.pH_h2 * v.inhibition.IN_lim;
}

fn iterate_gas(v: *Variables) void {
	v.pressure.gas_h2 = v.soluble.gas_h2 * (v.variable.R * v.variable.T_ad) / 16.0;
	v.pressure.gas_ch4 = v.soluble.gas_ch4 * (v.variable.R * v.variable.T_ad) / 64.0;
	v.pressure.gas_co2 = v.soluble.gas_co2 * (v.variable.R * v.variable.T_ad);

	v.pressure.gas = v.pressure.gas_h2 + v.pressure.gas_ch4 + v.pressure.gas_co2 + v.pressure.gas_h2o;

	v.variable.Q_gas = v.k.p * (v.pressure.gas - v.variable.P_atm) * v.pressure.gas / v.variable.P_atm;
	v.variable.Q_ch4 = v.variable.Q_gas * (v.pressure.gas_ch4 / v.pressure.gas);
}

fn iterate_rate(v: *Variables) void {
	iterate_gas(v);
	iterate_I(v);

	v.rate._1 = v.k.dis * v.particulate.c;
	v.rate._2 = v.k.hyd_ch * v.particulate.ch;
	v.rate._3 = v.k.hyd_pr * v.particulate.pr;
	v.rate._4 = v.k.hyd_li * v.particulate.li;
	v.rate._5 = v.k.m_su * v.soluble.su / (v.K.S_su + v.soluble.su) * v.particulate.su * v.inhibition._5;
	v.rate._6 = v.k.m_aa * v.soluble.aa / (v.K.S_aa + v.soluble.aa) * v.particulate.aa * v.inhibition._6;
	v.rate._7 = v.k.m_fa * v.soluble.fa / (v.K.S_fa + v.soluble.fa) * v.particulate.fa * v.inhibition._7;
	v.rate._8 = v.k.m_c4 * v.soluble.va / (v.K.S_c4 + v.soluble.va) * v.particulate.c4 * v.soluble.va / (v.soluble.bu + v.soluble.va ) * v.inhibition._8;
	v.rate._9 = v.k.m_c4 * v.soluble.bu / (v.K.S_c4 + v.soluble.bu) * v.particulate.c4 * v.soluble.bu / (v.soluble.va + v.soluble.bu ) * v.inhibition._9;
	v.rate._10 = v.k.m_pro * v.soluble.pro / (v.K.S_pro + v.soluble.pro) * v.particulate.pro * v.inhibition._10;
	v.rate._11 = v.k.m_ac * v.soluble.ac / (v.K.S_ac + v.soluble.ac) * v.particulate.ac * v.inhibition._11;
	v.rate._12 = v.k.m_h2 * v.soluble.h2 / (v.K.S_h2 + v.soluble.h2) * v.particulate.h2 * v.inhibition._12;
	v.rate._13 = v.k.dec_Xsu * v.particulate.su;
	v.rate._14 = v.k.dec_Xaa * v.particulate.aa;
	v.rate._15 = v.k.dec_Xfa * v.particulate.fa;
	v.rate._16 = v.k.dec_Xc4 * v.particulate.c4;
	v.rate._17 = v.k.dec_Xpro * v.particulate.pro;
	v.rate._18 = v.k.dec_Xac * v.particulate.ac;
	v.rate._19 = v.k.dec_Xh2 * v.particulate.h2;

	v.rate.T_8 = v.K.La * (v.soluble.h2 - 16.0 * v.K.H_h2 * v.pressure.gas_h2);
	v.rate.T_9 = v.K.La * (v.soluble.ch4 - 64.0 * v.K.H_ch4 * v.pressure.gas_ch4);
	v.rate.T_10 = v.K.La * (v.soluble.co2 - v.K.H_co2 * v.pressure.gas_co2);
}

//fn print_variables(v: *Variables) real {
	//printf("I_pH_aa: %.12f\nI_pH_ac: %.12f\nI_pH_h2: %.12f\nI_IN_lim: %.12f\nI_h2_fa: %.12f\nI_h2_c4: %.12f\nI_h2_pro: %.12f\nI_nh3: %.12f\nI_5: %.12f\nI_6: %.12f\nI_7: %.12f\nI_8: %.12f\nI_9: %.12f\nI_10: %.12f\nI_11: %.12f\nI_12: %.12f\nrate_1: %.12f\nrate_2: %.12f\nrate_3: %.12f\nrate_4: %.12f\nrate_5: %.12f\nrate_6: %.12f\nrate_7: %.12f\nrate_8: %.12f\nrate_9: %.12f\nrate_10: %.12f\nrate_11: %.12f\nrate_12: %.12f\nrate_13: %.12f\nrate_14: %.12f\nrate_15: %.12f\nrate_16: %.12f\nrate_17: %.12f\nrate_18: %.12f\nrate_19: %.12f\np_gas_h2: %.12f\np_gas_ch4: %.12f\np_gas_co2: %.12f\np_gas: %.12f\nQ_gas: %.12f\nQ_ch4: %.12f\nrate_T_8: %.12f\nrate_T_9: %.12f\nrate_T_10: %.12f\nD_S_su: %.12f\nD_S_aa: %.12f\nD_S_fa: %.12f\nD_S_va: %.12f\nD_S_bu: %.12f\nD_S_pro: %.12f\nD_S_ac: %.12f\nD_S_h2: %.12f\nD_S_ch4: %.12f\nD_S_IC: %.12f\nD_S_IN: %.12f\nD_S_I: %.12f\nD_X_c: %.12f\nD_X_ch: %.12f\nD_X_pr: %.12f\nD_X_li: %.12f\nD_X_su: %.12f\nD_X_aa: %.12f\nD_X_fa: %.12f\nD_X_c4: %.12f\nD_X_pro: %.12f\nD_X_ac: %.12f\nD_X_h2: %.12f\nD_X_I: %.12f\nD_S_cat: %.12f\nD_S_an: %.12f\nD_S_H_ion: %.12f\nD_S_va_ion: %.12f\nD_S_bu_ion: %.12f\nD_S_pro_ion: %.12f\nD_S_ac_ion: %.12f\nD_S_hco3_ion: %.12f\nD_S_co2: %.12f\nD_S_nh3: %.12f\nD_S_nh4_ion: %.12f\nD_S_gas_h2: %.12f\nD_S_gas_ch4: %.12f\nD_S_gas_co2: %.12f\n", v.inhibition.pH_aa, v.inhibition.pH_ac, v.inhibition.pH_h2, v.inhibition.IN_lim, v.inhibition.h2_fa, v.inhibition.h2_c4, v.inhibition.h2_pro, v.inhibition.nh3, v.inhibition._5, v.inhibition._6, v.inhibition._7, v.inhibition._8, v.inhibition._9, v.inhibition._10, v.inhibition._11, v.inhibition._12, v.rate._1, v.rate._2, v.rate._3, v.rate._4, v.rate._5, v.rate._6, v.rate._7, v.rate._8, v.rate._9, v.rate._10, v.rate._11, v.rate._12, v.rate._13, v.rate._14, v.rate._15, v.rate._16, v.rate._17, v.rate._18, v.rate._19, v.pressure.gas_h2, v.pressure.gas_ch4, v.pressure.gas_co2, v.pressure.gas, v.variable.Q_gas, v.variable.Q_ch4, v.rate.T_8, v.rate.T_9, v.rate.T_10, v.differential.S_su, v.differential.S_aa, v.differential.S_fa, v.differential.S_va, v.differential.S_bu, v.differential.S_pro, v.differential.S_ac, v.differential.S_h2, v.differential.S_ch4, v.differential.S_IC, v.differential.S_IN, v.differential.S_I, v.differential.X_c, v.differential.X_ch, v.differential.X_pr, v.differential.X_li, v.differential.X_su, v.differential.X_aa, v.differential.X_fa, v.differential.X_c4, v.differential.X_pro, v.differential.X_ac, v.differential.X_h2, v.differential.X_I, v.differential.S_cat, v.differential.S_an, v.differential.S_H_ion, v.differential.S_va_ion, v.differential.S_bu_ion, v.differential.S_pro_ion, v.differential.S_ac_ion, v.differential.S_hco3_ion, v.differential.S_co2, v.differential.S_nh3, v.differential.S_nh4_ion, v.differential.S_gas_h2, v.differential.S_gas_ch4, v.differential.S_gas_co2);

	// printf("D_S_su: %f, D_S_aa: %f, D_S_fa: %f, D_S_va: %f, D_S_bu: %f, D_S_pro: %f, D_S_ac: %f, D_S_h2: %f, D_S_ch4: %f, D_S_IC: %f, D_S_IN: %f, D_S_I: %f, D_S_cat: %f, D_S_an: %f, D_S_gas_h2: %f, D_S_gas_ch4: %f, D_S_gas_co2: %f, D_X_c: %f, D_X_ch: %f, D_X_pr: %f, D_X_li: %f, D_X_su: %f, D_X_aa: %f, D_X_fa: %f, D_X_c4: %f, D_X_pro: %f, D_X_ac: %f, D_X_h2: %f, D_X_I: %f\n", v.differential.S_su, v.differential.S_aa, v.differential.S_fa, v.differential.S_va, v.differential.S_bu, v.differential.S_pro, v.differential.S_ac, v.differential.S_h2, v.differential.S_ch4, v.differential.S_IC, v.differential.S_IN, v.differential.S_I, v.differential.S_cat, v.differential.S_an, v.differential.S_gas_h2, v.differential.S_gas_ch4, v.differential.S_gas_co2, v.differential.X_c, v.differential.X_ch, v.differential.X_pr, v.differential.X_li, v.differential.X_su, v.differential.X_aa, v.differential.X_fa, v.differential.X_c4, v.differential.X_pro, v.differential.X_ac, v.differential.X_h2, v.differential.X_I);
//}

fn iterate_differential(v: *Variables) void {
	iterate_rate(v);

	const tau = (v.variable.Q_ad / v.variable.V_ad_liq);

	const sum = 0.0
	+ (-v.carbon.c + v.flux.SI_c * v.carbon.SI * v.flux.ch_c * v.carbon.ch + v.flux.pr_c * v.carbon.pr + v.flux.li_c * v.carbon.li + v.flux.XI_c * v.carbon.XI) * v.rate._1
	+ (-v.carbon.ch + v.carbon.su) * v.rate._2
	+ (-v.carbon.pr + v.carbon.aa) * v.rate._3
	+ (-v.carbon.li + (1 - v.flux.fa_li) * v.carbon.su + v.flux.fa_li * v.carbon.fa) * v.rate._4
	+ (-v.carbon.su + (1 - v.yield.su) * (v.flux.bu_su * v.carbon.bu + v.flux.pro_su * v.carbon.pro + v.flux.ac_su * v.carbon.ac) + v.yield.su * v.carbon.bac) * v.rate._5
	+ (-v.carbon.aa + (1 - v.yield.aa) * (v.flux.va_aa * v.carbon.aa + v.flux.bu_aa * v.carbon.bu + v.flux.pro_aa * v.carbon.pro + v.flux.ac_aa * v.carbon.ac) + v.yield.aa * v.carbon.bac) * v.rate._6
	+ (-v.carbon.fa + (1 - v.yield.aa) * v.flux.ac_fa * v.carbon.ac + v.yield.fa * v.carbon.bac) * v.rate._7
	+ (-v.carbon.va + (1 - v.yield.c4) * v.flux.pro_c4 * v.carbon.pro + (1 - v.yield.c4) * v.flux.ac_c4_8 * v.carbon.ac + v.yield.c4 * v.carbon.bac) * v.rate._8
	+ (-v.carbon.bu + (1 - v.yield.c4) * v.flux.ac_c4_9 * v.carbon.ac + v.yield.c4 * v.carbon.bac) * v.rate._9
	+ (-v.carbon.pro + (1 - v.yield.pro) * v.flux.ac_pro * v.carbon.ac + v.yield.pro * v.carbon.bac) * v.rate._10
	+ (-v.carbon.ac + (1 - v.yield.ac) * v.carbon.ch4 + v.yield.ac * v.carbon.bac) * v.rate._11
	+ ((1 - v.yield.h2) * v.carbon.ch4 + v.yield.h2 * v.carbon.bac) * v.rate._12
	+ (-v.carbon.bac + v.carbon.c) * (v.rate._13 + v.rate._14 + v.rate._15 + v.rate._16 + v.rate._17 + v.rate._18 + v.rate._19);

	v.differential.S_su = tau * (v.soluble_in.su - v.soluble.su) + v.rate._2 + (1 - v.flux.fa_li) * v.rate._4 - v.rate._5;
	v.differential.S_aa = tau * (v.soluble_in.aa - v.soluble.aa) + v.rate._3 - v.rate._6;
	v.differential.S_fa = tau * (v.soluble_in.fa - v.soluble.fa) + v.flux.fa_li * v.rate._4 - v.rate._7;
	v.differential.S_va = tau * (v.soluble_in.va - v.soluble.va) + (1 - v.yield.aa) * v.flux.va_aa * v.rate._6 - v.rate._8;
	v.differential.S_bu = tau * (v.soluble_in.bu - v.soluble.bu) + (1 - v.yield.su) * v.flux.bu_aa * v.rate._5 + (1 + v.yield.aa) * v.flux.bu_aa * v.rate._6 - v.rate._9;
	v.differential.S_pro = tau * (v.soluble_in.pro - v.soluble.pro) + (1 - v.yield.su) * v.flux.pro_su * v.rate._5 + (1 - v.yield.aa) * v.flux.pro_aa * v.rate._6 + (1 - v.yield.c4) * v.flux.pro_c4 * v.rate._8 - v.rate._10;
	v.differential.S_ac = tau * (v.soluble_in.ac - v.soluble.ac) + (1 - v.yield.su) * v.flux.ac_su * v.rate._5 + (1 - v.yield.aa) * v.flux.ac_aa * v.rate._6 + (1 - v.yield.fa) * v.flux.ac_fa * v.rate._7 + (1 - v.yield.c4) * v.flux.ac_c4_8 * v.rate._8 + (1 - v.yield.c4) * v.flux.ac_c4_9 * v.rate._9 + (1 - v.yield.pro) * v.flux.ac_pro * v.rate._10 - v.rate._11;
	v.differential.S_h2 = tau * (v.soluble_in.h2 - v.soluble.h2) + (1 - v.yield.su) * v.flux.h2_su * v.rate._5 + (1 - v.yield.aa) * v.flux.h2_aa * v.rate._6 + (1 - v.yield.fa) * v.flux.h2_fa * v.rate._7 + (1 - v.yield.c4) * v.flux.h2_c4_8 * v.rate._8 + (1 - v.yield.c4) * v.flux.h2_c4_9 * v.rate._9 + (1 - v.yield.pro) * v.flux.h2_pro * v.rate._10 - v.rate._12 - v.rate.T_8;
	v.differential.S_ch4 = tau * (v.soluble_in.ch4 - v.soluble.ch4) + (1 - v.yield.ac) * v.rate._11 + (1 + v.yield.h2) * v.rate._12 - v.rate.T_9;
	v.differential.S_IC = tau * (v.soluble_in.IC - v.soluble.IC) - sum - v.rate.T_10;
	v.differential.S_IN = tau * (v.soluble_in.IN - v.soluble.IN) - v.yield.su * v.nitrogen.bac * v.rate._5 + (v.nitrogen.aa - v.yield.aa * v.nitrogen.bac) * v.rate._6 - v.yield.fa * v.nitrogen.bac * v.rate._7 - v.yield.c4 * v.nitrogen.bac * v.rate._8 - v.yield.c4 * v.nitrogen.bac * v.rate._9 - v.yield.pro * v.nitrogen.bac * v.rate._10 - v.yield.ac * v.nitrogen.bac * v.rate._11 - v.yield.h2 * v.nitrogen.bac * v.rate._12 + (v.nitrogen.bac - v.nitrogen.c) * (v.rate._13 + v.rate._14 + v.rate._15 + v.rate._16 + v.rate._17 + v.rate._18 + v.rate._19) + (v.nitrogen.c - v.flux.XI_c * v.nitrogen.I - v.flux.SI_c * v.nitrogen.I - v.flux.pr_c * v.nitrogen.aa) * v.rate._1;
	v.differential.S_I = tau * (v.soluble_in.I - v.soluble.I) + v.flux.SI_c * v.rate._1;
	v.differential.S_cat = tau * (v.soluble_in.cat - v.soluble.cat);
	v.differential.S_an = tau * (v.soluble_in.an - v.soluble.an);
	v.differential.S_gas_h2 = (v.variable.Q_gas / v.variable.V_ad_gas * -v.soluble.gas_h2) * (v.rate.T_8 * v.variable.V_ad_liq / v.variable.V_ad_gas);
	v.differential.S_gas_ch4 = (v.variable.Q_gas / v.variable.V_ad_gas * -v.soluble.gas_ch4) * (v.rate.T_9 * v.variable.V_ad_liq / v.variable.V_ad_gas);
	v.differential.S_gas_co2 = (v.variable.Q_gas / v.variable.V_ad_gas * -v.soluble.gas_co2) * (v.rate.T_10 * v.variable.V_ad_liq / v.variable.V_ad_gas);

	v.differential.X_c = tau * (v.particulate_in.c - v.particulate.c) - v.rate._1 + v.rate._13 + v.rate._14 + v.rate._15 + v.rate._16 + v.rate._17 + v.rate._18 + v.rate._19;
	v.differential.X_ch = tau * (v.particulate_in.ch - v.particulate.ch) + v.flux.ch_c * v.rate._1 - v.rate._2;
	v.differential.X_pr = tau * (v.particulate_in.pr - v.particulate.pr) + v.flux.pr_c * v.rate._1 - v.rate._3;
	v.differential.X_li = tau * (v.particulate_in.li - v.particulate.li) + v.flux.li_c * v.rate._1 - v.rate._4;
	v.differential.X_su = tau * (v.particulate_in.su - v.particulate.su) + v.yield.su * v.rate._5 - v.rate._13;
	v.differential.X_aa = tau * (v.particulate_in.aa - v.particulate.aa) + v.yield.aa * v.rate._6 - v.rate._14;
	v.differential.X_fa = tau * (v.particulate_in.fa - v.particulate.fa) + v.yield.fa * v.rate._7 - v.rate._15;
	v.differential.X_c4 = tau * (v.particulate_in.c4 - v.particulate.c4) + v.yield.c4 * v.rate._8 + v.yield.c4 * v.rate._9 - v.rate._16;
	v.differential.X_pro = tau * (v.particulate_in.pro - v.particulate.pro) + v.yield.pro * v.rate._10 - v.rate._17;
	v.differential.X_ac = tau * (v.particulate_in.ac - v.particulate.ac) + v.yield.ac * v.rate._11 - v.rate._18;
	v.differential.X_h2 = tau * (v.particulate_in.h2 - v.particulate.h2) + v.yield.h2 * v.rate._12 - v.rate._19;
	v.differential.X_I = tau * (v.particulate_in.I - v.particulate.I) + v.flux.XI_c * v.rate._1;
}

fn solve(v: *Variables, delta: real, iterations: u32) void {
	for (0..iterations) |_| {
		iterate_differential(v);
		//print_variables(v);

		v.soluble.su += v.soluble.su * delta;
		v.soluble.aa += v.soluble.aa * delta;
		v.soluble.fa += v.soluble.fa * delta;
		v.soluble.va += v.soluble.va * delta;
		v.soluble.bu += v.soluble.bu * delta;
		v.soluble.pro += v.soluble.pro * delta;
		v.soluble.ac += v.soluble.ac * delta;
		v.soluble.h2 += v.soluble.h2 * delta;
		v.soluble.ch4 += v.soluble.ch4 * delta;
		v.soluble.IC += v.soluble.IC * delta;
		v.soluble.IN += v.soluble.IN * delta;
		v.soluble.I += v.soluble.I * delta;
		v.soluble.cat += v.differential.S_cat * delta;
		v.soluble.an += v.differential.S_an * delta;
		v.soluble.gas_h2 += v.differential.S_gas_h2 * delta;
		v.soluble.gas_ch4 += v.differential.S_gas_ch4 * delta;
		v.soluble.gas_co2 += v.differential.S_gas_co2 * delta;

		v.particulate.c += v.differential.X_c * delta;
		v.particulate.ch += v.differential.X_ch * delta;
		v.particulate.pr += v.differential.X_pr * delta;
		v.particulate.li += v.differential.X_li * delta;
		v.particulate.su += v.differential.X_su * delta;
		v.particulate.aa += v.differential.X_aa * delta;
		v.particulate.fa += v.differential.X_fa * delta;
		v.particulate.c4 += v.differential.X_c4 * delta;
		v.particulate.pro += v.differential.X_pro * delta;
		v.particulate.ac += v.differential.X_ac * delta;
		v.particulate.h2 += v.differential.X_h2 * delta;
		v.particulate.I += v.differential.X_I * delta;
	}
}
