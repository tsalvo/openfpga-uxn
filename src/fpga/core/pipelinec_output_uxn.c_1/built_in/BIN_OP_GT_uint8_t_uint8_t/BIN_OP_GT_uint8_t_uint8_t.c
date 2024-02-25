
#include "uintN_t.h"
#include "intN_t.h"
//#include "bit_manip.h"
uint1_t BIN_OP_GT_uint8_t_uint8_t(uint8_t left, uint8_t right)
{

    // Bottom without any extra bits    
    uint8_t left_bot = left;
    uint8_t right_bot = right;
    uint1_t rv;

    // Subtractor based compare
    int9_t sub = (int9_t)right_bot - left_bot;
    uint1_t lt_zero = sub(8,8);
    rv = lt_zero;

  return rv;  
}