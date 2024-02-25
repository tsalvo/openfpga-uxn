
#include "intN_t.h"
#include "uintN_t.h"
#include "bit_math.h"
typedef uint8_t uint8_t_array_8_t; // FUCK

// Var ref assignment
uint8_t_array_8_t VAR_REF_ASSIGN_uint8_t_uint8_t_8_VAR_52b8(uint8_t elem_val, uint8_t ref_toks_0[8], uint3_t var_dim_0)
{
  uint8_t base[8];
 // Assign ref toks to base
 base = ref_toks_0;
 // Copy base into rv
 uint8_t_array_8_t rv;
 rv.data[2] = base[2];
 rv.data[5] = base[5];
 rv.data[1] = base[1];
 rv.data[4] = base[4];
 rv.data[7] = base[7];
 rv.data[0] = base[0];
 rv.data[6] = base[6];
 rv.data[3] = base[3];
 // Do mux for each element
 if(
   (var_dim_0 == 2) 
 )
 {
   rv.data[2] = elem_val;
 }
 if(
   (var_dim_0 == 5) 
 )
 {
   rv.data[5] = elem_val;
 }
 if(
   (var_dim_0 == 1) 
 )
 {
   rv.data[1] = elem_val;
 }
 if(
   (var_dim_0 == 4) 
 )
 {
   rv.data[4] = elem_val;
 }
 if(
   (var_dim_0 == 7) 
 )
 {
   rv.data[7] = elem_val;
 }
 if(
   (var_dim_0 == 0) 
 )
 {
   rv.data[0] = elem_val;
 }
 if(
   (var_dim_0 == 6) 
 )
 {
   rv.data[6] = elem_val;
 }
 if(
   (var_dim_0 == 3) 
 )
 {
   rv.data[3] = elem_val;
 }

  return rv;
}