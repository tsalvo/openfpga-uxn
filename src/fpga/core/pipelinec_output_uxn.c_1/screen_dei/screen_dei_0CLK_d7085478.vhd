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
-- Submodules: 18
entity screen_dei_0CLK_d7085478 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end screen_dei_0CLK_d7085478;
architecture arch of screen_dei_0CLK_d7085478 is
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
-- BIN_OP_EQ[uxn_device_h_l297_c6_6cfc]
signal BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l302_c7_fcf8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l297_c2_b88d]
signal result_MUX_uxn_device_h_l297_c2_b88d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l297_c2_b88d_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l297_c2_b88d_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l297_c2_b88d_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l302_c11_31b2]
signal BIN_OP_EQ_uxn_device_h_l302_c11_31b2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l302_c11_31b2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l302_c11_31b2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l307_c7_c827]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l302_c7_fcf8]
signal result_MUX_uxn_device_h_l302_c7_fcf8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l302_c7_fcf8_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l302_c7_fcf8_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l302_c7_fcf8_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l307_c11_4f61]
signal BIN_OP_EQ_uxn_device_h_l307_c11_4f61_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c11_4f61_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c11_4f61_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l312_c7_f001]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l307_c7_c827]
signal result_MUX_uxn_device_h_l307_c7_c827_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l307_c7_c827_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l307_c7_c827_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l307_c7_c827_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l312_c11_5772]
signal BIN_OP_EQ_uxn_device_h_l312_c11_5772_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c11_5772_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c11_5772_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l317_c1_abef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l312_c7_f001]
signal result_MUX_uxn_device_h_l312_c7_f001_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l312_c7_f001_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l312_c7_f001_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l312_c7_f001_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l318_c12_4731]
signal generic_dei_uxn_device_h_l318_c12_4731_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l318_c12_4731_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l318_c12_4731_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l318_c12_4731_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l318_c12_4731_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l297_c6_6cfc
BIN_OP_EQ_uxn_device_h_l297_c6_6cfc : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_left,
BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_right,
BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_return_output);

-- result_MUX_uxn_device_h_l297_c2_b88d
result_MUX_uxn_device_h_l297_c2_b88d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l297_c2_b88d_cond,
result_MUX_uxn_device_h_l297_c2_b88d_iftrue,
result_MUX_uxn_device_h_l297_c2_b88d_iffalse,
result_MUX_uxn_device_h_l297_c2_b88d_return_output);

-- BIN_OP_EQ_uxn_device_h_l302_c11_31b2
BIN_OP_EQ_uxn_device_h_l302_c11_31b2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l302_c11_31b2_left,
BIN_OP_EQ_uxn_device_h_l302_c11_31b2_right,
BIN_OP_EQ_uxn_device_h_l302_c11_31b2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_return_output);

-- result_MUX_uxn_device_h_l302_c7_fcf8
result_MUX_uxn_device_h_l302_c7_fcf8 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l302_c7_fcf8_cond,
result_MUX_uxn_device_h_l302_c7_fcf8_iftrue,
result_MUX_uxn_device_h_l302_c7_fcf8_iffalse,
result_MUX_uxn_device_h_l302_c7_fcf8_return_output);

-- BIN_OP_EQ_uxn_device_h_l307_c11_4f61
BIN_OP_EQ_uxn_device_h_l307_c11_4f61 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l307_c11_4f61_left,
BIN_OP_EQ_uxn_device_h_l307_c11_4f61_right,
BIN_OP_EQ_uxn_device_h_l307_c11_4f61_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_return_output);

-- result_MUX_uxn_device_h_l307_c7_c827
result_MUX_uxn_device_h_l307_c7_c827 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l307_c7_c827_cond,
result_MUX_uxn_device_h_l307_c7_c827_iftrue,
result_MUX_uxn_device_h_l307_c7_c827_iffalse,
result_MUX_uxn_device_h_l307_c7_c827_return_output);

-- BIN_OP_EQ_uxn_device_h_l312_c11_5772
BIN_OP_EQ_uxn_device_h_l312_c11_5772 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l312_c11_5772_left,
BIN_OP_EQ_uxn_device_h_l312_c11_5772_right,
BIN_OP_EQ_uxn_device_h_l312_c11_5772_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_return_output);

-- result_MUX_uxn_device_h_l312_c7_f001
result_MUX_uxn_device_h_l312_c7_f001 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l312_c7_f001_cond,
result_MUX_uxn_device_h_l312_c7_f001_iftrue,
result_MUX_uxn_device_h_l312_c7_f001_iffalse,
result_MUX_uxn_device_h_l312_c7_f001_return_output);

-- generic_dei_uxn_device_h_l318_c12_4731
generic_dei_uxn_device_h_l318_c12_4731 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l318_c12_4731_CLOCK_ENABLE,
generic_dei_uxn_device_h_l318_c12_4731_device_address,
generic_dei_uxn_device_h_l318_c12_4731_phase,
generic_dei_uxn_device_h_l318_c12_4731_previous_device_ram_read,
generic_dei_uxn_device_h_l318_c12_4731_return_output);



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
 BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_return_output,
 result_MUX_uxn_device_h_l297_c2_b88d_return_output,
 BIN_OP_EQ_uxn_device_h_l302_c11_31b2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_return_output,
 result_MUX_uxn_device_h_l302_c7_fcf8_return_output,
 BIN_OP_EQ_uxn_device_h_l307_c11_4f61_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_return_output,
 result_MUX_uxn_device_h_l307_c7_c827_return_output,
 BIN_OP_EQ_uxn_device_h_l312_c11_5772_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_return_output,
 result_MUX_uxn_device_h_l312_c7_f001_return_output,
 generic_dei_uxn_device_h_l318_c12_4731_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_9443_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l297_c2_b88d_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l297_c2_b88d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c2_b88d_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_fcf8_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c2_b88d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c2_b88d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l298_c3_804b : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_31b2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_31b2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_31b2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l302_c7_fcf8_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l302_c7_fcf8_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_fcf8_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_c827_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_fcf8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l303_c3_ecee : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_4f61_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_4f61_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_4f61_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l307_c7_c827_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l307_c7_c827_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_c827_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_f001_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_c827_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l308_c3_785f : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_5772_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_5772_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_5772_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l312_c7_f001_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l312_c7_f001_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_f001_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_f001_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l313_c3_6c95 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_4731_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_4731_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_4731_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_4731_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_4731_return_output : device_in_result_t;
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
     VAR_BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_right := to_unsigned(2, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_31b2_right := to_unsigned(3, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l313_c3_6c95 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l298_c3_804b := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_5772_right := to_unsigned(5, 4);
     VAR_result_device_ram_address_uxn_device_h_l303_c3_ecee := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l308_c3_785f := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_4f61_right := to_unsigned(4, 4);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l307_c7_c827] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l307_c7_c827_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l308_c3_785f,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l297_c2_b88d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l297_c2_b88d_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l298_c3_804b,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l312_c7_f001] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l312_c7_f001_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l313_c3_6c95,
     to_unsigned(240, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l302_c7_fcf8] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l302_c7_fcf8_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l303_c3_ecee,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l297_c2_b88d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l297_c2_b88d_return_output;
     VAR_result_MUX_uxn_device_h_l312_c7_f001_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l312_c7_f001_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_c827_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l307_c7_c827_return_output;
     VAR_result_MUX_uxn_device_h_l302_c7_fcf8_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l302_c7_fcf8_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l318_c12_4731_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l318_c12_4731_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l318_c12_4731_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l296_c16_9443] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_9443_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_9443_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_31b2_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_9443_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_4f61_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_9443_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_5772_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_9443_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_9443_return_output;
     -- BIN_OP_EQ[uxn_device_h_l307_c11_4f61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l307_c11_4f61_left <= VAR_BIN_OP_EQ_uxn_device_h_l307_c11_4f61_left;
     BIN_OP_EQ_uxn_device_h_l307_c11_4f61_right <= VAR_BIN_OP_EQ_uxn_device_h_l307_c11_4f61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_4f61_return_output := BIN_OP_EQ_uxn_device_h_l307_c11_4f61_return_output;

     -- BIN_OP_EQ[uxn_device_h_l312_c11_5772] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l312_c11_5772_left <= VAR_BIN_OP_EQ_uxn_device_h_l312_c11_5772_left;
     BIN_OP_EQ_uxn_device_h_l312_c11_5772_right <= VAR_BIN_OP_EQ_uxn_device_h_l312_c11_5772_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_5772_return_output := BIN_OP_EQ_uxn_device_h_l312_c11_5772_return_output;

     -- BIN_OP_EQ[uxn_device_h_l302_c11_31b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l302_c11_31b2_left <= VAR_BIN_OP_EQ_uxn_device_h_l302_c11_31b2_left;
     BIN_OP_EQ_uxn_device_h_l302_c11_31b2_right <= VAR_BIN_OP_EQ_uxn_device_h_l302_c11_31b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_31b2_return_output := BIN_OP_EQ_uxn_device_h_l302_c11_31b2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l297_c6_6cfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_left <= VAR_BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_left;
     BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_right <= VAR_BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_return_output := BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_return_output;
     VAR_result_MUX_uxn_device_h_l297_c2_b88d_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c6_6cfc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_31b2_return_output;
     VAR_result_MUX_uxn_device_h_l302_c7_fcf8_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_31b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_4f61_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_c827_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_4f61_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_5772_return_output;
     VAR_result_MUX_uxn_device_h_l312_c7_f001_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_5772_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l302_c7_fcf8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fcf8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l307_c7_c827] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_c827_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l312_c7_f001] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_f001_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l317_c1_abef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l318_c12_4731_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_abef_return_output;
     -- generic_dei[uxn_device_h_l318_c12_4731] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l318_c12_4731_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l318_c12_4731_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l318_c12_4731_device_address <= VAR_generic_dei_uxn_device_h_l318_c12_4731_device_address;
     generic_dei_uxn_device_h_l318_c12_4731_phase <= VAR_generic_dei_uxn_device_h_l318_c12_4731_phase;
     generic_dei_uxn_device_h_l318_c12_4731_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l318_c12_4731_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l318_c12_4731_return_output := generic_dei_uxn_device_h_l318_c12_4731_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l312_c7_f001_iffalse := VAR_generic_dei_uxn_device_h_l318_c12_4731_return_output;
     -- result_MUX[uxn_device_h_l312_c7_f001] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l312_c7_f001_cond <= VAR_result_MUX_uxn_device_h_l312_c7_f001_cond;
     result_MUX_uxn_device_h_l312_c7_f001_iftrue <= VAR_result_MUX_uxn_device_h_l312_c7_f001_iftrue;
     result_MUX_uxn_device_h_l312_c7_f001_iffalse <= VAR_result_MUX_uxn_device_h_l312_c7_f001_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l312_c7_f001_return_output := result_MUX_uxn_device_h_l312_c7_f001_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l307_c7_c827_iffalse := VAR_result_MUX_uxn_device_h_l312_c7_f001_return_output;
     -- result_MUX[uxn_device_h_l307_c7_c827] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l307_c7_c827_cond <= VAR_result_MUX_uxn_device_h_l307_c7_c827_cond;
     result_MUX_uxn_device_h_l307_c7_c827_iftrue <= VAR_result_MUX_uxn_device_h_l307_c7_c827_iftrue;
     result_MUX_uxn_device_h_l307_c7_c827_iffalse <= VAR_result_MUX_uxn_device_h_l307_c7_c827_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l307_c7_c827_return_output := result_MUX_uxn_device_h_l307_c7_c827_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l302_c7_fcf8_iffalse := VAR_result_MUX_uxn_device_h_l307_c7_c827_return_output;
     -- result_MUX[uxn_device_h_l302_c7_fcf8] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l302_c7_fcf8_cond <= VAR_result_MUX_uxn_device_h_l302_c7_fcf8_cond;
     result_MUX_uxn_device_h_l302_c7_fcf8_iftrue <= VAR_result_MUX_uxn_device_h_l302_c7_fcf8_iftrue;
     result_MUX_uxn_device_h_l302_c7_fcf8_iffalse <= VAR_result_MUX_uxn_device_h_l302_c7_fcf8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l302_c7_fcf8_return_output := result_MUX_uxn_device_h_l302_c7_fcf8_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l297_c2_b88d_iffalse := VAR_result_MUX_uxn_device_h_l302_c7_fcf8_return_output;
     -- result_MUX[uxn_device_h_l297_c2_b88d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l297_c2_b88d_cond <= VAR_result_MUX_uxn_device_h_l297_c2_b88d_cond;
     result_MUX_uxn_device_h_l297_c2_b88d_iftrue <= VAR_result_MUX_uxn_device_h_l297_c2_b88d_iftrue;
     result_MUX_uxn_device_h_l297_c2_b88d_iffalse <= VAR_result_MUX_uxn_device_h_l297_c2_b88d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l297_c2_b88d_return_output := result_MUX_uxn_device_h_l297_c2_b88d_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l297_c2_b88d_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l297_c2_b88d_return_output;
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
