#include "intN_t.h"
#include "uintN_t.h"
#include "bit_math.h"


// Var ref read
uint8_t VAR_REF_RD_uint8_t_uint8_t_80_VAR_d41d(uint8_t ref_toks_0[80], uint7_t var_dim_0)
{
  uint8_t base[80];
 // Assign ref toks to base
 base = ref_toks_0;
 // Make multiple constant references into base
 uint8_t ref_0;
 ref_0 = base[0];
 uint8_t ref_1;
 ref_1 = base[1];
 uint8_t ref_2;
 ref_2 = base[2];
 uint8_t ref_3;
 ref_3 = base[3];
 uint8_t ref_4;
 ref_4 = base[4];
 uint8_t ref_5;
 ref_5 = base[5];
 uint8_t ref_6;
 ref_6 = base[6];
 uint8_t ref_7;
 ref_7 = base[7];
 uint8_t ref_8;
 ref_8 = base[8];
 uint8_t ref_9;
 ref_9 = base[9];
 uint8_t ref_10;
 ref_10 = base[10];
 uint8_t ref_11;
 ref_11 = base[11];
 uint8_t ref_12;
 ref_12 = base[12];
 uint8_t ref_13;
 ref_13 = base[13];
 uint8_t ref_14;
 ref_14 = base[14];
 uint8_t ref_15;
 ref_15 = base[15];
 uint8_t ref_16;
 ref_16 = base[16];
 uint8_t ref_17;
 ref_17 = base[17];
 uint8_t ref_18;
 ref_18 = base[18];
 uint8_t ref_19;
 ref_19 = base[19];
 uint8_t ref_20;
 ref_20 = base[20];
 uint8_t ref_21;
 ref_21 = base[21];
 uint8_t ref_22;
 ref_22 = base[22];
 uint8_t ref_23;
 ref_23 = base[23];
 uint8_t ref_24;
 ref_24 = base[24];
 uint8_t ref_25;
 ref_25 = base[25];
 uint8_t ref_26;
 ref_26 = base[26];
 uint8_t ref_27;
 ref_27 = base[27];
 uint8_t ref_28;
 ref_28 = base[28];
 uint8_t ref_29;
 ref_29 = base[29];
 uint8_t ref_30;
 ref_30 = base[30];
 uint8_t ref_31;
 ref_31 = base[31];
 uint8_t ref_32;
 ref_32 = base[32];
 uint8_t ref_33;
 ref_33 = base[33];
 uint8_t ref_34;
 ref_34 = base[34];
 uint8_t ref_35;
 ref_35 = base[35];
 uint8_t ref_36;
 ref_36 = base[36];
 uint8_t ref_37;
 ref_37 = base[37];
 uint8_t ref_38;
 ref_38 = base[38];
 uint8_t ref_39;
 ref_39 = base[39];
 uint8_t ref_40;
 ref_40 = base[40];
 uint8_t ref_41;
 ref_41 = base[41];
 uint8_t ref_42;
 ref_42 = base[42];
 uint8_t ref_43;
 ref_43 = base[43];
 uint8_t ref_44;
 ref_44 = base[44];
 uint8_t ref_45;
 ref_45 = base[45];
 uint8_t ref_46;
 ref_46 = base[46];
 uint8_t ref_47;
 ref_47 = base[47];
 uint8_t ref_48;
 ref_48 = base[48];
 uint8_t ref_49;
 ref_49 = base[49];
 uint8_t ref_50;
 ref_50 = base[50];
 uint8_t ref_51;
 ref_51 = base[51];
 uint8_t ref_52;
 ref_52 = base[52];
 uint8_t ref_53;
 ref_53 = base[53];
 uint8_t ref_54;
 ref_54 = base[54];
 uint8_t ref_55;
 ref_55 = base[55];
 uint8_t ref_56;
 ref_56 = base[56];
 uint8_t ref_57;
 ref_57 = base[57];
 uint8_t ref_58;
 ref_58 = base[58];
 uint8_t ref_59;
 ref_59 = base[59];
 uint8_t ref_60;
 ref_60 = base[60];
 uint8_t ref_61;
 ref_61 = base[61];
 uint8_t ref_62;
 ref_62 = base[62];
 uint8_t ref_63;
 ref_63 = base[63];
 uint8_t ref_64;
 ref_64 = base[64];
 uint8_t ref_65;
 ref_65 = base[65];
 uint8_t ref_66;
 ref_66 = base[66];
 uint8_t ref_67;
 ref_67 = base[67];
 uint8_t ref_68;
 ref_68 = base[68];
 uint8_t ref_69;
 ref_69 = base[69];
 uint8_t ref_70;
 ref_70 = base[70];
 uint8_t ref_71;
 ref_71 = base[71];
 uint8_t ref_72;
 ref_72 = base[72];
 uint8_t ref_73;
 ref_73 = base[73];
 uint8_t ref_74;
 ref_74 = base[74];
 uint8_t ref_75;
 ref_75 = base[75];
 uint8_t ref_76;
 ref_76 = base[76];
 uint8_t ref_77;
 ref_77 = base[77];
 uint8_t ref_78;
 ref_78 = base[78];
 uint8_t ref_79;
 ref_79 = base[79];
 // Form select value
 uint7_t sel;
 sel = 0;
 sel = uint7_uint7_0( sel, var_dim_0);
 // Do nmux
 uint8_t rv;
 rv = uint8_mux128(sel,
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
     ref_48,
     ref_49,
     ref_50,
     ref_51,
     ref_52,
     ref_53,
     ref_54,
     ref_55,
     ref_56,
     ref_57,
     ref_58,
     ref_59,
     ref_60,
     ref_61,
     ref_62,
     ref_63,
     ref_64,
     ref_65,
     ref_66,
     ref_67,
     ref_68,
     ref_69,
     ref_70,
     ref_71,
     ref_72,
     ref_73,
     ref_74,
     ref_75,
     ref_76,
     ref_77,
     ref_78,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79,
     ref_79
 );

  return rv;
}