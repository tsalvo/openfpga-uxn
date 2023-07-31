
#include "uintN_t.h"
#include "bit_manip.h"

// 16b / 16b div
uint16_t BIN_OP_DIV_uint16_t_uint16_t(uint16_t left, uint16_t right)
{
  // Resize
  uint16_t left_resized;
  left_resized = left;
  uint16_t right_resized;
  right_resized = right;
  
  // Output
  uint16_t output;
  output = 0;
  // Remainder
  uint16_t remainder;
  remainder = 0;
  uint1_t new_remainder0; 
  

  /*
  UNROLL THIS
  remainder := 0
  -- Where n is number of bits in left           
  for i := n - 1 .. 0 do     
    -- Left-shift remainder by 1 bit     
    remainder := remainder << 1
    -- Set the least-significant bit of remainder
    -- equal to bit i of the numerator
    remainder(0) := left(i)       
    if remainder >= right then
      remainder := remainder - right
      output(i) := 1
    end
  end 
  */
  
  // Bit 15
  new_remainder0 = uint16_15_15(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_15(output, 1);
  }
  // Bit 14
  new_remainder0 = uint16_14_14(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_14(output, 1);
  }
  // Bit 13
  new_remainder0 = uint16_13_13(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_13(output, 1);
  }
  // Bit 12
  new_remainder0 = uint16_12_12(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_12(output, 1);
  }
  // Bit 11
  new_remainder0 = uint16_11_11(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_11(output, 1);
  }
  // Bit 10
  new_remainder0 = uint16_10_10(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_10(output, 1);
  }
  // Bit 9
  new_remainder0 = uint16_9_9(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_9(output, 1);
  }
  // Bit 8
  new_remainder0 = uint16_8_8(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_8(output, 1);
  }
  // Bit 7
  new_remainder0 = uint16_7_7(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_7(output, 1);
  }
  // Bit 6
  new_remainder0 = uint16_6_6(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_6(output, 1);
  }
  // Bit 5
  new_remainder0 = uint16_5_5(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_5(output, 1);
  }
  // Bit 4
  new_remainder0 = uint16_4_4(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_4(output, 1);
  }
  // Bit 3
  new_remainder0 = uint16_3_3(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_3(output, 1);
  }
  // Bit 2
  new_remainder0 = uint16_2_2(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_2(output, 1);
  }
  // Bit 1
  new_remainder0 = uint16_1_1(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_1(output, 1);
  }
  // Bit 0
  new_remainder0 = uint16_0_0(left);
  remainder = uint16_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint16_uint1_0(output, 1);
  }
  return output;
}