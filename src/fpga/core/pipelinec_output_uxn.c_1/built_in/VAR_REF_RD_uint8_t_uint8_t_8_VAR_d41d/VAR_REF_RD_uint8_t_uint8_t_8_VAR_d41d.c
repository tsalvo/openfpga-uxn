#include "intN_t.h"
#include "uintN_t.h"
#include "bit_math.h"


// Var ref read
uint8_t VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d(uint8_t ref_toks_0[8], uint3_t var_dim_0)
{
  uint8_t base[8];
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
 // Form select value
 uint3_t sel;
 sel = 0;
 sel = uint3_uint3_0( sel, var_dim_0);
 // Do nmux
 uint8_t rv;
 rv = uint8_mux8(sel,
     ref_0,
     ref_1,
     ref_2,
     ref_3,
     ref_4,
     ref_5,
     ref_6,
     ref_7
 );

  return rv;
}