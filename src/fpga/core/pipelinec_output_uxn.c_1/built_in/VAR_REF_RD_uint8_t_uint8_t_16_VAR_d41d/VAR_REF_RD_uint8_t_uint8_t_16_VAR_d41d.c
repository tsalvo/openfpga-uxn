#include "intN_t.h"
#include "uintN_t.h"
#include "bit_math.h"


// Var ref read
uint8_t VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d(uint8_t ref_toks_0[16], uint4_t var_dim_0)
{
  uint8_t base[16];
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
 // Form select value
 uint4_t sel;
 sel = 0;
 sel = uint4_uint4_0( sel, var_dim_0);
 // Do nmux
 uint8_t rv;
 rv = uint8_mux16(sel,
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
     ref_15
 );

  return rv;
}