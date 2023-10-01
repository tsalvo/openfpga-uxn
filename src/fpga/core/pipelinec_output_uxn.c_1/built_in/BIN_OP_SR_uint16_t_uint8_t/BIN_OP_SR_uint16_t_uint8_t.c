
#include "intN_t.h"  
#include "uintN_t.h"
#include "bit_manip.h"

// 16shifted right by maximum 15b
uint16_t BIN_OP_SR_uint16_t_uint8_t(uint16_t left, uint8_t right)
{
  // Resize the shift amount (right)
  uint4_t resized_shift_amount;
  resized_shift_amount = right;
  
  // Output
  uint16_t rv;

  // Check for oversized
  if(right > 15)
  {
    // Append sign bits on left and select rv from MSBs
    uint1_t sign;
    sign = 0;
    // Big shift all sign bits
    rv = uint1_16(sign);

  }
  else
  {

    // Otherwise use Victor's muxes
    uint16_t v0 = left;
    uint16_t v1 = uint16_0_0(resized_shift_amount) ? (v0 >> 1) : v0;
    uint16_t v2 = uint16_1_1(resized_shift_amount) ? (v1 >> 2) : v1;
    uint16_t v3 = uint16_2_2(resized_shift_amount) ? (v2 >> 4) : v2;
    uint16_t v4 = uint16_3_3(resized_shift_amount) ? (v3 >> 8) : v3;
    rv = v4;

  }

  return rv;
}