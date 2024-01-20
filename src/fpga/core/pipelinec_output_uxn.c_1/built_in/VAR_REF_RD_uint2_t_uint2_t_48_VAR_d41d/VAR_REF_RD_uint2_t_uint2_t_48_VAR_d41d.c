#include "intN_t.h"
#include "uintN_t.h"
#include "bit_math.h"


// Var ref read
uint2_t VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d(uint2_t ref_toks_0[48], uint6_t var_dim_0)
{
  uint2_t base[48];
 // Assign ref toks to base
 base = ref_toks_0;
 // Make multiple constant references into base
 uint2_t ref_0;
 ref_0 = base[0];
 uint2_t ref_1;
 ref_1 = base[1];
 uint2_t ref_2;
 ref_2 = base[2];
 uint2_t ref_3;
 ref_3 = base[3];
 uint2_t ref_4;
 ref_4 = base[4];
 uint2_t ref_5;
 ref_5 = base[5];
 uint2_t ref_6;
 ref_6 = base[6];
 uint2_t ref_7;
 ref_7 = base[7];
 uint2_t ref_8;
 ref_8 = base[8];
 uint2_t ref_9;
 ref_9 = base[9];
 uint2_t ref_10;
 ref_10 = base[10];
 uint2_t ref_11;
 ref_11 = base[11];
 uint2_t ref_12;
 ref_12 = base[12];
 uint2_t ref_13;
 ref_13 = base[13];
 uint2_t ref_14;
 ref_14 = base[14];
 uint2_t ref_15;
 ref_15 = base[15];
 uint2_t ref_16;
 ref_16 = base[16];
 uint2_t ref_17;
 ref_17 = base[17];
 uint2_t ref_18;
 ref_18 = base[18];
 uint2_t ref_19;
 ref_19 = base[19];
 uint2_t ref_20;
 ref_20 = base[20];
 uint2_t ref_21;
 ref_21 = base[21];
 uint2_t ref_22;
 ref_22 = base[22];
 uint2_t ref_23;
 ref_23 = base[23];
 uint2_t ref_24;
 ref_24 = base[24];
 uint2_t ref_25;
 ref_25 = base[25];
 uint2_t ref_26;
 ref_26 = base[26];
 uint2_t ref_27;
 ref_27 = base[27];
 uint2_t ref_28;
 ref_28 = base[28];
 uint2_t ref_29;
 ref_29 = base[29];
 uint2_t ref_30;
 ref_30 = base[30];
 uint2_t ref_31;
 ref_31 = base[31];
 uint2_t ref_32;
 ref_32 = base[32];
 uint2_t ref_33;
 ref_33 = base[33];
 uint2_t ref_34;
 ref_34 = base[34];
 uint2_t ref_35;
 ref_35 = base[35];
 uint2_t ref_36;
 ref_36 = base[36];
 uint2_t ref_37;
 ref_37 = base[37];
 uint2_t ref_38;
 ref_38 = base[38];
 uint2_t ref_39;
 ref_39 = base[39];
 uint2_t ref_40;
 ref_40 = base[40];
 uint2_t ref_41;
 ref_41 = base[41];
 uint2_t ref_42;
 ref_42 = base[42];
 uint2_t ref_43;
 ref_43 = base[43];
 uint2_t ref_44;
 ref_44 = base[44];
 uint2_t ref_45;
 ref_45 = base[45];
 uint2_t ref_46;
 ref_46 = base[46];
 uint2_t ref_47;
 ref_47 = base[47];
 // Form select value
 uint6_t sel;
 sel = 0;
 sel = uint6_uint6_0( sel, var_dim_0);
 // Do nmux
 uint2_t rv;
 rv = uint2_mux64(sel,
     ref_0,
     ref_1,
     ref_2,
     ref_3,
     ref_4,
     ref_5,
     ref_6,
     ref_7,
     ref_8,
     ref_9,
     ref_10,
     ref_11,
     ref_12,
     ref_13,
     ref_14,
     ref_15,
     ref_16,
     ref_17,
     ref_18,
     ref_19,
     ref_20,
     ref_21,
     ref_22,
     ref_23,
     ref_24,
     ref_25,
     ref_26,
     ref_27,
     ref_28,
     ref_29,
     ref_30,
     ref_31,
     ref_32,
     ref_33,
     ref_34,
     ref_35,
     ref_36,
     ref_37,
     ref_38,
     ref_39,
     ref_40,
     ref_41,
     ref_42,
     ref_43,
     ref_44,
     ref_45,
     ref_46,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47,
     ref_47
 );

  return rv;
}