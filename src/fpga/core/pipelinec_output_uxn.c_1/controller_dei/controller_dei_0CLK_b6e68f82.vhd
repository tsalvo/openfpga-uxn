-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 22
entity controller_dei_0CLK_b6e68f82 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end controller_dei_0CLK_b6e68f82;
architecture arch of controller_dei_0CLK_b6e68f82 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal device_port : unsigned(3 downto 0) := to_unsigned(0, 4);
signal REG_COMB_result : device_in_result_t;
signal REG_COMB_device_port : unsigned(3 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l476_c6_c114]
signal BIN_OP_EQ_uxn_device_h_l476_c6_c114_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l476_c6_c114_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l476_c6_c114_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l489_c1_28d2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l476_c2_9cb4]
signal result_MUX_uxn_device_h_l476_c2_9cb4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l476_c2_9cb4_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l476_c2_9cb4_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l476_c2_9cb4_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l490_c12_1277]
signal generic_dei_uxn_device_h_l490_c12_1277_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l490_c12_1277_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l490_c12_1277_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l490_c12_1277_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l490_c12_1277_return_output : device_in_result_t;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function uint8_4_4( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(4- i);
      end loop;
return return_output;
end function;

function uint8_uint1_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(0 downto 0) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_5_5( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(5- i);
      end loop;
return return_output;
end function;

function uint8_uint1_1( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(1 downto 1) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_6_6( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(6- i);
      end loop;
return return_output;
end function;

function uint8_uint1_2( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(2 downto 2) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_7_7( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(7- i);
      end loop;
return return_output;
end function;

function uint8_uint1_3( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(3 downto 3) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_0_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint8_uint1_4( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(4 downto 4) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_1_1( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint8_uint1_5( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(5 downto 5) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_2_2( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;

function uint8_uint1_6( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(6 downto 6) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_3_3( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;

function uint8_uint1_7( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(7 downto 7) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function CONST_REF_RD_device_in_result_t_device_in_result_t_5662( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return device_in_result_t is
 
  variable base : device_in_result_t; 
  variable return_output : device_in_result_t;
begin
      base.device_ram_address := ref_toks_0;
      base.dei_value := ref_toks_1;
      base.is_dei_done := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l476_c6_c114
BIN_OP_EQ_uxn_device_h_l476_c6_c114 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l476_c6_c114_left,
BIN_OP_EQ_uxn_device_h_l476_c6_c114_right,
BIN_OP_EQ_uxn_device_h_l476_c6_c114_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_return_output);

-- result_MUX_uxn_device_h_l476_c2_9cb4
result_MUX_uxn_device_h_l476_c2_9cb4 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l476_c2_9cb4_cond,
result_MUX_uxn_device_h_l476_c2_9cb4_iftrue,
result_MUX_uxn_device_h_l476_c2_9cb4_iffalse,
result_MUX_uxn_device_h_l476_c2_9cb4_return_output);

-- generic_dei_uxn_device_h_l490_c12_1277
generic_dei_uxn_device_h_l490_c12_1277 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l490_c12_1277_CLOCK_ENABLE,
generic_dei_uxn_device_h_l490_c12_1277_device_address,
generic_dei_uxn_device_h_l490_c12_1277_phase,
generic_dei_uxn_device_h_l490_c12_1277_previous_device_ram_read,
generic_dei_uxn_device_h_l490_c12_1277_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 controller0_buttons,
 previous_device_ram_read,
 -- Registers
 result,
 device_port,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l476_c6_c114_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_return_output,
 result_MUX_uxn_device_h_l476_c2_9cb4_return_output,
 generic_dei_uxn_device_h_l490_c12_1277_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l474_c16_15fe_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l476_c6_c114_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l476_c6_c114_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l476_c6_c114_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l476_c2_9cb4_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l476_c2_9cb4_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l476_c2_9cb4_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l476_c2_9cb4_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l476_c2_9cb4_cond : unsigned(0 downto 0);
 variable VAR_button_map : unsigned(7 downto 0);
 variable VAR_uint8_4_4_uxn_device_h_l477_c41_c224_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_0_uxn_device_h_l477_c24_f909_return_output : unsigned(7 downto 0);
 variable VAR_uint8_5_5_uxn_device_h_l478_c42_306d_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_1_uxn_device_h_l478_c16_b8d8_return_output : unsigned(7 downto 0);
 variable VAR_uint8_6_6_uxn_device_h_l479_c42_a64f_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_2_uxn_device_h_l479_c16_5e55_return_output : unsigned(7 downto 0);
 variable VAR_uint8_7_7_uxn_device_h_l480_c42_ab44_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_3_uxn_device_h_l480_c16_3f00_return_output : unsigned(7 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l481_c42_1e57_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_4_uxn_device_h_l481_c16_dbaf_return_output : unsigned(7 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l482_c42_1aec_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_5_uxn_device_h_l482_c16_20bd_return_output : unsigned(7 downto 0);
 variable VAR_uint8_2_2_uxn_device_h_l483_c42_ba7b_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_6_uxn_device_h_l483_c16_72f6_return_output : unsigned(7 downto 0);
 variable VAR_uint8_3_3_uxn_device_h_l484_c42_1ced_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_7_uxn_device_h_l484_c16_b1df_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l485_c3_a3a3 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l490_c12_1277_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l490_c12_1277_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l490_c12_1277_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l490_c12_1277_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l490_c12_1277_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
variable REG_VAR_device_port : unsigned(3 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_device_port := device_port;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l476_c6_c114_right := to_unsigned(2, 4);
     VAR_result_device_ram_address_uxn_device_h_l485_c3_a3a3 := resize(to_unsigned(0, 1), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_controller0_buttons := controller0_buttons;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l490_c12_1277_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l490_c12_1277_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l490_c12_1277_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l474_c16_15fe] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l474_c16_15fe_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- uint8_1_1[uxn_device_h_l482_c42_1aec] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l482_c42_1aec_return_output := uint8_1_1(
     VAR_controller0_buttons);

     -- uint8_3_3[uxn_device_h_l484_c42_1ced] LATENCY=0
     VAR_uint8_3_3_uxn_device_h_l484_c42_1ced_return_output := uint8_3_3(
     VAR_controller0_buttons);

     -- uint8_7_7[uxn_device_h_l480_c42_ab44] LATENCY=0
     VAR_uint8_7_7_uxn_device_h_l480_c42_ab44_return_output := uint8_7_7(
     VAR_controller0_buttons);

     -- uint8_5_5[uxn_device_h_l478_c42_306d] LATENCY=0
     VAR_uint8_5_5_uxn_device_h_l478_c42_306d_return_output := uint8_5_5(
     VAR_controller0_buttons);

     -- uint8_0_0[uxn_device_h_l481_c42_1e57] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l481_c42_1e57_return_output := uint8_0_0(
     VAR_controller0_buttons);

     -- uint8_6_6[uxn_device_h_l479_c42_a64f] LATENCY=0
     VAR_uint8_6_6_uxn_device_h_l479_c42_a64f_return_output := uint8_6_6(
     VAR_controller0_buttons);

     -- uint8_4_4[uxn_device_h_l477_c41_c224] LATENCY=0
     VAR_uint8_4_4_uxn_device_h_l477_c41_c224_return_output := uint8_4_4(
     VAR_controller0_buttons);

     -- uint8_2_2[uxn_device_h_l483_c42_ba7b] LATENCY=0
     VAR_uint8_2_2_uxn_device_h_l483_c42_ba7b_return_output := uint8_2_2(
     VAR_controller0_buttons);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l476_c6_c114_left := VAR_CAST_TO_uint4_t_uxn_device_h_l474_c16_15fe_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l474_c16_15fe_return_output;
     -- uint8_uint1_0[uxn_device_h_l477_c24_f909] LATENCY=0
     VAR_uint8_uint1_0_uxn_device_h_l477_c24_f909_return_output := uint8_uint1_0(
     resize(to_unsigned(0, 1), 8),
     VAR_uint8_4_4_uxn_device_h_l477_c41_c224_return_output);

     -- BIN_OP_EQ[uxn_device_h_l476_c6_c114] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l476_c6_c114_left <= VAR_BIN_OP_EQ_uxn_device_h_l476_c6_c114_left;
     BIN_OP_EQ_uxn_device_h_l476_c6_c114_right <= VAR_BIN_OP_EQ_uxn_device_h_l476_c6_c114_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l476_c6_c114_return_output := BIN_OP_EQ_uxn_device_h_l476_c6_c114_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l476_c6_c114_return_output;
     VAR_result_MUX_uxn_device_h_l476_c2_9cb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l476_c6_c114_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l489_c1_28d2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_return_output;

     -- uint8_uint1_1[uxn_device_h_l478_c16_b8d8] LATENCY=0
     VAR_uint8_uint1_1_uxn_device_h_l478_c16_b8d8_return_output := uint8_uint1_1(
     VAR_uint8_uint1_0_uxn_device_h_l477_c24_f909_return_output,
     VAR_uint8_5_5_uxn_device_h_l478_c42_306d_return_output);

     -- Submodule level 3
     VAR_generic_dei_uxn_device_h_l490_c12_1277_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l489_c1_28d2_return_output;
     -- uint8_uint1_2[uxn_device_h_l479_c16_5e55] LATENCY=0
     VAR_uint8_uint1_2_uxn_device_h_l479_c16_5e55_return_output := uint8_uint1_2(
     VAR_uint8_uint1_1_uxn_device_h_l478_c16_b8d8_return_output,
     VAR_uint8_6_6_uxn_device_h_l479_c42_a64f_return_output);

     -- generic_dei[uxn_device_h_l490_c12_1277] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l490_c12_1277_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l490_c12_1277_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l490_c12_1277_device_address <= VAR_generic_dei_uxn_device_h_l490_c12_1277_device_address;
     generic_dei_uxn_device_h_l490_c12_1277_phase <= VAR_generic_dei_uxn_device_h_l490_c12_1277_phase;
     generic_dei_uxn_device_h_l490_c12_1277_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l490_c12_1277_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l490_c12_1277_return_output := generic_dei_uxn_device_h_l490_c12_1277_return_output;

     -- Submodule level 4
     VAR_result_MUX_uxn_device_h_l476_c2_9cb4_iffalse := VAR_generic_dei_uxn_device_h_l490_c12_1277_return_output;
     -- uint8_uint1_3[uxn_device_h_l480_c16_3f00] LATENCY=0
     VAR_uint8_uint1_3_uxn_device_h_l480_c16_3f00_return_output := uint8_uint1_3(
     VAR_uint8_uint1_2_uxn_device_h_l479_c16_5e55_return_output,
     VAR_uint8_7_7_uxn_device_h_l480_c42_ab44_return_output);

     -- Submodule level 5
     -- uint8_uint1_4[uxn_device_h_l481_c16_dbaf] LATENCY=0
     VAR_uint8_uint1_4_uxn_device_h_l481_c16_dbaf_return_output := uint8_uint1_4(
     VAR_uint8_uint1_3_uxn_device_h_l480_c16_3f00_return_output,
     VAR_uint8_0_0_uxn_device_h_l481_c42_1e57_return_output);

     -- Submodule level 6
     -- uint8_uint1_5[uxn_device_h_l482_c16_20bd] LATENCY=0
     VAR_uint8_uint1_5_uxn_device_h_l482_c16_20bd_return_output := uint8_uint1_5(
     VAR_uint8_uint1_4_uxn_device_h_l481_c16_dbaf_return_output,
     VAR_uint8_1_1_uxn_device_h_l482_c42_1aec_return_output);

     -- Submodule level 7
     -- uint8_uint1_6[uxn_device_h_l483_c16_72f6] LATENCY=0
     VAR_uint8_uint1_6_uxn_device_h_l483_c16_72f6_return_output := uint8_uint1_6(
     VAR_uint8_uint1_5_uxn_device_h_l482_c16_20bd_return_output,
     VAR_uint8_2_2_uxn_device_h_l483_c42_ba7b_return_output);

     -- Submodule level 8
     -- uint8_uint1_7[uxn_device_h_l484_c16_b1df] LATENCY=0
     VAR_uint8_uint1_7_uxn_device_h_l484_c16_b1df_return_output := uint8_uint1_7(
     VAR_uint8_uint1_6_uxn_device_h_l483_c16_72f6_return_output,
     VAR_uint8_3_3_uxn_device_h_l484_c42_1ced_return_output);

     -- Submodule level 9
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l476_c2_9cb4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l476_c2_9cb4_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l485_c3_a3a3,
     VAR_uint8_uint1_7_uxn_device_h_l484_c16_b1df_return_output,
     to_unsigned(1, 1));

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l476_c2_9cb4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l476_c2_9cb4_return_output;
     -- result_MUX[uxn_device_h_l476_c2_9cb4] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l476_c2_9cb4_cond <= VAR_result_MUX_uxn_device_h_l476_c2_9cb4_cond;
     result_MUX_uxn_device_h_l476_c2_9cb4_iftrue <= VAR_result_MUX_uxn_device_h_l476_c2_9cb4_iftrue;
     result_MUX_uxn_device_h_l476_c2_9cb4_iffalse <= VAR_result_MUX_uxn_device_h_l476_c2_9cb4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l476_c2_9cb4_return_output := result_MUX_uxn_device_h_l476_c2_9cb4_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l476_c2_9cb4_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l476_c2_9cb4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_port <= REG_VAR_device_port;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     device_port <= REG_COMB_device_port;
 end if;
 end if;
end process;

end arch;
