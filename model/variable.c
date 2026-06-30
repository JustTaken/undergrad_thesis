#include <stdio.h>
#include <stdlib.h>
#include "variable.h"

Variables init_variables() {
	real *var = malloc(sizeof(real) * var_count);
	real *f = malloc(sizeof(real) * f_count);
	real *N = malloc(sizeof(real) * N_count);
	real *C = malloc(sizeof(real) * C_count);
	real *Y = malloc(sizeof(real) * Y_count);
	real *k = malloc(sizeof(real) * k_count);
	real *K = malloc(sizeof(real) * K_count);
	real *S = malloc(sizeof(real) * S_count);
	real *S_in = malloc(sizeof(real) * S_count);
	real *X = malloc(sizeof(real) * X_count);
	real *X_in = malloc(sizeof(real) * X_count);
	real *pH = malloc(sizeof(real) * pH_count);
	real *rate = malloc(sizeof(real) * rate_count);
	real *I = malloc(sizeof(real) * I_count);
	real *p = malloc(sizeof(real) * p_count);
	real *D = malloc(sizeof(real) * D_count);

	var[E] = 2.71828;
	var[R] = 0.083145;
	var[T_base] = 298.15;
	var[T_ad] = 308.15;
	var[T_op] = 308.15;
	var[P_atm] = 1.013;

	const real frac = (1.0 / var[T_base] - 1.0 / var[T_ad]);

	p[p_gas_h2o] = 0.0313 * exp(5290.0 * frac);
	p[p_gas_h2] = 0.0;
	p[p_gas_ch4] = 0.0;
	p[p_gas_co2] = 0.0;

	var[V_ad_liq] = 3400;
	var[V_ad_gas] = 300;
	var[Q_ad] = 170;
	var[Q_gas] = 0;

	f[f_SI_xc] = 0.10;
	f[f_XI_xc] = 0.20;
	f[f_ch_xc] = 0.20;
	f[f_pr_xc] = 0.20;
	f[f_li_xc] = 0.30;
	f[f_fa_li] = 0.95;
	f[f_h2_aa] = 0.06;
	f[f_va_aa] = 0.23;
	f[f_bu_aa] = 0.26;
	f[f_pro_aa] = 0.05;
	f[f_ac_aa] = 0.40;
	f[f_h2_su] = 0.19;
	f[f_bu_su] = 0.13;
	f[f_pro_su] = 0.27;
	f[f_ac_su] = 0.41;

	N[N_xc] = 0.0376 / 14.0;
	N[N_I] = 0.06 / 14.0;
	N[N_aa] = 0.0070;
	N[N_bac] = 0.08 / 14;

	C[C_xc] = 0.02786;
	C[C_SI] = 0.03;
	C[C_ch] = 0.0313;
	C[C_li] = 0.022;
	C[C_XI] = 0.03;
	C[C_su] = 0.0313;
	C[C_aa] = 0.03;
	C[C_fa] = 0.0217;
	C[C_bu] = 0.025;
	C[C_pro] = 0.0268;
	C[C_ac] = 0.0313;
	C[C_bac] = 0.0313;
	C[C_va] = 0.024;
	C[C_ch4] = 0.0156;

	Y[Y_su] = 0.10;
	Y[Y_aa] = 0.08;
	Y[Y_fa] = 0.06;
	Y[Y_c4] = 0.06;
	Y[Y_pro] = 0.04;
	Y[Y_ac] = 0.05;
	Y[Y_h2] = 0.06;

	k[k_dis] = 0.5;
	k[k_hyd_ch] = 10;
	k[k_hyd_pr] = 10;
	k[k_hyd_li] = 10;
	k[k_m_su] = 30;
	k[k_m_aa] = 50;
	k[k_m_fa] = 6;
	k[k_m_c4] = 20;
	k[k_m_pro] = 13;
	k[k_m_ac] = 8;
	k[k_m_h2] = 35;
	k[k_dec_Xsu] = 0.02;
	k[k_dec_Xaa] = 0.02;
	k[k_dec_Xfa] = 0.02;
	k[k_dec_Xc4] = 0.02;
	k[k_dec_Xpro] = 0.02;
	k[k_dec_Xac] = 0.02;
	k[k_dec_Xh2] = 0.02;
	k[k_p] = 5 * pow(10.0, 4.0);

	K[K_A_Bva] = pow(10.0, 10.0);
	K[K_A_Bbu] = pow(10.0, 10.0);
	K[K_A_Bpro] = pow(10.0, 10.0);
	K[K_A_Bac] = pow(10.0, 10.0);
	K[K_A_Bco2] = pow(10.0, 10.0);
	K[K_A_BIN] = pow(10.0, 10.0);
	K[K_La] = 200.0;
	K[K_S_IN] = pow(10.0, -4.0);
	K[K_S_su] = 0.5;;
	K[K_S_aa] = 0.3;
	K[K_S_fa] = 0.4;
	K[K_I_h2_fa] = 5 * pow(10.0, -6.0);
	K[K_S_c4] = 0.2;
	K[K_I_h2_c4] = pow(10, -5);
	K[K_S_pro] = 0.1;
	K[K_I_h2_pro] = 3.5 * pow(10.0, -6.0);
	K[K_S_ac] = 0.15;
	K[K_I_nh3] = 0.0018;
	K[K_S_h2] = 7 * pow(10, -6);
	K[K_w] = pow(10, -14.0) * exp((55900.0 / (100.0 * var[R])) * frac);
	K[K_a_va] = pow(10.0, -4.86);
	K[K_a_bu] = pow(10.0, -4.82);
	K[K_a_pro] = pow(10.0, -4.88);
	K[K_a_ac] = pow(10.0, -4.76);
	K[K_a_co2] = pow(10.0, -6.35) * exp((7646.0 / (100.0 * var[R])) * frac);
	K[K_a_IN] = pow(10.0, -9.25) * exp((51965.0 / (100.0 * var[R])) * frac);
	K[K_H_co2] = 0.035 * exp((-19410.0 / (100.0 * var[R]))* frac);
	K[K_H_ch4] = 0.0014 * exp((-14240.0 / (100.0 * var[R])) * frac);
	K[K_H_h2] = 7.8 * pow(10.0, -4) * exp(-4180.0 / (100.0 * var[R]) * frac);

	S_in[S_su] = 0.01;
	S_in[S_aa] = 0.001;
	S_in[S_fa] = 0.001;
	S_in[S_va] = 0.001;
	S_in[S_bu] = 0.001;
	S_in[S_pro] = 0.001;
	S_in[S_ac] = 0.001;
	S_in[S_h2] = 10e-8;
	S_in[S_ch4] = 10e-5;
	S_in[S_IC] = 0.04;
	S_in[S_IN] = 0.01;
	S_in[S_I] = 0.02;

	X_in[X_c] = 2.0;
	X_in[X_ch] = 5.0;
	X_in[X_pr] = 20.0;
	X_in[X_li] = 5.0;
	X_in[X_su] = 0.0;
	X_in[X_aa] = 0.01;
	X_in[X_c4] = 0.01;
	X_in[X_pro] = 0.01;
	X_in[X_ac] = 0.01;
	X_in[X_h2] = 0.01;
	X_in[X_I] = 25.0;

	S[S_su] = 0.012394;
	S[S_aa] = 0.0055432;
	S[S_fa] = 0.10741;
	S[S_va] = 0.012333;
	S[S_bu] = 0.014003;
	S[S_pro] = 0.017584;
	S[S_ac] = 0.089315;
	S[S_h2] = 2.51e-07;
	S[S_ch4] = 0.05549;
	S[S_IC] = 0.095149;
	S[S_IN] = 0.094468;
	S[S_I] = 0.13087;
	S[S_cat] = 1.08e-47;
	S[S_an] = 0.0052101;
	S[S_H_ion] = 5.46e-08;
	S[S_va_ion] = 0.012284;
	S[S_bu_ion] = 0.013953;
	S[S_pro_ion] = 0.017511;
	S[S_ac_ion] = 0.089035;
	S[S_hco3_ion] = 0.08568;
	S[S_co2] = 0.0094689;
	S[S_nh3] = 0.001884;
	S[S_nh4_ion] = 0.092584;
	S[S_gas_h2] = 1.10e-05;
	S[S_gas_ch4] = 1.6535;
	S[S_gas_co2] = 0.01354;

	X[X_c] = 0.10792;
	X[X_ch] = 0.020517;
	X[X_pr] = 0.08422;
	X[X_li] = 0.043629;
	X[X_su] = 0.31222;
	X[X_aa] = 0.93167;
	X[X_fa] = 0.33839;
	X[X_c4] = 0.33577;
	X[X_pro] = 0.10112;
	X[X_ac] = 0.67724;
	X[X_h2] = 0.28484;
	X[X_I] = 17.2162;

	pH[pH_UL_aa] = 5.5;
	pH[pH_LL_aa] = 4.0;
	pH[pH_UL_ac] = 7.0;
	pH[pH_LL_ac] = 6.0;
	pH[pH_UL_h2] = 6.0;
	pH[pH_LL_h2] = 5.0;

	I[I_IN_lim] = 0.0;
	I[I_h2_fa] = 0.0;
	I[I_h2_c4] = 0.0;
	I[I_h2_pro] = 0.0;
	I[I_nh3] = 0.0;
	I[I_pH_aa] = 0.0;
	I[I_pH_ac] = 0.0;
	I[I_pH_h2] = 0.0;

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

	real P_gas = v->p[p_gas_h2] + v->p[p_gas_ch4] + v->p[p_gas_co2] + v->p[p_gas_h2o];

	v->var[Q_gas] = v->var[k_p] * (P_gas - v->var[P_atm]) * P_gas / v->var[P_atm];
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

void iterate_differential(Variables* v) {
	iterate_rate(v);

	real tau = (v->var[Q_ad] / v->var[V_ad_liq]);

	v->f[f_pro_c4] = 0.54;
	v->f[f_ac_fa] = 0.7;
	v->f[f_ac_pro] = 0.57;
	v->f[f_ac_c4_8] = 0.31;
	v->f[f_ac_c4_9] = 0.8;
	v->f[f_h2_fa] = 0.30;
	v->f[f_h2_c4_8] = 0.15;
	v->f[f_h2_c4_9] = 0.20;
	v->f[f_h2_pro] = 0.43;
	// v->f[f_ac_fa] = 0.7;
	v->f[f_pro_c4] = 0.54;

	real sum = 0.0
	+ (-v->C[C_xc] + v->f[f_SI_xc] * v->C[C_SI] * v->f[f_ch_xc] * v->C[C_ch] + v->f[f_pr_xc] * v->C[C_pr] + v->f[f_li_xc] * v->C[C_li] + v->f[f_XI_xc] * v->C[C_XI]) * v->rate[rate_1]
	+ (-v->C[C_ch] + v->C[C_su]) * v->rate[rate_2]
	+ (-v->C[C_pr] + v->C[C_aa]) * v->rate[rate_3]
	+ (-v->C[C_li] + (1 - v->f[f_la_li]) * v->C[C_su] + v->f[f_fa_li] * v->C[C_fa]) * v->rate[rate_4]
	+ (-v->C[C_su] + (1 - v->Y[Y_su]) * (v->f[f_bu_su] * v->C[C_bu] + v->f[f_pro_su] * v->C[C_pro] + v->f[f_ac_su] * v->C[C_ac]) + v->Y[Y_su] * v->C[C_bac]) * v->rate[rate_5]
	+ (-v->C[C_aa] + (1 - v->Y[Y_aa]) * (v->f[f_va_aa] * v->C[C_aa] + v->f[f_bu_aa] * v->C[C_bu] + v->f[f_pro_aa] * v->C[C_pro] + v->f[f_ac_aa] * v->C[C_ac]) + v->Y[Y_aa] * v->C[C_bac]) * v->rate[rate_6]
	+ (-v->C[C_fa] + (1 - v->Y[Y_aa]) * v->f[f_ac_fa] * v->C[C_ac] + v->Y[Y_fa] * v->C[C_bac]) * v->rate[rate_7]
	+ (-v->C[C_va] + (1 - v->Y[Y_c4]) * v->f[f_pro_c4] * v->C[C_pro] + (1 - v->Y[Y_c4]) * v->f[f_ac_c4_8] * v->C[C_ac] + v->Y[Y_c4] * v->C[C_bac]) * v->rate[rate_8]
	+ (-v->C[C_bu] + (1 - v->Y[Y_c4]) * v->f[f_ac_c4_9] * v->C[C_ac] + v->Y[Y_c4] * v->C[C_bac]) * v->rate[rate_9]
	+ (-v->C[C_pro] + (1 - v->Y[Y_pro]) * v->f[f_ac_pro] * v->C[C_ac] + v->Y[Y_pro] * v->C[C_bac]) * v->rate[rate_10]
	+ (-v->C[C_ac] + (1 - v->Y[Y_ac]) * v->C[C_ch4] + v->Y[Y_ac] * v->C[C_bac]) * v->rate[rate_11]
	+ ((1 - v->Y[Y_h2]) * v->C[C_ch4] + v->Y[Y_h2] * v->C[C_bac]) * v->rate[rate_12]
	+ (-v->C[C_bac] + v->C[C_xc]) * (v->rate[rate_13] + v->rate[rate_14] + v->rate[rate_15] + v->rate[rate_16] + v->rate[rate_17] + v->rate[rate_18] + v->rate[rate_19]);

	v->D[D_S_su] = tau * (v->S_in[S_su] - v->S[S_su]) + v->rate[rate_2] + (1 - v->f[f_fa_li]) * v->rate[rate_4] - v->rate[rate_5];
	v->D[D_S_aa] = tau * (v->S_in[S_aa] - v->S[S_aa]) + v->rate[rate_3] - v->rate[rate_6];
	v->D[D_S_fa] = tau * (v->S_in[S_fa] - v->S[S_fa]) + v->f[f_fa_li] * v->rate[rate_4] - v->rate[rate_7];
	v->D[D_S_va] = tau * (v->S_in[S_va] - v->S[S_va]) + (1 - v->Y[Y_aa]) * v->f[f_va_aa] * v->rate[rate_6] - v->rate[rate_8];
	v->D[D_S_bu] = tau * (v->S_in[S_bu] - v->S[S_bu]) + (1 - v->Y[Y_su]) * v->f[f_bu_aa] * v->rate[rate_5] + (1 + v->Y[Y_aa]) * v->f[f_bu_aa] * v->rate[rate_6] - v->rate[rate_9];
	v->D[D_S_pro] = tau * (v->S_in[S_pro] - v->S[S_pro]) + (1 - v->Y[Y_su]) * v->f[f_pro_su] * v->rate[rate_5] + (1 - v->Y[Y_aa]) * v->f[f_pro_aa] * v->rate[rate_6] + (1 - v->Y[Y_c4]) * v->f[f_pro_c4] * v->rate[rate_8] - v->rate[rate_10];
	v->D[D_S_ac] = tau * (v->S_in[S_ac] - v->S[S_ac]) + (1 - v->Y[Y_su]) * v->f[f_ac_su] * v->rate[rate_5] + (1 - v->Y[Y_aa]) * v->f[f_ac_aa] * v->rate[rate_6] + (1 - v->Y[Y_fa]) * v->f[f_ac_fa] * v->rate[rate_7] + (1 - v->Y[Y_c4]) * v->f[f_ac_c4_8] * v->rate[rate_8] + (1 - v->Y[Y_c4]) * v->f[f_ac_c4_9] * v->rate[rate_9] + (1 - v->Y[Y_pro]) * v->f[f_ac_pro] * v->rate[rate_10] - v->rate[rate_11];
	v->D[D_S_h2] = tau * (v->S_in[S_h2] - v->S[S_h2]) + (1 - v->Y[Y_su]) * v->f[f_h2_su] * v->rate[rate_5] + (1 - v->Y[Y_aa]) * v->f[f_h2_aa] * v->rate[rate_6] + (1 - v->Y[Y_fa]) * v->f[f_h2_fa] * v->rate[rate_7] + (1 - v->Y[Y_c4]) * v->f[f_h2_c4_8] * v->rate[rate_8] + (1 - v->Y[Y_c4]) * v->f[f_h2_c4_9] * v->rate[rate_9] + (1 - v->Y[Y_pro]) * v->f[f_h2_pro] * v->rate[rate_10] - v->rate[rate_12] - v->rate[rate_T_8];
	v->D[D_S_ch4] = tau * (v->S_in[S_ch4] - v->S[S_ch4]) + (1 - v->Y[Y_ac]) * v->rate[rate_11] + (1 + v->Y[Y_h2]) * v->rate[rate_12] - v->rate[rate_T_9];

	v->D[D_X_c] = tau * (v->X_in[X_c] - v->X[X_c]) - v->rate[rate_1] + v->rate[rate_13] + v->rate[rate_14] + v->rate[rate_15] + v->rate[rate_16] + v->rate[rate_17] + v->rate[rate_18] + v->rate[rate_19];
	v->D[D_X_ch] = tau * (v->X_in[X_ch] - v->X[X_ch]) + v->f[f_ch_xc] * v->rate[rate_1] - v->rate[rate_2];
	v->D[D_X_pr] = tau * (v->X_in[X_pr] - v->X[X_pr]) + v->f[f_pr_xc] * v->rate[rate_1] - v->rate[rate_3];
	v->D[D_X_li] = tau * (v->X_in[X_li] - v->X[X_li]) + v->f[f_li_xc] * v->rate[rate_1] - v->rate[rate_4];
	v->D[D_X_su] = tau * (v->X_in[X_su] - v->X[X_su]) + v->Y[Y_su] * v->rate[rate_5] - v->rate[rate_13];
	v->D[D_X_aa] = tau * (v->X_in[X_aa] - v->X[X_aa]) + v->Y[Y_aa] * v->rate[rate_6] - v->rate[rate_14];
	v->D[D_X_fa] = tau * (v->X_in[X_fa] - v->X[X_fa]) + v->Y[Y_fa] * v->rate[rate_7] - v->rate[rate_15];
	v->D[D_X_c4] = tau * (v->X_in[X_c4] - v->X[X_c4]) + v->Y[Y_c4] * v->rate[rate_8] + v->Y[Y_c4] * v->rate[rate_9] - v->rate[rate_16];
	v->D[D_X_pro] = tau * (v->X_in[X_pro] - v->X[X_pro]) + v->Y[Y_pro] * v->rate[rate_10] - v->rate[rate_17];
	v->D[D_X_ac] = tau * (v->X_in[X_ac] - v->X[X_ac]) + v->Y[Y_ac] * v->rate[rate_11] - v->rate[rate_18];
	v->D[D_X_h2] = tau * (v->X_in[X_h2] - v->X[X_h2]) + v->Y[Y_h2] * v->rate[rate_12] - v->rate[rate_19];
	v->D[D_X_I] = tau * (v->X_in[X_I] - v->X[X_I]) + v->f[f_XI_xc] * v->rate[rate_1];
	v->D[D_S_cat] = tau * (v->S_in[S_cat] - v->S[S_cat]);
	v->D[D_S_an] = tau * (v->S_in[S_an] - v->S[S_an]);
}

// u[0] = S_su
// u[1] = S_aa
// u[2] = S_fa
// u[3] = S_va
// u[4] = S_bu
// u[5] = S_pro
// u[6] = S_ac
// u[9] = S_IC
// u[10] = S_IN
// u[16] = X_su
// u[17] = X_aa
// u[18] = X_fa
// u[19] = X_c4
// u[20] = X_pro
// u[22] = X_h2
// u[24] = S_cat
// u[25] = S_an
// u[26] = Q_ad
// u[33] = pH
// u[34] = S_H_ion
// u[43] = S_gas_h2
// u[51] = S_h2_i

// S[S_su] = 0.0123;
// S[S_aa] = 0.0056;
// S[S_fa] = 0.101;
// S[S_va] = 0.012;
// S[S_bu] = 0.014;
// S[S_pro] = 0.001;
// S[S_ac] = 0.001;
// S[S_h2] = 0.00000001;
// S[S_ch4] = 0.00001;
// S[S_IC] = 0.1;
// S[S_IN] = 0.0945;
// S[S_I] = 0.02;
// S[S_cat] = pow(10, -47);
// S[S_an] = 0.0052101;
// S[S_su] = 0.012394;
// S[S_aa] = 0.0055432;
// S[S_fa] = 0.10741;
// S[S_va] = 0.012333;
// S[S_bu] = 0.014003;
// S[S_pro] = 0.017584;
// S[S_ac] = 0.089315;
// S[S_h2] = 2.51E-07;
// S[S_ch4] = 0.05549;
// S[S_IC] = 0.095149;
// S[S_IN] = 0.094468;
// S[S_I] = 0.13087;
// S[S_H_ion] = 5.46e-08;
// S[S_va_ion] = 0.012284;
// S[S_bu_ion] = 0.013953;
// S[S_pro_ion] = 0.017511;
// S[S_ac_ion] = 0.089035;
// S[S_hco3_ion] = 0.08568;
// S[S_co2] = 0.0094689;
// S[S_nh3] = 0.001884;
// S[S_nh4_ion] = 0.092584;
// S[S_gas_h2] = 1.10e-05;
// S[S_gas_ch4] = 1.6535;
// S[S_gas_co2] = 0.01354;

// X[X_c] = 2.0;
// X[X_ch] = 5.0;
// X[X_pr] = 20.0;
// X[X_li] = 5.0;
// X[X_su] = 0.0;
// X[X_aa] = 0.01;
// X[X_fa] = 0.01;
// X[X_c4] = 0.01;
// X[X_pro] = 0.01;
// X[X_ac] = 0.01;
// X[X_h2] = 0.01;
// X[X_I] = 25.0;

// k[k_dis] = 0.5;
// k[k_hyd_ch] = 10;
// k[k_hyd_pr] = 10;
// k[k_hyd_li] = 10;
// k[k_m_su] = 30;
// k[k_m_aa] = 50;
// k[k_m_fa] = 6;
// k[k_m_c4] = 20;
// k[k_m_pro] = 13;
// k[k_m_ac] = 8;
// k[k_m_h2] = 35;
// k[k_dec_Xsu] = 0.02;
// k[k_dec_Xaa] = 0.02;
// k[k_dec_Xfa] = 0.02;
// k[k_dec_Xc4] = 0.02;
// k[k_dec_Xpro] = 0.02;
// k[k_dec_Xac] = 0.02;
// k[k_dec_Xh2] = 0.02;
// k[k_p] = 50000;

// K[K_S_IN] = 0.0001;
// K[K_S_su] = 0.5;
// K[K_S_aa] = 0.3;
// K[K_S_fa] = 0.4;
// K[K_I_h2_fa] = 0.000005;
// K[K_S_c4] = 0.2;
// K[K_I_h2_c4] = 0.00001;
// K[K_S_pro] = 0.1;
// K[K_I_h2_pro] = 0.0000035;
// K[K_S_ac] = 0.15;
// K[K_I_nh3] = 0.0018;
// K[K_S_h2] = 0.000007;
// K[K_w] = pow(10.0, -14) * pow(var[E], 55900.0 / (100.0 * var[R]) * frac);
// K[K_a_va] = pow(10.0, -4.86);
// K[K_a_bu] = pow(10.0, -4.82);
// K[K_a_pro] = pow(10.0, -4.88);
// K[K_a_ac] = pow(10.0, -4.76);
// K[K_a_co2] = pow(10.0, -6.35) * pow(var[E], 7646.0 / (100.0 * var[R]) * frac);
// K[K_a_IN] = pow(10.0, -9.25) * pow(var[E], 51965.0 / (100.0 * var[R]) * frac);
// K[K_A_Bva] = 10000000000;
// K[K_A_Bbu] = 10000000000;
// K[K_A_Bpro] = 10000000000;
// K[K_A_Bac] = 10000000000;
// K[K_A_Bco2] = 10000000000;
// K[K_A_BIN] = 10000000000;
// K[K_La] = 200;
// K[K_H_co2] = 0.035 * pow(var[E], -19410.0 / (100.0 * var[R]) * frac);
// K[K_H_ch4] = 0.0014 * pow(var[E], -14240.0 / (100.0 * var[R]) * frac);
// K[K_H_h2] = 0.00078 * pow(var[E], -4180.0 / (100.0 * var[R]) * frac);

