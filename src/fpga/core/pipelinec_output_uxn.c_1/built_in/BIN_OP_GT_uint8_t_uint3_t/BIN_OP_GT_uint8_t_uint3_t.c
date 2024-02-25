
#include "uintN_t.h"
#include "intN_t.h"
//#include "bit_manip.h"
uint1_t BIN_OP_GT_uint8_t_uint3_t(uint8_t left, uint3_t right)
{

    // Bottom without any extra bits    
    uint3_t left_bot = left;
    uint3_t right_bot = right;
    
  uint5_t top;
  top = left >> 3;
    uint1_t rv;
  if(top==0){
    // Subtractor based compare
    int4_t sub = (int4_t)right_bot - left_bot;
    uint1_t lt_zero = sub(3,3);
    rv = lt_zero;
  }else{
    // Left is large, GT/E is true
    rv = 1;
  }

  return rv;  
}