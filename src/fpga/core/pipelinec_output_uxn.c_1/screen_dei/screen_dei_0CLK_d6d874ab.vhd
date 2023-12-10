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
-- Submodules: 17
entity screen_dei_0CLK_d6d874ab is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end screen_dei_0CLK_d6d874ab;
architecture arch of screen_dei_0CLK_d6d874ab is
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
signal REG_COMB_result : device_in_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l310_c6_e89b]
signal BIN_OP_EQ_uxn_device_h_l310_c6_e89b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l310_c6_e89b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l310_c6_e89b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l315_c7_b0db]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l310_c2_700c]
signal result_MUX_uxn_device_h_l310_c2_700c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l310_c2_700c_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l310_c2_700c_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l310_c2_700c_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l315_c11_eff2]
signal BIN_OP_EQ_uxn_device_h_l315_c11_eff2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l315_c11_eff2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l315_c11_eff2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l320_c7_3bf7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l315_c7_b0db]
signal result_MUX_uxn_device_h_l315_c7_b0db_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l315_c7_b0db_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l315_c7_b0db_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l315_c7_b0db_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l320_c11_b995]
signal BIN_OP_EQ_uxn_device_h_l320_c11_b995_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l320_c11_b995_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l320_c11_b995_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l325_c7_a8a6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l320_c7_3bf7]
signal result_MUX_uxn_device_h_l320_c7_3bf7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l320_c7_3bf7_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l320_c7_3bf7_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l320_c7_3bf7_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l325_c11_b4a5]
signal BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l330_c1_4940]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l325_c7_a8a6]
signal result_MUX_uxn_device_h_l325_c7_a8a6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l325_c7_a8a6_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l325_c7_a8a6_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l325_c7_a8a6_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l331_c12_4c6c]
signal generic_dei_uxn_device_h_l331_c12_4c6c_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l331_c12_4c6c_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l331_c12_4c6c_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l331_c12_4c6c_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l331_c12_4c6c_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l310_c6_e89b
BIN_OP_EQ_uxn_device_h_l310_c6_e89b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l310_c6_e89b_left,
BIN_OP_EQ_uxn_device_h_l310_c6_e89b_right,
BIN_OP_EQ_uxn_device_h_l310_c6_e89b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_return_output);

-- result_MUX_uxn_device_h_l310_c2_700c
result_MUX_uxn_device_h_l310_c2_700c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l310_c2_700c_cond,
result_MUX_uxn_device_h_l310_c2_700c_iftrue,
result_MUX_uxn_device_h_l310_c2_700c_iffalse,
result_MUX_uxn_device_h_l310_c2_700c_return_output);

-- BIN_OP_EQ_uxn_device_h_l315_c11_eff2
BIN_OP_EQ_uxn_device_h_l315_c11_eff2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l315_c11_eff2_left,
BIN_OP_EQ_uxn_device_h_l315_c11_eff2_right,
BIN_OP_EQ_uxn_device_h_l315_c11_eff2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_return_output);

-- result_MUX_uxn_device_h_l315_c7_b0db
result_MUX_uxn_device_h_l315_c7_b0db : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l315_c7_b0db_cond,
result_MUX_uxn_device_h_l315_c7_b0db_iftrue,
result_MUX_uxn_device_h_l315_c7_b0db_iffalse,
result_MUX_uxn_device_h_l315_c7_b0db_return_output);

-- BIN_OP_EQ_uxn_device_h_l320_c11_b995
BIN_OP_EQ_uxn_device_h_l320_c11_b995 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l320_c11_b995_left,
BIN_OP_EQ_uxn_device_h_l320_c11_b995_right,
BIN_OP_EQ_uxn_device_h_l320_c11_b995_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_return_output);

-- result_MUX_uxn_device_h_l320_c7_3bf7
result_MUX_uxn_device_h_l320_c7_3bf7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l320_c7_3bf7_cond,
result_MUX_uxn_device_h_l320_c7_3bf7_iftrue,
result_MUX_uxn_device_h_l320_c7_3bf7_iffalse,
result_MUX_uxn_device_h_l320_c7_3bf7_return_output);

-- BIN_OP_EQ_uxn_device_h_l325_c11_b4a5
BIN_OP_EQ_uxn_device_h_l325_c11_b4a5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_left,
BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_right,
BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_return_output);

-- result_MUX_uxn_device_h_l325_c7_a8a6
result_MUX_uxn_device_h_l325_c7_a8a6 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l325_c7_a8a6_cond,
result_MUX_uxn_device_h_l325_c7_a8a6_iftrue,
result_MUX_uxn_device_h_l325_c7_a8a6_iffalse,
result_MUX_uxn_device_h_l325_c7_a8a6_return_output);

-- generic_dei_uxn_device_h_l331_c12_4c6c
generic_dei_uxn_device_h_l331_c12_4c6c : entity work.generic_dei_0CLK_6f2c5aad port map (
clk,
generic_dei_uxn_device_h_l331_c12_4c6c_CLOCK_ENABLE,
generic_dei_uxn_device_h_l331_c12_4c6c_device_address,
generic_dei_uxn_device_h_l331_c12_4c6c_phase,
generic_dei_uxn_device_h_l331_c12_4c6c_previous_device_ram_read,
generic_dei_uxn_device_h_l331_c12_4c6c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l310_c6_e89b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_return_output,
 result_MUX_uxn_device_h_l310_c2_700c_return_output,
 BIN_OP_EQ_uxn_device_h_l315_c11_eff2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_return_output,
 result_MUX_uxn_device_h_l315_c7_b0db_return_output,
 BIN_OP_EQ_uxn_device_h_l320_c11_b995_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_return_output,
 result_MUX_uxn_device_h_l320_c7_3bf7_return_output,
 BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_return_output,
 result_MUX_uxn_device_h_l325_c7_a8a6_return_output,
 generic_dei_uxn_device_h_l331_c12_4c6c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l310_c6_e89b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l310_c6_e89b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l310_c6_e89b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l310_c2_700c_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l310_c2_700c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l310_c2_700c_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l315_c7_b0db_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l310_c2_700c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l310_c2_700c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l311_c3_d572 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l315_c11_eff2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l315_c11_eff2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l315_c11_eff2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l315_c7_b0db_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l315_c7_b0db_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l315_c7_b0db_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l320_c7_3bf7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l315_c7_b0db_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l316_c3_f9dc : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l320_c11_b995_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l320_c11_b995_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l320_c11_b995_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l320_c7_3bf7_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l320_c7_3bf7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l320_c7_3bf7_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l325_c7_a8a6_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l320_c7_3bf7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l321_c3_3bb5 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l325_c7_a8a6_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l325_c7_a8a6_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l325_c7_a8a6_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l325_c7_a8a6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l326_c3_9629 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l331_c12_4c6c_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l331_c12_4c6c_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l331_c12_4c6c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l331_c12_4c6c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l331_c12_4c6c_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_device_ram_address_uxn_device_h_l326_c3_9629 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l321_c3_3bb5 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l310_c6_e89b_right := to_unsigned(34, 8);
     VAR_result_device_ram_address_uxn_device_h_l311_c3_d572 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l320_c11_b995_right := to_unsigned(36, 8);
     VAR_result_device_ram_address_uxn_device_h_l316_c3_f9dc := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_right := to_unsigned(37, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l315_c11_eff2_right := to_unsigned(35, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_iftrue := to_unsigned(0, 1);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l325_c7_a8a6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l325_c7_a8a6_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l326_c3_9629,
     to_unsigned(234, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l315_c7_b0db] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l315_c7_b0db_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l316_c3_f9dc,
     to_unsigned(4, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l320_c7_3bf7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l320_c7_3bf7_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l321_c3_3bb5,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l310_c2_700c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l310_c2_700c_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l311_c3_d572,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l315_c7_b0db_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l315_c7_b0db_return_output;
     VAR_result_MUX_uxn_device_h_l320_c7_3bf7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l320_c7_3bf7_return_output;
     VAR_result_MUX_uxn_device_h_l325_c7_a8a6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l325_c7_a8a6_return_output;
     VAR_result_MUX_uxn_device_h_l310_c2_700c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l310_c2_700c_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_device_h_l310_c6_e89b_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l315_c11_eff2_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l320_c11_b995_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_left := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l331_c12_4c6c_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l331_c12_4c6c_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l331_c12_4c6c_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_EQ[uxn_device_h_l310_c6_e89b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l310_c6_e89b_left <= VAR_BIN_OP_EQ_uxn_device_h_l310_c6_e89b_left;
     BIN_OP_EQ_uxn_device_h_l310_c6_e89b_right <= VAR_BIN_OP_EQ_uxn_device_h_l310_c6_e89b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l310_c6_e89b_return_output := BIN_OP_EQ_uxn_device_h_l310_c6_e89b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l320_c11_b995] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l320_c11_b995_left <= VAR_BIN_OP_EQ_uxn_device_h_l320_c11_b995_left;
     BIN_OP_EQ_uxn_device_h_l320_c11_b995_right <= VAR_BIN_OP_EQ_uxn_device_h_l320_c11_b995_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l320_c11_b995_return_output := BIN_OP_EQ_uxn_device_h_l320_c11_b995_return_output;

     -- BIN_OP_EQ[uxn_device_h_l325_c11_b4a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_left <= VAR_BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_left;
     BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_right <= VAR_BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_return_output := BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l315_c11_eff2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l315_c11_eff2_left <= VAR_BIN_OP_EQ_uxn_device_h_l315_c11_eff2_left;
     BIN_OP_EQ_uxn_device_h_l315_c11_eff2_right <= VAR_BIN_OP_EQ_uxn_device_h_l315_c11_eff2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l315_c11_eff2_return_output := BIN_OP_EQ_uxn_device_h_l315_c11_eff2_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c6_e89b_return_output;
     VAR_result_MUX_uxn_device_h_l310_c2_700c_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c6_e89b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_eff2_return_output;
     VAR_result_MUX_uxn_device_h_l315_c7_b0db_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c11_eff2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l320_c11_b995_return_output;
     VAR_result_MUX_uxn_device_h_l320_c7_3bf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l320_c11_b995_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_cond := VAR_BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_return_output;
     VAR_result_MUX_uxn_device_h_l325_c7_a8a6_cond := VAR_BIN_OP_EQ_uxn_device_h_l325_c11_b4a5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l315_c7_b0db] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c7_b0db_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l320_c7_3bf7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_3bf7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l325_c7_a8a6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_a8a6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l330_c1_4940] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_return_output;

     -- Submodule level 5
     VAR_generic_dei_uxn_device_h_l331_c12_4c6c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c1_4940_return_output;
     -- generic_dei[uxn_device_h_l331_c12_4c6c] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l331_c12_4c6c_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l331_c12_4c6c_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l331_c12_4c6c_device_address <= VAR_generic_dei_uxn_device_h_l331_c12_4c6c_device_address;
     generic_dei_uxn_device_h_l331_c12_4c6c_phase <= VAR_generic_dei_uxn_device_h_l331_c12_4c6c_phase;
     generic_dei_uxn_device_h_l331_c12_4c6c_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l331_c12_4c6c_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l331_c12_4c6c_return_output := generic_dei_uxn_device_h_l331_c12_4c6c_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l325_c7_a8a6_iffalse := VAR_generic_dei_uxn_device_h_l331_c12_4c6c_return_output;
     -- result_MUX[uxn_device_h_l325_c7_a8a6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l325_c7_a8a6_cond <= VAR_result_MUX_uxn_device_h_l325_c7_a8a6_cond;
     result_MUX_uxn_device_h_l325_c7_a8a6_iftrue <= VAR_result_MUX_uxn_device_h_l325_c7_a8a6_iftrue;
     result_MUX_uxn_device_h_l325_c7_a8a6_iffalse <= VAR_result_MUX_uxn_device_h_l325_c7_a8a6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l325_c7_a8a6_return_output := result_MUX_uxn_device_h_l325_c7_a8a6_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l320_c7_3bf7_iffalse := VAR_result_MUX_uxn_device_h_l325_c7_a8a6_return_output;
     -- result_MUX[uxn_device_h_l320_c7_3bf7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l320_c7_3bf7_cond <= VAR_result_MUX_uxn_device_h_l320_c7_3bf7_cond;
     result_MUX_uxn_device_h_l320_c7_3bf7_iftrue <= VAR_result_MUX_uxn_device_h_l320_c7_3bf7_iftrue;
     result_MUX_uxn_device_h_l320_c7_3bf7_iffalse <= VAR_result_MUX_uxn_device_h_l320_c7_3bf7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l320_c7_3bf7_return_output := result_MUX_uxn_device_h_l320_c7_3bf7_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l315_c7_b0db_iffalse := VAR_result_MUX_uxn_device_h_l320_c7_3bf7_return_output;
     -- result_MUX[uxn_device_h_l315_c7_b0db] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l315_c7_b0db_cond <= VAR_result_MUX_uxn_device_h_l315_c7_b0db_cond;
     result_MUX_uxn_device_h_l315_c7_b0db_iftrue <= VAR_result_MUX_uxn_device_h_l315_c7_b0db_iftrue;
     result_MUX_uxn_device_h_l315_c7_b0db_iffalse <= VAR_result_MUX_uxn_device_h_l315_c7_b0db_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l315_c7_b0db_return_output := result_MUX_uxn_device_h_l315_c7_b0db_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l310_c2_700c_iffalse := VAR_result_MUX_uxn_device_h_l315_c7_b0db_return_output;
     -- result_MUX[uxn_device_h_l310_c2_700c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l310_c2_700c_cond <= VAR_result_MUX_uxn_device_h_l310_c2_700c_cond;
     result_MUX_uxn_device_h_l310_c2_700c_iftrue <= VAR_result_MUX_uxn_device_h_l310_c2_700c_iftrue;
     result_MUX_uxn_device_h_l310_c2_700c_iffalse <= VAR_result_MUX_uxn_device_h_l310_c2_700c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l310_c2_700c_return_output := result_MUX_uxn_device_h_l310_c2_700c_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l310_c2_700c_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l310_c2_700c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
