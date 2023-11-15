
#include "uintN_t.h"
#include "bit_manip.h"

// 24b / 9b div
uint24_t BIN_OP_DIV_uint24_t_uint9_t(uint24_t left, uint9_t right)
{
  // Resize
  uint24_t left_resized;
  left_resized = left;
  uint24_t right_resized;
  right_resized = right;
  
  // Output
  uint24_t output;
  output = 0;
  // Remainder
  uint24_t remainder;
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
  
  // Bit 23
  new_remainder0 = uint24_23_23(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_23(output, 1);
  }
  // Bit 22
  new_remainder0 = uint24_22_22(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_22(output, 1);
  }
  // Bit 21
  new_remainder0 = uint24_21_21(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_21(output, 1);
  }
  // Bit 20
  new_remainder0 = uint24_20_20(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_20(output, 1);
  }
  // Bit 19
  new_remainder0 = uint24_19_19(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_19(output, 1);
  }
  // Bit 18
  new_remainder0 = uint24_18_18(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_18(output, 1);
  }
  // Bit 17
  new_remainder0 = uint24_17_17(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_17(output, 1);
  }
  // Bit 16
  new_remainder0 = uint24_16_16(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_16(output, 1);
  }
  // Bit 15
  new_remainder0 = uint24_15_15(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_15(output, 1);
  }
  // Bit 14
  new_remainder0 = uint24_14_14(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_14(output, 1);
  }
  // Bit 13
  new_remainder0 = uint24_13_13(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_13(output, 1);
  }
  // Bit 12
  new_remainder0 = uint24_12_12(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_12(output, 1);
  }
  // Bit 11
  new_remainder0 = uint24_11_11(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_11(output, 1);
  }
  // Bit 10
  new_remainder0 = uint24_10_10(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_10(output, 1);
  }
  // Bit 9
  new_remainder0 = uint24_9_9(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_9(output, 1);
  }
  // Bit 8
  new_remainder0 = uint24_8_8(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_8(output, 1);
  }
  // Bit 7
  new_remainder0 = uint24_7_7(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_7(output, 1);
  }
  // Bit 6
  new_remainder0 = uint24_6_6(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_6(output, 1);
  }
  // Bit 5
  new_remainder0 = uint24_5_5(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_5(output, 1);
  }
  // Bit 4
  new_remainder0 = uint24_4_4(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_4(output, 1);
  }
  // Bit 3
  new_remainder0 = uint24_3_3(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_3(output, 1);
  }
  // Bit 2
  new_remainder0 = uint24_2_2(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_2(output, 1);
  }
  // Bit 1
  new_remainder0 = uint24_1_1(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_1(output, 1);
  }
  // Bit 0
  new_remainder0 = uint24_0_0(left);
  remainder = uint24_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint24_uint1_0(output, 1);
  }
  return output;
}