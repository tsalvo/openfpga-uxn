
#include "uintN_t.h"
#include "bit_manip.h"

// 8b / 8b div
uint8_t BIN_OP_DIV_uint8_t_uint8_t(uint8_t left, uint8_t right)
{
  // Resize
  uint8_t left_resized;
  left_resized = left;
  uint8_t right_resized;
  right_resized = right;
  
  // Output
  uint8_t output;
  output = 0;
  // Remainder
  uint8_t remainder;
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
  
  // Bit 7
  new_remainder0 = uint8_7_7(left);
  remainder = uint8_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint8_uint1_7(output, 1);
  }
  // Bit 6
  new_remainder0 = uint8_6_6(left);
  remainder = uint8_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint8_uint1_6(output, 1);
  }
  // Bit 5
  new_remainder0 = uint8_5_5(left);
  remainder = uint8_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint8_uint1_5(output, 1);
  }
  // Bit 4
  new_remainder0 = uint8_4_4(left);
  remainder = uint8_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint8_uint1_4(output, 1);
  }
  // Bit 3
  new_remainder0 = uint8_3_3(left);
  remainder = uint8_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint8_uint1_3(output, 1);
  }
  // Bit 2
  new_remainder0 = uint8_2_2(left);
  remainder = uint8_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint8_uint1_2(output, 1);
  }
  // Bit 1
  new_remainder0 = uint8_1_1(left);
  remainder = uint8_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint8_uint1_1(output, 1);
  }
  // Bit 0
  new_remainder0 = uint8_0_0(left);
  remainder = uint8_uint1(remainder, new_remainder0);       
  if(remainder >= right)
  {
    remainder = remainder - right;
    // Set output(i)=1
    output = uint8_uint1_0(output, 1);
  }
  return output;
}