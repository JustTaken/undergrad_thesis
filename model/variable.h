#ifndef VARIABLE
#define VARIABLE

#include <math.h>

typedef unsigned int u32;
typedef double real;

typedef struct {
	real* var;
	real* f;
	real* N;
	real* C;
	real* Y;
	real* k;
	real* K;
	real* S;
	real* X;
	real* pH;
	real* rate;
	real* I;
	real* p;
} Variables;

Variables init_variables();
void iterate_rate(Variables* v);

enum {
	f_SI_xc,
	f_XI_xc,
	f_ch_xc,
	f_pr_xc,
	f_li_xc,
	f_fa_li,
	f_h2_aa,
	f_va_aa,
	f_bu_aa,
	f_pro_aa,
	f_ac_aa,
	f_h2_su,
	f_bu_su,
	f_pro_su,
	f_ac_su,
	f_count,
};

enum {
	N_xc,
	N_I,
	N_aa,
	N_bac,
	N_count,
};

enum {
	C_xc,
	C_SI,
	C_ch,
	C_li,
	C_XI,
	C_su,
	C_aa,
	C_fa,
	C_bu,
	C_pro,
	C_ac,
	C_bac,
	C_va,
	C_ch4,
	C_count,
};

enum {
	Y_su,
	Y_aa,
	Y_fa,
	Y_c4,
	Y_pro,
	Y_ac,
	Y_h2,
	Y_count,
};

enum {
	rate_1,
	rate_2,
	rate_3,
	rate_4,
	rate_5,
	rate_6,
	rate_7,
	rate_8,
	rate_9,
	rate_10,
	rate_11,
	rate_12,
	rate_13,
	rate_14,
	rate_15,
	rate_16,
	rate_17,
	rate_18,
	rate_19,
	rate_T_8,
	rate_T_9,
	rate_T_10,
	rate_count,
};

enum {
	k_dis,
	k_hyd_ch,
	k_hyd_pr,
	k_hyd_li,
	k_m_su,
	k_m_aa,
	k_m_fa,
	k_m_c4,
	k_m_pro,
	k_m_ac,
	k_m_h2,
	k_dec_Xsu,
	k_dec_Xaa,
	k_dec_Xfa,
	k_dec_Xc4,
	k_dec_Xpro,
	k_dec_Xac,
	k_dec_Xh2,
	k_p,
	k_count,
};

enum {
	K_S_IN,
	K_S_su,
	K_S_aa,
	K_S_fa,
	K_I_h2_fa,
	K_S_c4,
	K_I_h2_c4,
	K_S_pro,
	K_I_h2_pro,
	K_S_ac,
	K_I_nh3,
	K_S_h2,
	K_w,
	K_a_va,
	K_a_bu,
	K_a_pro,
	K_a_ac,
	K_a_co2,
	K_a_IN,
	K_A_Bva,
	K_A_Bbu,
	K_A_Bpro,
	K_A_Bac,
	K_A_Bco2,
	K_A_BIN,
	K_La,
	K_H_co2,
	K_H_ch4,
	K_H_h2,
	K_count,
};

enum {
	S_su,
	S_aa,
	S_fa,
	S_va,
	S_bu,
	S_pro,
	S_ac,
	S_h2,
	S_ch4,
	S_IC,
	S_IN,
	S_I,
	S_cat,
	S_an,
	S_H_ion,
	S_va_ion,
	S_bu_ion,
	S_pro_ion,
	S_ac_ion,
	S_hco3_ion,
	S_co2,
	S_nh3,
	S_nh4_ion,
	S_gas_h2,
	S_gas_ch4,
	S_gas_co2,
	S_count,
};

enum {
	X_c,
	X_ch,
	X_pr,
	X_li,
	X_su,
	X_aa,
	X_fa,
	X_c4,
	X_pro,
	X_ac,
	X_h2,
	X_I,
	X_count,
};

enum {
	pH_UL_aa,
	pH_LL_aa,
	pH_UL_ac,
	pH_LL_ac,
	pH_UL_h2,
	pH_LL_h2,
	pH_count,
};

enum {
	I_IN_lim,
	I_h2_fa,
	I_h2_c4,
	I_h2_pro,
	I_nh3,
	I_5,
	I_6,
	I_7,
	I_8,
	I_9,
	I_10,
	I_11,
	I_12,
	I_pH_aa,
	I_pH_ac,
	I_pH_h2,
	I_count,
};

enum {
	p_gas_h2,
	p_gas_ch4,
	p_gas_co2,
	p_gas_h2o,
	p_count
};

enum {
	E,
	R,

	T_base,
	T_ad,
	T_op,

	P_atm,

	V_ad_liq,
	V_ad_gas,

	Q_ad,
	Q_gas,

	var_count,
};
	
#endif