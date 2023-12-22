#include "intN_t.h"
#include "uintN_t.h"
#include "bit_math.h"


// Var ref read
uint12_t VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d(uint12_t ref_toks_0[4], uint2_t var_dim_0)
{
  uint12_t base[4];
 // Assign ref toks to base
 base = ref_toks_0;
 // Make multiple constant references into base
 uint12_t ref_0;
 ref_0 = base[0];
 uint12_t ref_1;
 ref_1 = base[1];
 uint12_t ref_2;
 ref_2 = base[2];
 uint12_t ref_3;
 ref_3 = base[3];
 // Form select value
 uint2_t sel;
 sel = 0;
 sel = uint2_uint2_0( sel, var_dim_0);
 // Do nmux
 uint12_t rv;
 rv = uint12_mux4(sel,
     ref_0,
     ref_1,
     ref_2,
     ref_3
 );

  return rv;
}