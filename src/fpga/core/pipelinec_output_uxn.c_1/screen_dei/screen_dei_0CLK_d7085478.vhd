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
-- BIN_OP_EQ[uxn_device_h_l297_c6_fb89]
signal BIN_OP_EQ_uxn_device_h_l297_c6_fb89_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l297_c6_fb89_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l297_c6_fb89_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l302_c7_fc4c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l297_c2_83be]
signal result_MUX_uxn_device_h_l297_c2_83be_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l297_c2_83be_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l297_c2_83be_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l297_c2_83be_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l302_c11_db19]
signal BIN_OP_EQ_uxn_device_h_l302_c11_db19_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l302_c11_db19_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l302_c11_db19_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l307_c7_cc89]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l302_c7_fc4c]
signal result_MUX_uxn_device_h_l302_c7_fc4c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l302_c7_fc4c_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l302_c7_fc4c_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l302_c7_fc4c_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l307_c11_a9cc]
signal BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l312_c7_dc6c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l307_c7_cc89]
signal result_MUX_uxn_device_h_l307_c7_cc89_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l307_c7_cc89_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l307_c7_cc89_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l307_c7_cc89_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l312_c11_2494]
signal BIN_OP_EQ_uxn_device_h_l312_c11_2494_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c11_2494_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c11_2494_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l317_c1_651b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l312_c7_dc6c]
signal result_MUX_uxn_device_h_l312_c7_dc6c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l312_c7_dc6c_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l312_c7_dc6c_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l312_c7_dc6c_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l318_c12_1818]
signal generic_dei_uxn_device_h_l318_c12_1818_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l318_c12_1818_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l318_c12_1818_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l318_c12_1818_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l318_c12_1818_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l297_c6_fb89
BIN_OP_EQ_uxn_device_h_l297_c6_fb89 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l297_c6_fb89_left,
BIN_OP_EQ_uxn_device_h_l297_c6_fb89_right,
BIN_OP_EQ_uxn_device_h_l297_c6_fb89_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_return_output);

-- result_MUX_uxn_device_h_l297_c2_83be
result_MUX_uxn_device_h_l297_c2_83be : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l297_c2_83be_cond,
result_MUX_uxn_device_h_l297_c2_83be_iftrue,
result_MUX_uxn_device_h_l297_c2_83be_iffalse,
result_MUX_uxn_device_h_l297_c2_83be_return_output);

-- BIN_OP_EQ_uxn_device_h_l302_c11_db19
BIN_OP_EQ_uxn_device_h_l302_c11_db19 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l302_c11_db19_left,
BIN_OP_EQ_uxn_device_h_l302_c11_db19_right,
BIN_OP_EQ_uxn_device_h_l302_c11_db19_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_return_output);

-- result_MUX_uxn_device_h_l302_c7_fc4c
result_MUX_uxn_device_h_l302_c7_fc4c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l302_c7_fc4c_cond,
result_MUX_uxn_device_h_l302_c7_fc4c_iftrue,
result_MUX_uxn_device_h_l302_c7_fc4c_iffalse,
result_MUX_uxn_device_h_l302_c7_fc4c_return_output);

-- BIN_OP_EQ_uxn_device_h_l307_c11_a9cc
BIN_OP_EQ_uxn_device_h_l307_c11_a9cc : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_left,
BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_right,
BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_return_output);

-- result_MUX_uxn_device_h_l307_c7_cc89
result_MUX_uxn_device_h_l307_c7_cc89 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l307_c7_cc89_cond,
result_MUX_uxn_device_h_l307_c7_cc89_iftrue,
result_MUX_uxn_device_h_l307_c7_cc89_iffalse,
result_MUX_uxn_device_h_l307_c7_cc89_return_output);

-- BIN_OP_EQ_uxn_device_h_l312_c11_2494
BIN_OP_EQ_uxn_device_h_l312_c11_2494 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l312_c11_2494_left,
BIN_OP_EQ_uxn_device_h_l312_c11_2494_right,
BIN_OP_EQ_uxn_device_h_l312_c11_2494_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_return_output);

-- result_MUX_uxn_device_h_l312_c7_dc6c
result_MUX_uxn_device_h_l312_c7_dc6c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l312_c7_dc6c_cond,
result_MUX_uxn_device_h_l312_c7_dc6c_iftrue,
result_MUX_uxn_device_h_l312_c7_dc6c_iffalse,
result_MUX_uxn_device_h_l312_c7_dc6c_return_output);

-- generic_dei_uxn_device_h_l318_c12_1818
generic_dei_uxn_device_h_l318_c12_1818 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l318_c12_1818_CLOCK_ENABLE,
generic_dei_uxn_device_h_l318_c12_1818_device_address,
generic_dei_uxn_device_h_l318_c12_1818_phase,
generic_dei_uxn_device_h_l318_c12_1818_previous_device_ram_read,
generic_dei_uxn_device_h_l318_c12_1818_return_output);



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
 BIN_OP_EQ_uxn_device_h_l297_c6_fb89_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_return_output,
 result_MUX_uxn_device_h_l297_c2_83be_return_output,
 BIN_OP_EQ_uxn_device_h_l302_c11_db19_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_return_output,
 result_MUX_uxn_device_h_l302_c7_fc4c_return_output,
 BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_return_output,
 result_MUX_uxn_device_h_l307_c7_cc89_return_output,
 BIN_OP_EQ_uxn_device_h_l312_c11_2494_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_return_output,
 result_MUX_uxn_device_h_l312_c7_dc6c_return_output,
 generic_dei_uxn_device_h_l318_c12_1818_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_a4f8_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c6_fb89_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c6_fb89_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c6_fb89_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l297_c2_83be_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l297_c2_83be_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c2_83be_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_fc4c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c2_83be_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c2_83be_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l298_c3_7d4e : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_db19_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_db19_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_db19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l302_c7_fc4c_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l302_c7_fc4c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_fc4c_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_cc89_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_fc4c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l303_c3_165a : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l307_c7_cc89_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l307_c7_cc89_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_cc89_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_dc6c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_cc89_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l308_c3_20d1 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_2494_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_2494_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_2494_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l312_c7_dc6c_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l312_c7_dc6c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_dc6c_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_dc6c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l313_c3_8a5f : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_1818_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_1818_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_1818_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_1818_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_1818_return_output : device_in_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_2494_right := to_unsigned(5, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l297_c6_fb89_right := to_unsigned(2, 4);
     VAR_result_device_ram_address_uxn_device_h_l298_c3_7d4e := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_right := to_unsigned(4, 4);
     VAR_result_device_ram_address_uxn_device_h_l313_c3_8a5f := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l308_c3_20d1 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l303_c3_165a := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_db19_right := to_unsigned(3, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_iftrue := to_unsigned(0, 1);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l297_c2_83be] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l297_c2_83be_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l298_c3_7d4e,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l307_c7_cc89] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l307_c7_cc89_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l308_c3_20d1,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l302_c7_fc4c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l302_c7_fc4c_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l303_c3_165a,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l312_c7_dc6c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l312_c7_dc6c_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l313_c3_8a5f,
     to_unsigned(240, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l312_c7_dc6c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l312_c7_dc6c_return_output;
     VAR_result_MUX_uxn_device_h_l302_c7_fc4c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l302_c7_fc4c_return_output;
     VAR_result_MUX_uxn_device_h_l297_c2_83be_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l297_c2_83be_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_cc89_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l307_c7_cc89_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l318_c12_1818_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l318_c12_1818_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l318_c12_1818_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l296_c16_a4f8] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_a4f8_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l297_c6_fb89_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_a4f8_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_db19_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_a4f8_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_a4f8_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_2494_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_a4f8_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_a4f8_return_output;
     -- BIN_OP_EQ[uxn_device_h_l297_c6_fb89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l297_c6_fb89_left <= VAR_BIN_OP_EQ_uxn_device_h_l297_c6_fb89_left;
     BIN_OP_EQ_uxn_device_h_l297_c6_fb89_right <= VAR_BIN_OP_EQ_uxn_device_h_l297_c6_fb89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l297_c6_fb89_return_output := BIN_OP_EQ_uxn_device_h_l297_c6_fb89_return_output;

     -- BIN_OP_EQ[uxn_device_h_l312_c11_2494] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l312_c11_2494_left <= VAR_BIN_OP_EQ_uxn_device_h_l312_c11_2494_left;
     BIN_OP_EQ_uxn_device_h_l312_c11_2494_right <= VAR_BIN_OP_EQ_uxn_device_h_l312_c11_2494_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_2494_return_output := BIN_OP_EQ_uxn_device_h_l312_c11_2494_return_output;

     -- BIN_OP_EQ[uxn_device_h_l302_c11_db19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l302_c11_db19_left <= VAR_BIN_OP_EQ_uxn_device_h_l302_c11_db19_left;
     BIN_OP_EQ_uxn_device_h_l302_c11_db19_right <= VAR_BIN_OP_EQ_uxn_device_h_l302_c11_db19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_db19_return_output := BIN_OP_EQ_uxn_device_h_l302_c11_db19_return_output;

     -- BIN_OP_EQ[uxn_device_h_l307_c11_a9cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_left <= VAR_BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_left;
     BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_right <= VAR_BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_return_output := BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c6_fb89_return_output;
     VAR_result_MUX_uxn_device_h_l297_c2_83be_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c6_fb89_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_db19_return_output;
     VAR_result_MUX_uxn_device_h_l302_c7_fc4c_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_db19_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_cc89_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_a9cc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_2494_return_output;
     VAR_result_MUX_uxn_device_h_l312_c7_dc6c_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_2494_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l302_c7_fc4c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_fc4c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l307_c7_cc89] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_cc89_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l312_c7_dc6c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_dc6c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l317_c1_651b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l318_c12_1818_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_651b_return_output;
     -- generic_dei[uxn_device_h_l318_c12_1818] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l318_c12_1818_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l318_c12_1818_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l318_c12_1818_device_address <= VAR_generic_dei_uxn_device_h_l318_c12_1818_device_address;
     generic_dei_uxn_device_h_l318_c12_1818_phase <= VAR_generic_dei_uxn_device_h_l318_c12_1818_phase;
     generic_dei_uxn_device_h_l318_c12_1818_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l318_c12_1818_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l318_c12_1818_return_output := generic_dei_uxn_device_h_l318_c12_1818_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l312_c7_dc6c_iffalse := VAR_generic_dei_uxn_device_h_l318_c12_1818_return_output;
     -- result_MUX[uxn_device_h_l312_c7_dc6c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l312_c7_dc6c_cond <= VAR_result_MUX_uxn_device_h_l312_c7_dc6c_cond;
     result_MUX_uxn_device_h_l312_c7_dc6c_iftrue <= VAR_result_MUX_uxn_device_h_l312_c7_dc6c_iftrue;
     result_MUX_uxn_device_h_l312_c7_dc6c_iffalse <= VAR_result_MUX_uxn_device_h_l312_c7_dc6c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l312_c7_dc6c_return_output := result_MUX_uxn_device_h_l312_c7_dc6c_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l307_c7_cc89_iffalse := VAR_result_MUX_uxn_device_h_l312_c7_dc6c_return_output;
     -- result_MUX[uxn_device_h_l307_c7_cc89] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l307_c7_cc89_cond <= VAR_result_MUX_uxn_device_h_l307_c7_cc89_cond;
     result_MUX_uxn_device_h_l307_c7_cc89_iftrue <= VAR_result_MUX_uxn_device_h_l307_c7_cc89_iftrue;
     result_MUX_uxn_device_h_l307_c7_cc89_iffalse <= VAR_result_MUX_uxn_device_h_l307_c7_cc89_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l307_c7_cc89_return_output := result_MUX_uxn_device_h_l307_c7_cc89_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l302_c7_fc4c_iffalse := VAR_result_MUX_uxn_device_h_l307_c7_cc89_return_output;
     -- result_MUX[uxn_device_h_l302_c7_fc4c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l302_c7_fc4c_cond <= VAR_result_MUX_uxn_device_h_l302_c7_fc4c_cond;
     result_MUX_uxn_device_h_l302_c7_fc4c_iftrue <= VAR_result_MUX_uxn_device_h_l302_c7_fc4c_iftrue;
     result_MUX_uxn_device_h_l302_c7_fc4c_iffalse <= VAR_result_MUX_uxn_device_h_l302_c7_fc4c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l302_c7_fc4c_return_output := result_MUX_uxn_device_h_l302_c7_fc4c_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l297_c2_83be_iffalse := VAR_result_MUX_uxn_device_h_l302_c7_fc4c_return_output;
     -- result_MUX[uxn_device_h_l297_c2_83be] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l297_c2_83be_cond <= VAR_result_MUX_uxn_device_h_l297_c2_83be_cond;
     result_MUX_uxn_device_h_l297_c2_83be_iftrue <= VAR_result_MUX_uxn_device_h_l297_c2_83be_iftrue;
     result_MUX_uxn_device_h_l297_c2_83be_iffalse <= VAR_result_MUX_uxn_device_h_l297_c2_83be_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l297_c2_83be_return_output := result_MUX_uxn_device_h_l297_c2_83be_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l297_c2_83be_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l297_c2_83be_return_output;
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
