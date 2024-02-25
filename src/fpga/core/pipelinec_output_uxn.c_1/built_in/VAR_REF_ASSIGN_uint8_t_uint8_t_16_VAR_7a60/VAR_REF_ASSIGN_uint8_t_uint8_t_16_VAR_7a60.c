
#include "intN_t.h"
#include "uintN_t.h"
#include "bit_math.h"
typedef uint8_t uint8_t_array_16_t; // FUCK

// Var ref assignment
uint8_t_array_16_t VAR_REF_ASSIGN_uint8_t_uint8_t_16_VAR_7a60(uint8_t elem_val, uint8_t ref_toks_0[16], uint4_t var_dim_0)
{
  uint8_t base[16];
 // Assign ref toks to base
 base = ref_toks_0;
 // Copy base into rv
 uint8_t_array_16_t rv;
 rv.data[2] = base[2];
 rv.data[8] = base[8];
 rv.data[5] = base[5];
 rv.data[11] = base[11];
 rv.data[14] = base[14];
 rv.data[3] = base[3];
 rv.data[0] = base[0];
 rv.data[6] = base[6];
 rv.data[9] = base[9];
 rv.data[15] = base[15];
 rv.data[12] = base[12];
 rv.data[1] = base[1];
 rv.data[4] = base[4];
 rv.data[10] = base[10];
 rv.data[7] = base[7];
 rv.data[13] = base[13];
 // Do mux for each element
 if(
   (var_dim_0 == 2) 
 )
 {
   rv.data[2] = elem_val;
 }
 if(
   (var_dim_0 == 8) 
 )
 {
   rv.data[8] = elem_val;
 }
 if(
   (var_dim_0 == 5) 
 )
 {
   rv.data[5] = elem_val;
 }
 if(
   (var_dim_0 == 11) 
 )
 {
   rv.data[11] = elem_val;
 }
 if(
   (var_dim_0 == 14) 
 )
 {
   rv.data[14] = elem_val;
 }
 if(
   (var_dim_0 == 3) 
 )
 {
   rv.data[3] = elem_val;
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
   (var_dim_0 == 9) 
 )
 {
   rv.data[9] = elem_val;
 }
 if(
   (var_dim_0 == 15) 
 )
 {
   rv.data[15] = elem_val;
 }
 if(
   (var_dim_0 == 12) 
 )
 {
   rv.data[12] = elem_val;
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
   (var_dim_0 == 10) 
 )
 {
   rv.data[10] = elem_val;
 }
 if(
   (var_dim_0 == 7) 
 )
 {
   rv.data[7] = elem_val;
 }
 if(
   (var_dim_0 == 13) 
 )
 {
   rv.data[13] = elem_val;
 }

  return rv;
}