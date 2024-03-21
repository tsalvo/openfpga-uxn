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
-- Submodules: 46
entity datetime_dei_0CLK_24541ec2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end datetime_dei_0CLK_24541ec2;
architecture arch of datetime_dei_0CLK_24541ec2 is
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
-- BIN_OP_EQ[uxn_device_h_l540_c6_e2c5]
signal BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l545_c7_cf74]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l540_c2_c642]
signal result_MUX_uxn_device_h_l540_c2_c642_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l540_c2_c642_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l540_c2_c642_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l540_c2_c642_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l545_c11_e155]
signal BIN_OP_EQ_uxn_device_h_l545_c11_e155_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l545_c11_e155_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l545_c11_e155_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l550_c7_9e20]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l545_c7_cf74]
signal result_MUX_uxn_device_h_l545_c7_cf74_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l545_c7_cf74_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l545_c7_cf74_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l545_c7_cf74_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l550_c11_34a4]
signal BIN_OP_EQ_uxn_device_h_l550_c11_34a4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l550_c11_34a4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l550_c11_34a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l555_c7_abd8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l550_c7_9e20]
signal result_MUX_uxn_device_h_l550_c7_9e20_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l550_c7_9e20_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l550_c7_9e20_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l550_c7_9e20_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l555_c11_2145]
signal BIN_OP_EQ_uxn_device_h_l555_c11_2145_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l555_c11_2145_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l555_c11_2145_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l560_c7_6635]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l555_c7_abd8]
signal result_MUX_uxn_device_h_l555_c7_abd8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l555_c7_abd8_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l555_c7_abd8_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l555_c7_abd8_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l560_c11_2d83]
signal BIN_OP_EQ_uxn_device_h_l560_c11_2d83_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l560_c11_2d83_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l560_c11_2d83_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l565_c7_d205]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l560_c7_6635]
signal result_MUX_uxn_device_h_l560_c7_6635_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l560_c7_6635_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l560_c7_6635_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l560_c7_6635_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l565_c11_a7a9]
signal BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l570_c7_752d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l565_c7_d205]
signal result_MUX_uxn_device_h_l565_c7_d205_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l565_c7_d205_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l565_c7_d205_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l565_c7_d205_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l570_c11_5dae]
signal BIN_OP_EQ_uxn_device_h_l570_c11_5dae_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l570_c11_5dae_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l570_c11_5dae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l575_c7_dd61]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l570_c7_752d]
signal result_MUX_uxn_device_h_l570_c7_752d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l570_c7_752d_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l570_c7_752d_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l570_c7_752d_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l575_c11_de3c]
signal BIN_OP_EQ_uxn_device_h_l575_c11_de3c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l575_c11_de3c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l575_c11_de3c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l580_c7_8df3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l575_c7_dd61]
signal result_MUX_uxn_device_h_l575_c7_dd61_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l575_c7_dd61_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l575_c7_dd61_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l575_c7_dd61_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l580_c11_a710]
signal BIN_OP_EQ_uxn_device_h_l580_c11_a710_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l580_c11_a710_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l580_c11_a710_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l585_c7_82e9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l580_c7_8df3]
signal result_MUX_uxn_device_h_l580_c7_8df3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l580_c7_8df3_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l580_c7_8df3_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l580_c7_8df3_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l585_c11_279c]
signal BIN_OP_EQ_uxn_device_h_l585_c11_279c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l585_c11_279c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l585_c11_279c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l590_c7_8771]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l585_c7_82e9]
signal result_MUX_uxn_device_h_l585_c7_82e9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l585_c7_82e9_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l585_c7_82e9_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l585_c7_82e9_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l590_c11_648b]
signal BIN_OP_EQ_uxn_device_h_l590_c11_648b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l590_c11_648b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l590_c11_648b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l595_c1_0455]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l590_c7_8771]
signal result_MUX_uxn_device_h_l590_c7_8771_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l590_c7_8771_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l590_c7_8771_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l590_c7_8771_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l596_c12_77be]
signal generic_dei_uxn_device_h_l596_c12_77be_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l596_c12_77be_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l596_c12_77be_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l596_c12_77be_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l596_c12_77be_return_output : device_in_result_t;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
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
-- BIN_OP_EQ_uxn_device_h_l540_c6_e2c5
BIN_OP_EQ_uxn_device_h_l540_c6_e2c5 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_left,
BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_right,
BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_return_output);

-- result_MUX_uxn_device_h_l540_c2_c642
result_MUX_uxn_device_h_l540_c2_c642 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l540_c2_c642_cond,
result_MUX_uxn_device_h_l540_c2_c642_iftrue,
result_MUX_uxn_device_h_l540_c2_c642_iffalse,
result_MUX_uxn_device_h_l540_c2_c642_return_output);

-- BIN_OP_EQ_uxn_device_h_l545_c11_e155
BIN_OP_EQ_uxn_device_h_l545_c11_e155 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l545_c11_e155_left,
BIN_OP_EQ_uxn_device_h_l545_c11_e155_right,
BIN_OP_EQ_uxn_device_h_l545_c11_e155_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_return_output);

-- result_MUX_uxn_device_h_l545_c7_cf74
result_MUX_uxn_device_h_l545_c7_cf74 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l545_c7_cf74_cond,
result_MUX_uxn_device_h_l545_c7_cf74_iftrue,
result_MUX_uxn_device_h_l545_c7_cf74_iffalse,
result_MUX_uxn_device_h_l545_c7_cf74_return_output);

-- BIN_OP_EQ_uxn_device_h_l550_c11_34a4
BIN_OP_EQ_uxn_device_h_l550_c11_34a4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l550_c11_34a4_left,
BIN_OP_EQ_uxn_device_h_l550_c11_34a4_right,
BIN_OP_EQ_uxn_device_h_l550_c11_34a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_return_output);

-- result_MUX_uxn_device_h_l550_c7_9e20
result_MUX_uxn_device_h_l550_c7_9e20 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l550_c7_9e20_cond,
result_MUX_uxn_device_h_l550_c7_9e20_iftrue,
result_MUX_uxn_device_h_l550_c7_9e20_iffalse,
result_MUX_uxn_device_h_l550_c7_9e20_return_output);

-- BIN_OP_EQ_uxn_device_h_l555_c11_2145
BIN_OP_EQ_uxn_device_h_l555_c11_2145 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l555_c11_2145_left,
BIN_OP_EQ_uxn_device_h_l555_c11_2145_right,
BIN_OP_EQ_uxn_device_h_l555_c11_2145_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_return_output);

-- result_MUX_uxn_device_h_l555_c7_abd8
result_MUX_uxn_device_h_l555_c7_abd8 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l555_c7_abd8_cond,
result_MUX_uxn_device_h_l555_c7_abd8_iftrue,
result_MUX_uxn_device_h_l555_c7_abd8_iffalse,
result_MUX_uxn_device_h_l555_c7_abd8_return_output);

-- BIN_OP_EQ_uxn_device_h_l560_c11_2d83
BIN_OP_EQ_uxn_device_h_l560_c11_2d83 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l560_c11_2d83_left,
BIN_OP_EQ_uxn_device_h_l560_c11_2d83_right,
BIN_OP_EQ_uxn_device_h_l560_c11_2d83_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_return_output);

-- result_MUX_uxn_device_h_l560_c7_6635
result_MUX_uxn_device_h_l560_c7_6635 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l560_c7_6635_cond,
result_MUX_uxn_device_h_l560_c7_6635_iftrue,
result_MUX_uxn_device_h_l560_c7_6635_iffalse,
result_MUX_uxn_device_h_l560_c7_6635_return_output);

-- BIN_OP_EQ_uxn_device_h_l565_c11_a7a9
BIN_OP_EQ_uxn_device_h_l565_c11_a7a9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_left,
BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_right,
BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_return_output);

-- result_MUX_uxn_device_h_l565_c7_d205
result_MUX_uxn_device_h_l565_c7_d205 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l565_c7_d205_cond,
result_MUX_uxn_device_h_l565_c7_d205_iftrue,
result_MUX_uxn_device_h_l565_c7_d205_iffalse,
result_MUX_uxn_device_h_l565_c7_d205_return_output);

-- BIN_OP_EQ_uxn_device_h_l570_c11_5dae
BIN_OP_EQ_uxn_device_h_l570_c11_5dae : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l570_c11_5dae_left,
BIN_OP_EQ_uxn_device_h_l570_c11_5dae_right,
BIN_OP_EQ_uxn_device_h_l570_c11_5dae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_return_output);

-- result_MUX_uxn_device_h_l570_c7_752d
result_MUX_uxn_device_h_l570_c7_752d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l570_c7_752d_cond,
result_MUX_uxn_device_h_l570_c7_752d_iftrue,
result_MUX_uxn_device_h_l570_c7_752d_iffalse,
result_MUX_uxn_device_h_l570_c7_752d_return_output);

-- BIN_OP_EQ_uxn_device_h_l575_c11_de3c
BIN_OP_EQ_uxn_device_h_l575_c11_de3c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l575_c11_de3c_left,
BIN_OP_EQ_uxn_device_h_l575_c11_de3c_right,
BIN_OP_EQ_uxn_device_h_l575_c11_de3c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_return_output);

-- result_MUX_uxn_device_h_l575_c7_dd61
result_MUX_uxn_device_h_l575_c7_dd61 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l575_c7_dd61_cond,
result_MUX_uxn_device_h_l575_c7_dd61_iftrue,
result_MUX_uxn_device_h_l575_c7_dd61_iffalse,
result_MUX_uxn_device_h_l575_c7_dd61_return_output);

-- BIN_OP_EQ_uxn_device_h_l580_c11_a710
BIN_OP_EQ_uxn_device_h_l580_c11_a710 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l580_c11_a710_left,
BIN_OP_EQ_uxn_device_h_l580_c11_a710_right,
BIN_OP_EQ_uxn_device_h_l580_c11_a710_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_return_output);

-- result_MUX_uxn_device_h_l580_c7_8df3
result_MUX_uxn_device_h_l580_c7_8df3 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l580_c7_8df3_cond,
result_MUX_uxn_device_h_l580_c7_8df3_iftrue,
result_MUX_uxn_device_h_l580_c7_8df3_iffalse,
result_MUX_uxn_device_h_l580_c7_8df3_return_output);

-- BIN_OP_EQ_uxn_device_h_l585_c11_279c
BIN_OP_EQ_uxn_device_h_l585_c11_279c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l585_c11_279c_left,
BIN_OP_EQ_uxn_device_h_l585_c11_279c_right,
BIN_OP_EQ_uxn_device_h_l585_c11_279c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_return_output);

-- result_MUX_uxn_device_h_l585_c7_82e9
result_MUX_uxn_device_h_l585_c7_82e9 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l585_c7_82e9_cond,
result_MUX_uxn_device_h_l585_c7_82e9_iftrue,
result_MUX_uxn_device_h_l585_c7_82e9_iffalse,
result_MUX_uxn_device_h_l585_c7_82e9_return_output);

-- BIN_OP_EQ_uxn_device_h_l590_c11_648b
BIN_OP_EQ_uxn_device_h_l590_c11_648b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l590_c11_648b_left,
BIN_OP_EQ_uxn_device_h_l590_c11_648b_right,
BIN_OP_EQ_uxn_device_h_l590_c11_648b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_return_output);

-- result_MUX_uxn_device_h_l590_c7_8771
result_MUX_uxn_device_h_l590_c7_8771 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l590_c7_8771_cond,
result_MUX_uxn_device_h_l590_c7_8771_iftrue,
result_MUX_uxn_device_h_l590_c7_8771_iffalse,
result_MUX_uxn_device_h_l590_c7_8771_return_output);

-- generic_dei_uxn_device_h_l596_c12_77be
generic_dei_uxn_device_h_l596_c12_77be : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l596_c12_77be_CLOCK_ENABLE,
generic_dei_uxn_device_h_l596_c12_77be_device_address,
generic_dei_uxn_device_h_l596_c12_77be_phase,
generic_dei_uxn_device_h_l596_c12_77be_previous_device_ram_read,
generic_dei_uxn_device_h_l596_c12_77be_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 result,
 device_port,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_return_output,
 result_MUX_uxn_device_h_l540_c2_c642_return_output,
 BIN_OP_EQ_uxn_device_h_l545_c11_e155_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_return_output,
 result_MUX_uxn_device_h_l545_c7_cf74_return_output,
 BIN_OP_EQ_uxn_device_h_l550_c11_34a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_return_output,
 result_MUX_uxn_device_h_l550_c7_9e20_return_output,
 BIN_OP_EQ_uxn_device_h_l555_c11_2145_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_return_output,
 result_MUX_uxn_device_h_l555_c7_abd8_return_output,
 BIN_OP_EQ_uxn_device_h_l560_c11_2d83_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_return_output,
 result_MUX_uxn_device_h_l560_c7_6635_return_output,
 BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_return_output,
 result_MUX_uxn_device_h_l565_c7_d205_return_output,
 BIN_OP_EQ_uxn_device_h_l570_c11_5dae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_return_output,
 result_MUX_uxn_device_h_l570_c7_752d_return_output,
 BIN_OP_EQ_uxn_device_h_l575_c11_de3c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_return_output,
 result_MUX_uxn_device_h_l575_c7_dd61_return_output,
 BIN_OP_EQ_uxn_device_h_l580_c11_a710_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_return_output,
 result_MUX_uxn_device_h_l580_c7_8df3_return_output,
 BIN_OP_EQ_uxn_device_h_l585_c11_279c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_return_output,
 result_MUX_uxn_device_h_l585_c7_82e9_return_output,
 BIN_OP_EQ_uxn_device_h_l590_c11_648b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_return_output,
 result_MUX_uxn_device_h_l590_c7_8771_return_output,
 generic_dei_uxn_device_h_l596_c12_77be_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l540_c2_c642_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l540_c2_c642_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l540_c2_c642_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l545_c7_cf74_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l540_c2_c642_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l540_c2_c642_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l541_c3_40be : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l545_c11_e155_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l545_c11_e155_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l545_c11_e155_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l545_c7_cf74_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l545_c7_cf74_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l545_c7_cf74_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l550_c7_9e20_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l545_c7_cf74_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l546_c3_6635 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l550_c11_34a4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l550_c11_34a4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l550_c11_34a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l550_c7_9e20_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l550_c7_9e20_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l550_c7_9e20_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l555_c7_abd8_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l550_c7_9e20_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l551_c3_867e : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l555_c11_2145_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l555_c11_2145_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l555_c11_2145_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l555_c7_abd8_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l555_c7_abd8_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l555_c7_abd8_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l560_c7_6635_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l555_c7_abd8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l556_c3_7745 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l560_c11_2d83_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l560_c11_2d83_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l560_c11_2d83_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l560_c7_6635_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l560_c7_6635_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l560_c7_6635_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l565_c7_d205_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l560_c7_6635_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l561_c3_32f5 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l565_c7_d205_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l565_c7_d205_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l565_c7_d205_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l570_c7_752d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l565_c7_d205_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l566_c3_c78b : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l570_c11_5dae_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l570_c11_5dae_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l570_c11_5dae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l570_c7_752d_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l570_c7_752d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l570_c7_752d_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l575_c7_dd61_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l570_c7_752d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l571_c3_83f0 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l575_c11_de3c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l575_c11_de3c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l575_c11_de3c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l575_c7_dd61_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l575_c7_dd61_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l575_c7_dd61_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l580_c7_8df3_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l575_c7_dd61_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l576_c3_6649 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l580_c11_a710_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l580_c11_a710_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l580_c11_a710_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l580_c7_8df3_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l580_c7_8df3_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l580_c7_8df3_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l585_c7_82e9_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l580_c7_8df3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l581_c3_4dd8 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l585_c11_279c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l585_c11_279c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l585_c11_279c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l585_c7_82e9_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l585_c7_82e9_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l585_c7_82e9_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l590_c7_8771_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l585_c7_82e9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l586_c3_f6a9 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l590_c11_648b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l590_c11_648b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l590_c11_648b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l590_c7_8771_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l590_c7_8771_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l590_c7_8771_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l590_c7_8771_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l591_c3_9696 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l596_c12_77be_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l596_c12_77be_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l596_c12_77be_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l596_c12_77be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l596_c12_77be_return_output : device_in_result_t;
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
     VAR_result_device_ram_address_uxn_device_h_l546_c3_6635 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l581_c3_4dd8 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l550_c11_34a4_right := to_unsigned(2, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l555_c11_2145_right := to_unsigned(3, 4);
     VAR_result_device_ram_address_uxn_device_h_l566_c3_c78b := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l591_c3_9696 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l556_c3_7745 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l575_c11_de3c_right := to_unsigned(7, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l560_c11_2d83_right := to_unsigned(4, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l590_c11_648b_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l580_c11_a710_right := to_unsigned(8, 4);
     VAR_result_device_ram_address_uxn_device_h_l571_c3_83f0 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l585_c11_279c_right := to_unsigned(9, 4);
     VAR_result_device_ram_address_uxn_device_h_l561_c3_32f5 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l586_c3_f6a9 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l576_c3_6649 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l570_c11_5dae_right := to_unsigned(6, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l551_c3_867e := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_right := to_unsigned(0, 4);
     VAR_result_device_ram_address_uxn_device_h_l541_c3_40be := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_right := to_unsigned(5, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l545_c11_e155_right := to_unsigned(1, 4);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l570_c7_752d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l570_c7_752d_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l571_c3_83f0,
     to_unsigned(4, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l550_c7_9e20] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l550_c7_9e20_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l551_c3_867e,
     to_unsigned(11, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l540_c2_c642] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l540_c2_c642_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l541_c3_40be,
     to_unsigned(7, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l590_c7_8771] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l590_c7_8771_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l591_c3_9696,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l580_c7_8df3] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l580_c7_8df3_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l581_c3_4dd8,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l560_c7_6635] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l560_c7_6635_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l561_c3_32f5,
     to_unsigned(6, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l575_c7_dd61] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l575_c7_dd61_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l576_c3_6649,
     to_unsigned(5, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l585_c7_82e9] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l585_c7_82e9_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l586_c3_f6a9,
     to_unsigned(108, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l555_c7_abd8] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l555_c7_abd8_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l556_c3_7745,
     to_unsigned(30, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l565_c7_d205] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l565_c7_d205_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l566_c3_c78b,
     to_unsigned(51, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l545_c7_cf74] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l545_c7_cf74_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l546_c3_6635,
     to_unsigned(190, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l550_c7_9e20_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l550_c7_9e20_return_output;
     VAR_result_MUX_uxn_device_h_l545_c7_cf74_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l545_c7_cf74_return_output;
     VAR_result_MUX_uxn_device_h_l555_c7_abd8_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l555_c7_abd8_return_output;
     VAR_result_MUX_uxn_device_h_l580_c7_8df3_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l580_c7_8df3_return_output;
     VAR_result_MUX_uxn_device_h_l565_c7_d205_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l565_c7_d205_return_output;
     VAR_result_MUX_uxn_device_h_l590_c7_8771_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l590_c7_8771_return_output;
     VAR_result_MUX_uxn_device_h_l560_c7_6635_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l560_c7_6635_return_output;
     VAR_result_MUX_uxn_device_h_l575_c7_dd61_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l575_c7_dd61_return_output;
     VAR_result_MUX_uxn_device_h_l585_c7_82e9_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l585_c7_82e9_return_output;
     VAR_result_MUX_uxn_device_h_l570_c7_752d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l570_c7_752d_return_output;
     VAR_result_MUX_uxn_device_h_l540_c2_c642_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l540_c2_c642_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l596_c12_77be_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l596_c12_77be_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l596_c12_77be_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l537_c16_95bb] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l545_c11_e155_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l550_c11_34a4_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l555_c11_2145_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l560_c11_2d83_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l570_c11_5dae_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l575_c11_de3c_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l580_c11_a710_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l585_c11_279c_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l590_c11_648b_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_95bb_return_output;
     -- BIN_OP_EQ[uxn_device_h_l540_c6_e2c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_left <= VAR_BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_left;
     BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_right <= VAR_BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_return_output := BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l575_c11_de3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l575_c11_de3c_left <= VAR_BIN_OP_EQ_uxn_device_h_l575_c11_de3c_left;
     BIN_OP_EQ_uxn_device_h_l575_c11_de3c_right <= VAR_BIN_OP_EQ_uxn_device_h_l575_c11_de3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l575_c11_de3c_return_output := BIN_OP_EQ_uxn_device_h_l575_c11_de3c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l550_c11_34a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l550_c11_34a4_left <= VAR_BIN_OP_EQ_uxn_device_h_l550_c11_34a4_left;
     BIN_OP_EQ_uxn_device_h_l550_c11_34a4_right <= VAR_BIN_OP_EQ_uxn_device_h_l550_c11_34a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l550_c11_34a4_return_output := BIN_OP_EQ_uxn_device_h_l550_c11_34a4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l585_c11_279c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l585_c11_279c_left <= VAR_BIN_OP_EQ_uxn_device_h_l585_c11_279c_left;
     BIN_OP_EQ_uxn_device_h_l585_c11_279c_right <= VAR_BIN_OP_EQ_uxn_device_h_l585_c11_279c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l585_c11_279c_return_output := BIN_OP_EQ_uxn_device_h_l585_c11_279c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l580_c11_a710] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l580_c11_a710_left <= VAR_BIN_OP_EQ_uxn_device_h_l580_c11_a710_left;
     BIN_OP_EQ_uxn_device_h_l580_c11_a710_right <= VAR_BIN_OP_EQ_uxn_device_h_l580_c11_a710_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l580_c11_a710_return_output := BIN_OP_EQ_uxn_device_h_l580_c11_a710_return_output;

     -- BIN_OP_EQ[uxn_device_h_l560_c11_2d83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l560_c11_2d83_left <= VAR_BIN_OP_EQ_uxn_device_h_l560_c11_2d83_left;
     BIN_OP_EQ_uxn_device_h_l560_c11_2d83_right <= VAR_BIN_OP_EQ_uxn_device_h_l560_c11_2d83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l560_c11_2d83_return_output := BIN_OP_EQ_uxn_device_h_l560_c11_2d83_return_output;

     -- BIN_OP_EQ[uxn_device_h_l590_c11_648b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l590_c11_648b_left <= VAR_BIN_OP_EQ_uxn_device_h_l590_c11_648b_left;
     BIN_OP_EQ_uxn_device_h_l590_c11_648b_right <= VAR_BIN_OP_EQ_uxn_device_h_l590_c11_648b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l590_c11_648b_return_output := BIN_OP_EQ_uxn_device_h_l590_c11_648b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l570_c11_5dae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l570_c11_5dae_left <= VAR_BIN_OP_EQ_uxn_device_h_l570_c11_5dae_left;
     BIN_OP_EQ_uxn_device_h_l570_c11_5dae_right <= VAR_BIN_OP_EQ_uxn_device_h_l570_c11_5dae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l570_c11_5dae_return_output := BIN_OP_EQ_uxn_device_h_l570_c11_5dae_return_output;

     -- BIN_OP_EQ[uxn_device_h_l555_c11_2145] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l555_c11_2145_left <= VAR_BIN_OP_EQ_uxn_device_h_l555_c11_2145_left;
     BIN_OP_EQ_uxn_device_h_l555_c11_2145_right <= VAR_BIN_OP_EQ_uxn_device_h_l555_c11_2145_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l555_c11_2145_return_output := BIN_OP_EQ_uxn_device_h_l555_c11_2145_return_output;

     -- BIN_OP_EQ[uxn_device_h_l545_c11_e155] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l545_c11_e155_left <= VAR_BIN_OP_EQ_uxn_device_h_l545_c11_e155_left;
     BIN_OP_EQ_uxn_device_h_l545_c11_e155_right <= VAR_BIN_OP_EQ_uxn_device_h_l545_c11_e155_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l545_c11_e155_return_output := BIN_OP_EQ_uxn_device_h_l545_c11_e155_return_output;

     -- BIN_OP_EQ[uxn_device_h_l565_c11_a7a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_left <= VAR_BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_left;
     BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_right <= VAR_BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_return_output := BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_cond := VAR_BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_return_output;
     VAR_result_MUX_uxn_device_h_l540_c2_c642_cond := VAR_BIN_OP_EQ_uxn_device_h_l540_c6_e2c5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_cond := VAR_BIN_OP_EQ_uxn_device_h_l545_c11_e155_return_output;
     VAR_result_MUX_uxn_device_h_l545_c7_cf74_cond := VAR_BIN_OP_EQ_uxn_device_h_l545_c11_e155_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l550_c11_34a4_return_output;
     VAR_result_MUX_uxn_device_h_l550_c7_9e20_cond := VAR_BIN_OP_EQ_uxn_device_h_l550_c11_34a4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_cond := VAR_BIN_OP_EQ_uxn_device_h_l555_c11_2145_return_output;
     VAR_result_MUX_uxn_device_h_l555_c7_abd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l555_c11_2145_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_cond := VAR_BIN_OP_EQ_uxn_device_h_l560_c11_2d83_return_output;
     VAR_result_MUX_uxn_device_h_l560_c7_6635_cond := VAR_BIN_OP_EQ_uxn_device_h_l560_c11_2d83_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_cond := VAR_BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_return_output;
     VAR_result_MUX_uxn_device_h_l565_c7_d205_cond := VAR_BIN_OP_EQ_uxn_device_h_l565_c11_a7a9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_cond := VAR_BIN_OP_EQ_uxn_device_h_l570_c11_5dae_return_output;
     VAR_result_MUX_uxn_device_h_l570_c7_752d_cond := VAR_BIN_OP_EQ_uxn_device_h_l570_c11_5dae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_cond := VAR_BIN_OP_EQ_uxn_device_h_l575_c11_de3c_return_output;
     VAR_result_MUX_uxn_device_h_l575_c7_dd61_cond := VAR_BIN_OP_EQ_uxn_device_h_l575_c11_de3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l580_c11_a710_return_output;
     VAR_result_MUX_uxn_device_h_l580_c7_8df3_cond := VAR_BIN_OP_EQ_uxn_device_h_l580_c11_a710_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_cond := VAR_BIN_OP_EQ_uxn_device_h_l585_c11_279c_return_output;
     VAR_result_MUX_uxn_device_h_l585_c7_82e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l585_c11_279c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_cond := VAR_BIN_OP_EQ_uxn_device_h_l590_c11_648b_return_output;
     VAR_result_MUX_uxn_device_h_l590_c7_8771_cond := VAR_BIN_OP_EQ_uxn_device_h_l590_c11_648b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l545_c7_cf74] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cf74_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l550_c7_9e20] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_9e20_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l555_c7_abd8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_abd8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l560_c7_6635] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_6635_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l565_c7_d205] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_d205_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l570_c7_752d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_752d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l575_c7_dd61] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_dd61_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l580_c7_8df3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_8df3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l585_c7_82e9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_82e9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l590_c7_8771] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_8771_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l595_c1_0455] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_return_output;

     -- Submodule level 13
     VAR_generic_dei_uxn_device_h_l596_c12_77be_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_0455_return_output;
     -- generic_dei[uxn_device_h_l596_c12_77be] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l596_c12_77be_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l596_c12_77be_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l596_c12_77be_device_address <= VAR_generic_dei_uxn_device_h_l596_c12_77be_device_address;
     generic_dei_uxn_device_h_l596_c12_77be_phase <= VAR_generic_dei_uxn_device_h_l596_c12_77be_phase;
     generic_dei_uxn_device_h_l596_c12_77be_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l596_c12_77be_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l596_c12_77be_return_output := generic_dei_uxn_device_h_l596_c12_77be_return_output;

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l590_c7_8771_iffalse := VAR_generic_dei_uxn_device_h_l596_c12_77be_return_output;
     -- result_MUX[uxn_device_h_l590_c7_8771] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l590_c7_8771_cond <= VAR_result_MUX_uxn_device_h_l590_c7_8771_cond;
     result_MUX_uxn_device_h_l590_c7_8771_iftrue <= VAR_result_MUX_uxn_device_h_l590_c7_8771_iftrue;
     result_MUX_uxn_device_h_l590_c7_8771_iffalse <= VAR_result_MUX_uxn_device_h_l590_c7_8771_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l590_c7_8771_return_output := result_MUX_uxn_device_h_l590_c7_8771_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l585_c7_82e9_iffalse := VAR_result_MUX_uxn_device_h_l590_c7_8771_return_output;
     -- result_MUX[uxn_device_h_l585_c7_82e9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l585_c7_82e9_cond <= VAR_result_MUX_uxn_device_h_l585_c7_82e9_cond;
     result_MUX_uxn_device_h_l585_c7_82e9_iftrue <= VAR_result_MUX_uxn_device_h_l585_c7_82e9_iftrue;
     result_MUX_uxn_device_h_l585_c7_82e9_iffalse <= VAR_result_MUX_uxn_device_h_l585_c7_82e9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l585_c7_82e9_return_output := result_MUX_uxn_device_h_l585_c7_82e9_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l580_c7_8df3_iffalse := VAR_result_MUX_uxn_device_h_l585_c7_82e9_return_output;
     -- result_MUX[uxn_device_h_l580_c7_8df3] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l580_c7_8df3_cond <= VAR_result_MUX_uxn_device_h_l580_c7_8df3_cond;
     result_MUX_uxn_device_h_l580_c7_8df3_iftrue <= VAR_result_MUX_uxn_device_h_l580_c7_8df3_iftrue;
     result_MUX_uxn_device_h_l580_c7_8df3_iffalse <= VAR_result_MUX_uxn_device_h_l580_c7_8df3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l580_c7_8df3_return_output := result_MUX_uxn_device_h_l580_c7_8df3_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l575_c7_dd61_iffalse := VAR_result_MUX_uxn_device_h_l580_c7_8df3_return_output;
     -- result_MUX[uxn_device_h_l575_c7_dd61] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l575_c7_dd61_cond <= VAR_result_MUX_uxn_device_h_l575_c7_dd61_cond;
     result_MUX_uxn_device_h_l575_c7_dd61_iftrue <= VAR_result_MUX_uxn_device_h_l575_c7_dd61_iftrue;
     result_MUX_uxn_device_h_l575_c7_dd61_iffalse <= VAR_result_MUX_uxn_device_h_l575_c7_dd61_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l575_c7_dd61_return_output := result_MUX_uxn_device_h_l575_c7_dd61_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l570_c7_752d_iffalse := VAR_result_MUX_uxn_device_h_l575_c7_dd61_return_output;
     -- result_MUX[uxn_device_h_l570_c7_752d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l570_c7_752d_cond <= VAR_result_MUX_uxn_device_h_l570_c7_752d_cond;
     result_MUX_uxn_device_h_l570_c7_752d_iftrue <= VAR_result_MUX_uxn_device_h_l570_c7_752d_iftrue;
     result_MUX_uxn_device_h_l570_c7_752d_iffalse <= VAR_result_MUX_uxn_device_h_l570_c7_752d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l570_c7_752d_return_output := result_MUX_uxn_device_h_l570_c7_752d_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l565_c7_d205_iffalse := VAR_result_MUX_uxn_device_h_l570_c7_752d_return_output;
     -- result_MUX[uxn_device_h_l565_c7_d205] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l565_c7_d205_cond <= VAR_result_MUX_uxn_device_h_l565_c7_d205_cond;
     result_MUX_uxn_device_h_l565_c7_d205_iftrue <= VAR_result_MUX_uxn_device_h_l565_c7_d205_iftrue;
     result_MUX_uxn_device_h_l565_c7_d205_iffalse <= VAR_result_MUX_uxn_device_h_l565_c7_d205_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l565_c7_d205_return_output := result_MUX_uxn_device_h_l565_c7_d205_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l560_c7_6635_iffalse := VAR_result_MUX_uxn_device_h_l565_c7_d205_return_output;
     -- result_MUX[uxn_device_h_l560_c7_6635] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l560_c7_6635_cond <= VAR_result_MUX_uxn_device_h_l560_c7_6635_cond;
     result_MUX_uxn_device_h_l560_c7_6635_iftrue <= VAR_result_MUX_uxn_device_h_l560_c7_6635_iftrue;
     result_MUX_uxn_device_h_l560_c7_6635_iffalse <= VAR_result_MUX_uxn_device_h_l560_c7_6635_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l560_c7_6635_return_output := result_MUX_uxn_device_h_l560_c7_6635_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l555_c7_abd8_iffalse := VAR_result_MUX_uxn_device_h_l560_c7_6635_return_output;
     -- result_MUX[uxn_device_h_l555_c7_abd8] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l555_c7_abd8_cond <= VAR_result_MUX_uxn_device_h_l555_c7_abd8_cond;
     result_MUX_uxn_device_h_l555_c7_abd8_iftrue <= VAR_result_MUX_uxn_device_h_l555_c7_abd8_iftrue;
     result_MUX_uxn_device_h_l555_c7_abd8_iffalse <= VAR_result_MUX_uxn_device_h_l555_c7_abd8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l555_c7_abd8_return_output := result_MUX_uxn_device_h_l555_c7_abd8_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l550_c7_9e20_iffalse := VAR_result_MUX_uxn_device_h_l555_c7_abd8_return_output;
     -- result_MUX[uxn_device_h_l550_c7_9e20] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l550_c7_9e20_cond <= VAR_result_MUX_uxn_device_h_l550_c7_9e20_cond;
     result_MUX_uxn_device_h_l550_c7_9e20_iftrue <= VAR_result_MUX_uxn_device_h_l550_c7_9e20_iftrue;
     result_MUX_uxn_device_h_l550_c7_9e20_iffalse <= VAR_result_MUX_uxn_device_h_l550_c7_9e20_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l550_c7_9e20_return_output := result_MUX_uxn_device_h_l550_c7_9e20_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l545_c7_cf74_iffalse := VAR_result_MUX_uxn_device_h_l550_c7_9e20_return_output;
     -- result_MUX[uxn_device_h_l545_c7_cf74] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l545_c7_cf74_cond <= VAR_result_MUX_uxn_device_h_l545_c7_cf74_cond;
     result_MUX_uxn_device_h_l545_c7_cf74_iftrue <= VAR_result_MUX_uxn_device_h_l545_c7_cf74_iftrue;
     result_MUX_uxn_device_h_l545_c7_cf74_iffalse <= VAR_result_MUX_uxn_device_h_l545_c7_cf74_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l545_c7_cf74_return_output := result_MUX_uxn_device_h_l545_c7_cf74_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l540_c2_c642_iffalse := VAR_result_MUX_uxn_device_h_l545_c7_cf74_return_output;
     -- result_MUX[uxn_device_h_l540_c2_c642] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l540_c2_c642_cond <= VAR_result_MUX_uxn_device_h_l540_c2_c642_cond;
     result_MUX_uxn_device_h_l540_c2_c642_iftrue <= VAR_result_MUX_uxn_device_h_l540_c2_c642_iftrue;
     result_MUX_uxn_device_h_l540_c2_c642_iffalse <= VAR_result_MUX_uxn_device_h_l540_c2_c642_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l540_c2_c642_return_output := result_MUX_uxn_device_h_l540_c2_c642_return_output;

     -- Submodule level 25
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l540_c2_c642_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l540_c2_c642_return_output;
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
