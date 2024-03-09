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
-- BIN_OP_EQ[uxn_device_h_l551_c6_93ba]
signal BIN_OP_EQ_uxn_device_h_l551_c6_93ba_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l551_c6_93ba_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l551_c6_93ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l556_c7_17fa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l551_c2_784e]
signal result_MUX_uxn_device_h_l551_c2_784e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l551_c2_784e_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l551_c2_784e_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l551_c2_784e_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l556_c11_6431]
signal BIN_OP_EQ_uxn_device_h_l556_c11_6431_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l556_c11_6431_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l556_c11_6431_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l561_c7_667a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l556_c7_17fa]
signal result_MUX_uxn_device_h_l556_c7_17fa_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l556_c7_17fa_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l556_c7_17fa_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l556_c7_17fa_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l561_c11_1e61]
signal BIN_OP_EQ_uxn_device_h_l561_c11_1e61_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l561_c11_1e61_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l561_c11_1e61_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l566_c7_ca5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l561_c7_667a]
signal result_MUX_uxn_device_h_l561_c7_667a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l561_c7_667a_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l561_c7_667a_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l561_c7_667a_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l566_c11_16b4]
signal BIN_OP_EQ_uxn_device_h_l566_c11_16b4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l566_c11_16b4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l566_c11_16b4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l571_c7_7178]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l566_c7_ca5e]
signal result_MUX_uxn_device_h_l566_c7_ca5e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l566_c7_ca5e_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l566_c7_ca5e_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l566_c7_ca5e_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l571_c11_27a2]
signal BIN_OP_EQ_uxn_device_h_l571_c11_27a2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l571_c11_27a2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l571_c11_27a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l576_c7_34c0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l571_c7_7178]
signal result_MUX_uxn_device_h_l571_c7_7178_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l571_c7_7178_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l571_c7_7178_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l571_c7_7178_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l576_c11_c87b]
signal BIN_OP_EQ_uxn_device_h_l576_c11_c87b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l576_c11_c87b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l576_c11_c87b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l581_c7_a168]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l576_c7_34c0]
signal result_MUX_uxn_device_h_l576_c7_34c0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l576_c7_34c0_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l576_c7_34c0_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l576_c7_34c0_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l581_c11_0ecd]
signal BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l586_c7_7029]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l581_c7_a168]
signal result_MUX_uxn_device_h_l581_c7_a168_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l581_c7_a168_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l581_c7_a168_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l581_c7_a168_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l586_c11_20bd]
signal BIN_OP_EQ_uxn_device_h_l586_c11_20bd_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l586_c11_20bd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l586_c11_20bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l591_c7_fcac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l586_c7_7029]
signal result_MUX_uxn_device_h_l586_c7_7029_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l586_c7_7029_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l586_c7_7029_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l586_c7_7029_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l591_c11_65c5]
signal BIN_OP_EQ_uxn_device_h_l591_c11_65c5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l591_c11_65c5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l591_c11_65c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l596_c7_17b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l591_c7_fcac]
signal result_MUX_uxn_device_h_l591_c7_fcac_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l591_c7_fcac_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l591_c7_fcac_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l591_c7_fcac_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l596_c11_9b25]
signal BIN_OP_EQ_uxn_device_h_l596_c11_9b25_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l596_c11_9b25_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l596_c11_9b25_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l601_c7_95a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l596_c7_17b6]
signal result_MUX_uxn_device_h_l596_c7_17b6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l596_c7_17b6_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l596_c7_17b6_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l596_c7_17b6_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l601_c11_628a]
signal BIN_OP_EQ_uxn_device_h_l601_c11_628a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l601_c11_628a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l601_c11_628a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l606_c1_80a3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l601_c7_95a5]
signal result_MUX_uxn_device_h_l601_c7_95a5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l601_c7_95a5_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l601_c7_95a5_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l601_c7_95a5_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l607_c12_fc33]
signal generic_dei_uxn_device_h_l607_c12_fc33_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l607_c12_fc33_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l607_c12_fc33_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l607_c12_fc33_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l607_c12_fc33_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l551_c6_93ba
BIN_OP_EQ_uxn_device_h_l551_c6_93ba : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l551_c6_93ba_left,
BIN_OP_EQ_uxn_device_h_l551_c6_93ba_right,
BIN_OP_EQ_uxn_device_h_l551_c6_93ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_return_output);

-- result_MUX_uxn_device_h_l551_c2_784e
result_MUX_uxn_device_h_l551_c2_784e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l551_c2_784e_cond,
result_MUX_uxn_device_h_l551_c2_784e_iftrue,
result_MUX_uxn_device_h_l551_c2_784e_iffalse,
result_MUX_uxn_device_h_l551_c2_784e_return_output);

-- BIN_OP_EQ_uxn_device_h_l556_c11_6431
BIN_OP_EQ_uxn_device_h_l556_c11_6431 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l556_c11_6431_left,
BIN_OP_EQ_uxn_device_h_l556_c11_6431_right,
BIN_OP_EQ_uxn_device_h_l556_c11_6431_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_return_output);

-- result_MUX_uxn_device_h_l556_c7_17fa
result_MUX_uxn_device_h_l556_c7_17fa : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l556_c7_17fa_cond,
result_MUX_uxn_device_h_l556_c7_17fa_iftrue,
result_MUX_uxn_device_h_l556_c7_17fa_iffalse,
result_MUX_uxn_device_h_l556_c7_17fa_return_output);

-- BIN_OP_EQ_uxn_device_h_l561_c11_1e61
BIN_OP_EQ_uxn_device_h_l561_c11_1e61 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l561_c11_1e61_left,
BIN_OP_EQ_uxn_device_h_l561_c11_1e61_right,
BIN_OP_EQ_uxn_device_h_l561_c11_1e61_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_return_output);

-- result_MUX_uxn_device_h_l561_c7_667a
result_MUX_uxn_device_h_l561_c7_667a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l561_c7_667a_cond,
result_MUX_uxn_device_h_l561_c7_667a_iftrue,
result_MUX_uxn_device_h_l561_c7_667a_iffalse,
result_MUX_uxn_device_h_l561_c7_667a_return_output);

-- BIN_OP_EQ_uxn_device_h_l566_c11_16b4
BIN_OP_EQ_uxn_device_h_l566_c11_16b4 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l566_c11_16b4_left,
BIN_OP_EQ_uxn_device_h_l566_c11_16b4_right,
BIN_OP_EQ_uxn_device_h_l566_c11_16b4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_return_output);

-- result_MUX_uxn_device_h_l566_c7_ca5e
result_MUX_uxn_device_h_l566_c7_ca5e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l566_c7_ca5e_cond,
result_MUX_uxn_device_h_l566_c7_ca5e_iftrue,
result_MUX_uxn_device_h_l566_c7_ca5e_iffalse,
result_MUX_uxn_device_h_l566_c7_ca5e_return_output);

-- BIN_OP_EQ_uxn_device_h_l571_c11_27a2
BIN_OP_EQ_uxn_device_h_l571_c11_27a2 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l571_c11_27a2_left,
BIN_OP_EQ_uxn_device_h_l571_c11_27a2_right,
BIN_OP_EQ_uxn_device_h_l571_c11_27a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_return_output);

-- result_MUX_uxn_device_h_l571_c7_7178
result_MUX_uxn_device_h_l571_c7_7178 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l571_c7_7178_cond,
result_MUX_uxn_device_h_l571_c7_7178_iftrue,
result_MUX_uxn_device_h_l571_c7_7178_iffalse,
result_MUX_uxn_device_h_l571_c7_7178_return_output);

-- BIN_OP_EQ_uxn_device_h_l576_c11_c87b
BIN_OP_EQ_uxn_device_h_l576_c11_c87b : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l576_c11_c87b_left,
BIN_OP_EQ_uxn_device_h_l576_c11_c87b_right,
BIN_OP_EQ_uxn_device_h_l576_c11_c87b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_return_output);

-- result_MUX_uxn_device_h_l576_c7_34c0
result_MUX_uxn_device_h_l576_c7_34c0 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l576_c7_34c0_cond,
result_MUX_uxn_device_h_l576_c7_34c0_iftrue,
result_MUX_uxn_device_h_l576_c7_34c0_iffalse,
result_MUX_uxn_device_h_l576_c7_34c0_return_output);

-- BIN_OP_EQ_uxn_device_h_l581_c11_0ecd
BIN_OP_EQ_uxn_device_h_l581_c11_0ecd : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_left,
BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_right,
BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_return_output);

-- result_MUX_uxn_device_h_l581_c7_a168
result_MUX_uxn_device_h_l581_c7_a168 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l581_c7_a168_cond,
result_MUX_uxn_device_h_l581_c7_a168_iftrue,
result_MUX_uxn_device_h_l581_c7_a168_iffalse,
result_MUX_uxn_device_h_l581_c7_a168_return_output);

-- BIN_OP_EQ_uxn_device_h_l586_c11_20bd
BIN_OP_EQ_uxn_device_h_l586_c11_20bd : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l586_c11_20bd_left,
BIN_OP_EQ_uxn_device_h_l586_c11_20bd_right,
BIN_OP_EQ_uxn_device_h_l586_c11_20bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_return_output);

-- result_MUX_uxn_device_h_l586_c7_7029
result_MUX_uxn_device_h_l586_c7_7029 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l586_c7_7029_cond,
result_MUX_uxn_device_h_l586_c7_7029_iftrue,
result_MUX_uxn_device_h_l586_c7_7029_iffalse,
result_MUX_uxn_device_h_l586_c7_7029_return_output);

-- BIN_OP_EQ_uxn_device_h_l591_c11_65c5
BIN_OP_EQ_uxn_device_h_l591_c11_65c5 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l591_c11_65c5_left,
BIN_OP_EQ_uxn_device_h_l591_c11_65c5_right,
BIN_OP_EQ_uxn_device_h_l591_c11_65c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_return_output);

-- result_MUX_uxn_device_h_l591_c7_fcac
result_MUX_uxn_device_h_l591_c7_fcac : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l591_c7_fcac_cond,
result_MUX_uxn_device_h_l591_c7_fcac_iftrue,
result_MUX_uxn_device_h_l591_c7_fcac_iffalse,
result_MUX_uxn_device_h_l591_c7_fcac_return_output);

-- BIN_OP_EQ_uxn_device_h_l596_c11_9b25
BIN_OP_EQ_uxn_device_h_l596_c11_9b25 : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l596_c11_9b25_left,
BIN_OP_EQ_uxn_device_h_l596_c11_9b25_right,
BIN_OP_EQ_uxn_device_h_l596_c11_9b25_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_return_output);

-- result_MUX_uxn_device_h_l596_c7_17b6
result_MUX_uxn_device_h_l596_c7_17b6 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l596_c7_17b6_cond,
result_MUX_uxn_device_h_l596_c7_17b6_iftrue,
result_MUX_uxn_device_h_l596_c7_17b6_iffalse,
result_MUX_uxn_device_h_l596_c7_17b6_return_output);

-- BIN_OP_EQ_uxn_device_h_l601_c11_628a
BIN_OP_EQ_uxn_device_h_l601_c11_628a : entity work.BIN_OP_EQ_uint4_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l601_c11_628a_left,
BIN_OP_EQ_uxn_device_h_l601_c11_628a_right,
BIN_OP_EQ_uxn_device_h_l601_c11_628a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_return_output);

-- result_MUX_uxn_device_h_l601_c7_95a5
result_MUX_uxn_device_h_l601_c7_95a5 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l601_c7_95a5_cond,
result_MUX_uxn_device_h_l601_c7_95a5_iftrue,
result_MUX_uxn_device_h_l601_c7_95a5_iffalse,
result_MUX_uxn_device_h_l601_c7_95a5_return_output);

-- generic_dei_uxn_device_h_l607_c12_fc33
generic_dei_uxn_device_h_l607_c12_fc33 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l607_c12_fc33_CLOCK_ENABLE,
generic_dei_uxn_device_h_l607_c12_fc33_device_address,
generic_dei_uxn_device_h_l607_c12_fc33_phase,
generic_dei_uxn_device_h_l607_c12_fc33_previous_device_ram_read,
generic_dei_uxn_device_h_l607_c12_fc33_return_output);



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
 BIN_OP_EQ_uxn_device_h_l551_c6_93ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_return_output,
 result_MUX_uxn_device_h_l551_c2_784e_return_output,
 BIN_OP_EQ_uxn_device_h_l556_c11_6431_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_return_output,
 result_MUX_uxn_device_h_l556_c7_17fa_return_output,
 BIN_OP_EQ_uxn_device_h_l561_c11_1e61_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_return_output,
 result_MUX_uxn_device_h_l561_c7_667a_return_output,
 BIN_OP_EQ_uxn_device_h_l566_c11_16b4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_return_output,
 result_MUX_uxn_device_h_l566_c7_ca5e_return_output,
 BIN_OP_EQ_uxn_device_h_l571_c11_27a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_return_output,
 result_MUX_uxn_device_h_l571_c7_7178_return_output,
 BIN_OP_EQ_uxn_device_h_l576_c11_c87b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_return_output,
 result_MUX_uxn_device_h_l576_c7_34c0_return_output,
 BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_return_output,
 result_MUX_uxn_device_h_l581_c7_a168_return_output,
 BIN_OP_EQ_uxn_device_h_l586_c11_20bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_return_output,
 result_MUX_uxn_device_h_l586_c7_7029_return_output,
 BIN_OP_EQ_uxn_device_h_l591_c11_65c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_return_output,
 result_MUX_uxn_device_h_l591_c7_fcac_return_output,
 BIN_OP_EQ_uxn_device_h_l596_c11_9b25_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_return_output,
 result_MUX_uxn_device_h_l596_c7_17b6_return_output,
 BIN_OP_EQ_uxn_device_h_l601_c11_628a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_return_output,
 result_MUX_uxn_device_h_l601_c7_95a5_return_output,
 generic_dei_uxn_device_h_l607_c12_fc33_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l551_c6_93ba_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l551_c6_93ba_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l551_c6_93ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l551_c2_784e_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l551_c2_784e_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l551_c2_784e_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l556_c7_17fa_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l551_c2_784e_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l551_c2_784e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l552_c3_9e98 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l556_c11_6431_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l556_c11_6431_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l556_c11_6431_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l556_c7_17fa_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l556_c7_17fa_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l556_c7_17fa_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l561_c7_667a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l556_c7_17fa_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l557_c3_6457 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l561_c11_1e61_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l561_c11_1e61_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l561_c11_1e61_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l561_c7_667a_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l561_c7_667a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l561_c7_667a_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l566_c7_ca5e_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l561_c7_667a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l562_c3_4cec : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l566_c11_16b4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l566_c11_16b4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l566_c11_16b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l566_c7_ca5e_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l566_c7_ca5e_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l566_c7_ca5e_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l571_c7_7178_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l566_c7_ca5e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l567_c3_30b0 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l571_c11_27a2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l571_c11_27a2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l571_c11_27a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l571_c7_7178_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l571_c7_7178_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l571_c7_7178_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l576_c7_34c0_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l571_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l572_c3_49b7 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l576_c11_c87b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l576_c11_c87b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l576_c11_c87b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l576_c7_34c0_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l576_c7_34c0_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l576_c7_34c0_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l581_c7_a168_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l576_c7_34c0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l577_c3_5aa6 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l581_c7_a168_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l581_c7_a168_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l581_c7_a168_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l586_c7_7029_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l581_c7_a168_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l582_c3_5a0f : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l586_c11_20bd_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l586_c11_20bd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l586_c11_20bd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l586_c7_7029_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l586_c7_7029_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l586_c7_7029_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l591_c7_fcac_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l586_c7_7029_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l587_c3_497c : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l591_c11_65c5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l591_c11_65c5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l591_c11_65c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l591_c7_fcac_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l591_c7_fcac_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l591_c7_fcac_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l596_c7_17b6_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l591_c7_fcac_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l592_c3_dab5 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l596_c11_9b25_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l596_c11_9b25_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l596_c11_9b25_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l596_c7_17b6_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l596_c7_17b6_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l596_c7_17b6_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l601_c7_95a5_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l596_c7_17b6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l597_c3_5690 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l601_c11_628a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l601_c11_628a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l601_c11_628a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l601_c7_95a5_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l601_c7_95a5_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l601_c7_95a5_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l601_c7_95a5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l602_c3_98d1 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l607_c12_fc33_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l607_c12_fc33_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l607_c12_fc33_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l607_c12_fc33_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l607_c12_fc33_return_output : device_in_result_t;
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
     VAR_BIN_OP_EQ_uxn_device_h_l556_c11_6431_right := to_unsigned(1, 8);
     VAR_result_device_ram_address_uxn_device_h_l567_c3_30b0 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l571_c11_27a2_right := to_unsigned(4, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l591_c11_65c5_right := to_unsigned(8, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l551_c6_93ba_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l566_c11_16b4_right := to_unsigned(3, 8);
     VAR_result_device_ram_address_uxn_device_h_l562_c3_4cec := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l601_c11_628a_right := to_unsigned(10, 8);
     VAR_result_device_ram_address_uxn_device_h_l557_c3_6457 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l561_c11_1e61_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l586_c11_20bd_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l576_c11_c87b_right := to_unsigned(5, 8);
     VAR_result_device_ram_address_uxn_device_h_l582_c3_5a0f := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l552_c3_9e98 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l592_c3_dab5 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l587_c3_497c := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l597_c3_5690 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l602_c3_98d1 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l596_c11_9b25_right := to_unsigned(9, 8);
     VAR_result_device_ram_address_uxn_device_h_l572_c3_49b7 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l577_c3_5aa6 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_iftrue := to_unsigned(0, 1);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l591_c7_fcac] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l591_c7_fcac_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l592_c3_dab5,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l566_c7_ca5e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l566_c7_ca5e_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l567_c3_30b0,
     to_unsigned(30, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l581_c7_a168] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l581_c7_a168_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l582_c3_5a0f,
     to_unsigned(4, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l571_c7_7178] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l571_c7_7178_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l572_c3_49b7,
     to_unsigned(6, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l601_c7_95a5] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l601_c7_95a5_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l602_c3_98d1,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l586_c7_7029] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l586_c7_7029_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l587_c3_497c,
     to_unsigned(5, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l551_c2_784e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l551_c2_784e_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l552_c3_9e98,
     to_unsigned(7, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l596_c7_17b6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l596_c7_17b6_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l597_c3_5690,
     to_unsigned(108, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l556_c7_17fa] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l556_c7_17fa_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l557_c3_6457,
     to_unsigned(190, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l561_c7_667a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l561_c7_667a_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l562_c3_4cec,
     to_unsigned(11, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l576_c7_34c0] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l576_c7_34c0_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l577_c3_5aa6,
     to_unsigned(51, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l601_c7_95a5_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l601_c7_95a5_return_output;
     VAR_result_MUX_uxn_device_h_l551_c2_784e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l551_c2_784e_return_output;
     VAR_result_MUX_uxn_device_h_l561_c7_667a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l561_c7_667a_return_output;
     VAR_result_MUX_uxn_device_h_l556_c7_17fa_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l556_c7_17fa_return_output;
     VAR_result_MUX_uxn_device_h_l566_c7_ca5e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l566_c7_ca5e_return_output;
     VAR_result_MUX_uxn_device_h_l576_c7_34c0_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l576_c7_34c0_return_output;
     VAR_result_MUX_uxn_device_h_l591_c7_fcac_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l591_c7_fcac_return_output;
     VAR_result_MUX_uxn_device_h_l571_c7_7178_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l571_c7_7178_return_output;
     VAR_result_MUX_uxn_device_h_l586_c7_7029_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l586_c7_7029_return_output;
     VAR_result_MUX_uxn_device_h_l581_c7_a168_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l581_c7_a168_return_output;
     VAR_result_MUX_uxn_device_h_l596_c7_17b6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l596_c7_17b6_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l607_c12_fc33_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l607_c12_fc33_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l607_c12_fc33_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l548_c16_d295] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l551_c6_93ba_left := VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l556_c11_6431_left := VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l561_c11_1e61_left := VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l566_c11_16b4_left := VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l571_c11_27a2_left := VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l576_c11_c87b_left := VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_left := VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l586_c11_20bd_left := VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l591_c11_65c5_left := VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l596_c11_9b25_left := VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l601_c11_628a_left := VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l548_c16_d295_return_output;
     -- BIN_OP_EQ[uxn_device_h_l556_c11_6431] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l556_c11_6431_left <= VAR_BIN_OP_EQ_uxn_device_h_l556_c11_6431_left;
     BIN_OP_EQ_uxn_device_h_l556_c11_6431_right <= VAR_BIN_OP_EQ_uxn_device_h_l556_c11_6431_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l556_c11_6431_return_output := BIN_OP_EQ_uxn_device_h_l556_c11_6431_return_output;

     -- BIN_OP_EQ[uxn_device_h_l591_c11_65c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l591_c11_65c5_left <= VAR_BIN_OP_EQ_uxn_device_h_l591_c11_65c5_left;
     BIN_OP_EQ_uxn_device_h_l591_c11_65c5_right <= VAR_BIN_OP_EQ_uxn_device_h_l591_c11_65c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l591_c11_65c5_return_output := BIN_OP_EQ_uxn_device_h_l591_c11_65c5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l596_c11_9b25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l596_c11_9b25_left <= VAR_BIN_OP_EQ_uxn_device_h_l596_c11_9b25_left;
     BIN_OP_EQ_uxn_device_h_l596_c11_9b25_right <= VAR_BIN_OP_EQ_uxn_device_h_l596_c11_9b25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l596_c11_9b25_return_output := BIN_OP_EQ_uxn_device_h_l596_c11_9b25_return_output;

     -- BIN_OP_EQ[uxn_device_h_l561_c11_1e61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l561_c11_1e61_left <= VAR_BIN_OP_EQ_uxn_device_h_l561_c11_1e61_left;
     BIN_OP_EQ_uxn_device_h_l561_c11_1e61_right <= VAR_BIN_OP_EQ_uxn_device_h_l561_c11_1e61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l561_c11_1e61_return_output := BIN_OP_EQ_uxn_device_h_l561_c11_1e61_return_output;

     -- BIN_OP_EQ[uxn_device_h_l576_c11_c87b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l576_c11_c87b_left <= VAR_BIN_OP_EQ_uxn_device_h_l576_c11_c87b_left;
     BIN_OP_EQ_uxn_device_h_l576_c11_c87b_right <= VAR_BIN_OP_EQ_uxn_device_h_l576_c11_c87b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l576_c11_c87b_return_output := BIN_OP_EQ_uxn_device_h_l576_c11_c87b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l571_c11_27a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l571_c11_27a2_left <= VAR_BIN_OP_EQ_uxn_device_h_l571_c11_27a2_left;
     BIN_OP_EQ_uxn_device_h_l571_c11_27a2_right <= VAR_BIN_OP_EQ_uxn_device_h_l571_c11_27a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l571_c11_27a2_return_output := BIN_OP_EQ_uxn_device_h_l571_c11_27a2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l566_c11_16b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l566_c11_16b4_left <= VAR_BIN_OP_EQ_uxn_device_h_l566_c11_16b4_left;
     BIN_OP_EQ_uxn_device_h_l566_c11_16b4_right <= VAR_BIN_OP_EQ_uxn_device_h_l566_c11_16b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l566_c11_16b4_return_output := BIN_OP_EQ_uxn_device_h_l566_c11_16b4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l586_c11_20bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l586_c11_20bd_left <= VAR_BIN_OP_EQ_uxn_device_h_l586_c11_20bd_left;
     BIN_OP_EQ_uxn_device_h_l586_c11_20bd_right <= VAR_BIN_OP_EQ_uxn_device_h_l586_c11_20bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l586_c11_20bd_return_output := BIN_OP_EQ_uxn_device_h_l586_c11_20bd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l551_c6_93ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l551_c6_93ba_left <= VAR_BIN_OP_EQ_uxn_device_h_l551_c6_93ba_left;
     BIN_OP_EQ_uxn_device_h_l551_c6_93ba_right <= VAR_BIN_OP_EQ_uxn_device_h_l551_c6_93ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l551_c6_93ba_return_output := BIN_OP_EQ_uxn_device_h_l551_c6_93ba_return_output;

     -- BIN_OP_EQ[uxn_device_h_l581_c11_0ecd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_left <= VAR_BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_left;
     BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_right <= VAR_BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_return_output := BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l601_c11_628a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l601_c11_628a_left <= VAR_BIN_OP_EQ_uxn_device_h_l601_c11_628a_left;
     BIN_OP_EQ_uxn_device_h_l601_c11_628a_right <= VAR_BIN_OP_EQ_uxn_device_h_l601_c11_628a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l601_c11_628a_return_output := BIN_OP_EQ_uxn_device_h_l601_c11_628a_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_cond := VAR_BIN_OP_EQ_uxn_device_h_l551_c6_93ba_return_output;
     VAR_result_MUX_uxn_device_h_l551_c2_784e_cond := VAR_BIN_OP_EQ_uxn_device_h_l551_c6_93ba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_cond := VAR_BIN_OP_EQ_uxn_device_h_l556_c11_6431_return_output;
     VAR_result_MUX_uxn_device_h_l556_c7_17fa_cond := VAR_BIN_OP_EQ_uxn_device_h_l556_c11_6431_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l561_c11_1e61_return_output;
     VAR_result_MUX_uxn_device_h_l561_c7_667a_cond := VAR_BIN_OP_EQ_uxn_device_h_l561_c11_1e61_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_cond := VAR_BIN_OP_EQ_uxn_device_h_l566_c11_16b4_return_output;
     VAR_result_MUX_uxn_device_h_l566_c7_ca5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l566_c11_16b4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l571_c11_27a2_return_output;
     VAR_result_MUX_uxn_device_h_l571_c7_7178_cond := VAR_BIN_OP_EQ_uxn_device_h_l571_c11_27a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_cond := VAR_BIN_OP_EQ_uxn_device_h_l576_c11_c87b_return_output;
     VAR_result_MUX_uxn_device_h_l576_c7_34c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l576_c11_c87b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_cond := VAR_BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_return_output;
     VAR_result_MUX_uxn_device_h_l581_c7_a168_cond := VAR_BIN_OP_EQ_uxn_device_h_l581_c11_0ecd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_cond := VAR_BIN_OP_EQ_uxn_device_h_l586_c11_20bd_return_output;
     VAR_result_MUX_uxn_device_h_l586_c7_7029_cond := VAR_BIN_OP_EQ_uxn_device_h_l586_c11_20bd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l591_c11_65c5_return_output;
     VAR_result_MUX_uxn_device_h_l591_c7_fcac_cond := VAR_BIN_OP_EQ_uxn_device_h_l591_c11_65c5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l596_c11_9b25_return_output;
     VAR_result_MUX_uxn_device_h_l596_c7_17b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l596_c11_9b25_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l601_c11_628a_return_output;
     VAR_result_MUX_uxn_device_h_l601_c7_95a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l601_c11_628a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l556_c7_17fa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l556_c7_17fa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l561_c7_667a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l561_c7_667a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l566_c7_ca5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l566_c7_ca5e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l571_c7_7178] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l571_c7_7178_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l576_c7_34c0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_34c0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l581_c7_a168] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l581_c7_a168_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l586_c7_7029] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l586_c7_7029_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l591_c7_fcac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l591_c7_fcac_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l596_c7_17b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l596_c7_17b6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l601_c7_95a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l601_c7_95a5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l606_c1_80a3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_return_output;

     -- Submodule level 13
     VAR_generic_dei_uxn_device_h_l607_c12_fc33_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l606_c1_80a3_return_output;
     -- generic_dei[uxn_device_h_l607_c12_fc33] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l607_c12_fc33_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l607_c12_fc33_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l607_c12_fc33_device_address <= VAR_generic_dei_uxn_device_h_l607_c12_fc33_device_address;
     generic_dei_uxn_device_h_l607_c12_fc33_phase <= VAR_generic_dei_uxn_device_h_l607_c12_fc33_phase;
     generic_dei_uxn_device_h_l607_c12_fc33_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l607_c12_fc33_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l607_c12_fc33_return_output := generic_dei_uxn_device_h_l607_c12_fc33_return_output;

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l601_c7_95a5_iffalse := VAR_generic_dei_uxn_device_h_l607_c12_fc33_return_output;
     -- result_MUX[uxn_device_h_l601_c7_95a5] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l601_c7_95a5_cond <= VAR_result_MUX_uxn_device_h_l601_c7_95a5_cond;
     result_MUX_uxn_device_h_l601_c7_95a5_iftrue <= VAR_result_MUX_uxn_device_h_l601_c7_95a5_iftrue;
     result_MUX_uxn_device_h_l601_c7_95a5_iffalse <= VAR_result_MUX_uxn_device_h_l601_c7_95a5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l601_c7_95a5_return_output := result_MUX_uxn_device_h_l601_c7_95a5_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l596_c7_17b6_iffalse := VAR_result_MUX_uxn_device_h_l601_c7_95a5_return_output;
     -- result_MUX[uxn_device_h_l596_c7_17b6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l596_c7_17b6_cond <= VAR_result_MUX_uxn_device_h_l596_c7_17b6_cond;
     result_MUX_uxn_device_h_l596_c7_17b6_iftrue <= VAR_result_MUX_uxn_device_h_l596_c7_17b6_iftrue;
     result_MUX_uxn_device_h_l596_c7_17b6_iffalse <= VAR_result_MUX_uxn_device_h_l596_c7_17b6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l596_c7_17b6_return_output := result_MUX_uxn_device_h_l596_c7_17b6_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l591_c7_fcac_iffalse := VAR_result_MUX_uxn_device_h_l596_c7_17b6_return_output;
     -- result_MUX[uxn_device_h_l591_c7_fcac] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l591_c7_fcac_cond <= VAR_result_MUX_uxn_device_h_l591_c7_fcac_cond;
     result_MUX_uxn_device_h_l591_c7_fcac_iftrue <= VAR_result_MUX_uxn_device_h_l591_c7_fcac_iftrue;
     result_MUX_uxn_device_h_l591_c7_fcac_iffalse <= VAR_result_MUX_uxn_device_h_l591_c7_fcac_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l591_c7_fcac_return_output := result_MUX_uxn_device_h_l591_c7_fcac_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l586_c7_7029_iffalse := VAR_result_MUX_uxn_device_h_l591_c7_fcac_return_output;
     -- result_MUX[uxn_device_h_l586_c7_7029] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l586_c7_7029_cond <= VAR_result_MUX_uxn_device_h_l586_c7_7029_cond;
     result_MUX_uxn_device_h_l586_c7_7029_iftrue <= VAR_result_MUX_uxn_device_h_l586_c7_7029_iftrue;
     result_MUX_uxn_device_h_l586_c7_7029_iffalse <= VAR_result_MUX_uxn_device_h_l586_c7_7029_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l586_c7_7029_return_output := result_MUX_uxn_device_h_l586_c7_7029_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l581_c7_a168_iffalse := VAR_result_MUX_uxn_device_h_l586_c7_7029_return_output;
     -- result_MUX[uxn_device_h_l581_c7_a168] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l581_c7_a168_cond <= VAR_result_MUX_uxn_device_h_l581_c7_a168_cond;
     result_MUX_uxn_device_h_l581_c7_a168_iftrue <= VAR_result_MUX_uxn_device_h_l581_c7_a168_iftrue;
     result_MUX_uxn_device_h_l581_c7_a168_iffalse <= VAR_result_MUX_uxn_device_h_l581_c7_a168_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l581_c7_a168_return_output := result_MUX_uxn_device_h_l581_c7_a168_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l576_c7_34c0_iffalse := VAR_result_MUX_uxn_device_h_l581_c7_a168_return_output;
     -- result_MUX[uxn_device_h_l576_c7_34c0] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l576_c7_34c0_cond <= VAR_result_MUX_uxn_device_h_l576_c7_34c0_cond;
     result_MUX_uxn_device_h_l576_c7_34c0_iftrue <= VAR_result_MUX_uxn_device_h_l576_c7_34c0_iftrue;
     result_MUX_uxn_device_h_l576_c7_34c0_iffalse <= VAR_result_MUX_uxn_device_h_l576_c7_34c0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l576_c7_34c0_return_output := result_MUX_uxn_device_h_l576_c7_34c0_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l571_c7_7178_iffalse := VAR_result_MUX_uxn_device_h_l576_c7_34c0_return_output;
     -- result_MUX[uxn_device_h_l571_c7_7178] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l571_c7_7178_cond <= VAR_result_MUX_uxn_device_h_l571_c7_7178_cond;
     result_MUX_uxn_device_h_l571_c7_7178_iftrue <= VAR_result_MUX_uxn_device_h_l571_c7_7178_iftrue;
     result_MUX_uxn_device_h_l571_c7_7178_iffalse <= VAR_result_MUX_uxn_device_h_l571_c7_7178_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l571_c7_7178_return_output := result_MUX_uxn_device_h_l571_c7_7178_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l566_c7_ca5e_iffalse := VAR_result_MUX_uxn_device_h_l571_c7_7178_return_output;
     -- result_MUX[uxn_device_h_l566_c7_ca5e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l566_c7_ca5e_cond <= VAR_result_MUX_uxn_device_h_l566_c7_ca5e_cond;
     result_MUX_uxn_device_h_l566_c7_ca5e_iftrue <= VAR_result_MUX_uxn_device_h_l566_c7_ca5e_iftrue;
     result_MUX_uxn_device_h_l566_c7_ca5e_iffalse <= VAR_result_MUX_uxn_device_h_l566_c7_ca5e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l566_c7_ca5e_return_output := result_MUX_uxn_device_h_l566_c7_ca5e_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l561_c7_667a_iffalse := VAR_result_MUX_uxn_device_h_l566_c7_ca5e_return_output;
     -- result_MUX[uxn_device_h_l561_c7_667a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l561_c7_667a_cond <= VAR_result_MUX_uxn_device_h_l561_c7_667a_cond;
     result_MUX_uxn_device_h_l561_c7_667a_iftrue <= VAR_result_MUX_uxn_device_h_l561_c7_667a_iftrue;
     result_MUX_uxn_device_h_l561_c7_667a_iffalse <= VAR_result_MUX_uxn_device_h_l561_c7_667a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l561_c7_667a_return_output := result_MUX_uxn_device_h_l561_c7_667a_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l556_c7_17fa_iffalse := VAR_result_MUX_uxn_device_h_l561_c7_667a_return_output;
     -- result_MUX[uxn_device_h_l556_c7_17fa] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l556_c7_17fa_cond <= VAR_result_MUX_uxn_device_h_l556_c7_17fa_cond;
     result_MUX_uxn_device_h_l556_c7_17fa_iftrue <= VAR_result_MUX_uxn_device_h_l556_c7_17fa_iftrue;
     result_MUX_uxn_device_h_l556_c7_17fa_iffalse <= VAR_result_MUX_uxn_device_h_l556_c7_17fa_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l556_c7_17fa_return_output := result_MUX_uxn_device_h_l556_c7_17fa_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l551_c2_784e_iffalse := VAR_result_MUX_uxn_device_h_l556_c7_17fa_return_output;
     -- result_MUX[uxn_device_h_l551_c2_784e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l551_c2_784e_cond <= VAR_result_MUX_uxn_device_h_l551_c2_784e_cond;
     result_MUX_uxn_device_h_l551_c2_784e_iftrue <= VAR_result_MUX_uxn_device_h_l551_c2_784e_iftrue;
     result_MUX_uxn_device_h_l551_c2_784e_iffalse <= VAR_result_MUX_uxn_device_h_l551_c2_784e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l551_c2_784e_return_output := result_MUX_uxn_device_h_l551_c2_784e_return_output;

     -- Submodule level 25
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l551_c2_784e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l551_c2_784e_return_output;
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
