
#include "intN_t.h"  
#include "uintN_t.h"
#include "bit_manip.h"

// 8shifted right by maximum 7b
uint8_t BIN_OP_SR_uint8_t_uint3_t(uint8_t left, uint3_t right)
{
  // Resize the shift amount (right)
  uint3_t resized_shift_amount;
  resized_shift_amount = right;
  
  // Output
  uint8_t rv;

    // Otherwise use Victor's muxes
    uint8_t v0 = left;
    uint8_t v1 = uint8_0_0(resized_shift_amount) ? (v0 >> 1) : v0;
    uint8_t v2 = uint8_1_1(resized_shift_amount) ? (v1 >> 2) : v1;
    uint8_t v3 = uint8_2_2(resized_shift_amount) ? (v2 >> 4) : v2;
    rv = v3;

  return rv;
}