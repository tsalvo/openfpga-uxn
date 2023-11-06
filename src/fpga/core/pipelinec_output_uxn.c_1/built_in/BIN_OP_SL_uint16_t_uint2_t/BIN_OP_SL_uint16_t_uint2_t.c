
#include "intN_t.h"
#include "uintN_t.h"
#include "bit_manip.h"

// 16shifted left by maximum 15b
uint16_t BIN_OP_SL_uint16_t_uint2_t(uint16_t left, uint2_t right)
{
  // Resize the shift amount (right)
  uint2_t resized_shift_amount;
  resized_shift_amount = right;

  // Output
  uint16_t rv;

    // Otherwise use Victor's muxes
    uint16_t v0 = left;
    uint16_t v1 = uint16_0_0(resized_shift_amount) ? (v0 << 1) : v0;
    uint16_t v2 = uint16_1_1(resized_shift_amount) ? (v1 << 2) : v1;
    rv = v2;

  return rv;
}