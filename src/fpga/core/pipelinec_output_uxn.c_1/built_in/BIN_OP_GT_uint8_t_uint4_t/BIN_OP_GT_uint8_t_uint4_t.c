
#include "uintN_t.h"
#include "intN_t.h"
//#include "bit_manip.h"
uint1_t BIN_OP_GT_uint8_t_uint4_t(uint8_t left, uint4_t right)
{

    // Bottom without any extra bits    
    uint4_t left_bot = left;
    uint4_t right_bot = right;
    
  uint4_t top;
  top = left >> 4;
    uint1_t rv;
  if(top==0){
    // Subtractor based compare
    int5_t sub = (int5_t)right_bot - left_bot;
    uint1_t lt_zero = sub(4,4);
    rv = lt_zero;
  }else{
    // Left is large, GT/E is true
    rv = 1;
  }

  return rv;  
}