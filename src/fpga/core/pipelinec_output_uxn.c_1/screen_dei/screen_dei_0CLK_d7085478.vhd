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
-- BIN_OP_EQ[uxn_device_h_l297_c6_ee4e]
signal BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l302_c7_29da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l297_c2_054b]
signal result_MUX_uxn_device_h_l297_c2_054b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l297_c2_054b_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l297_c2_054b_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l297_c2_054b_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l302_c11_97bf]
signal BIN_OP_EQ_uxn_device_h_l302_c11_97bf_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l302_c11_97bf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l302_c11_97bf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l307_c7_4a20]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l302_c7_29da]
signal result_MUX_uxn_device_h_l302_c7_29da_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l302_c7_29da_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l302_c7_29da_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l302_c7_29da_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l307_c11_f689]
signal BIN_OP_EQ_uxn_device_h_l307_c11_f689_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c11_f689_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c11_f689_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l312_c7_7197]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l307_c7_4a20]
signal result_MUX_uxn_device_h_l307_c7_4a20_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l307_c7_4a20_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l307_c7_4a20_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l307_c7_4a20_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l312_c11_c0f6]
signal BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l317_c1_bb2a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l312_c7_7197]
signal result_MUX_uxn_device_h_l312_c7_7197_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l312_c7_7197_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l312_c7_7197_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l312_c7_7197_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l318_c12_9da2]
signal generic_dei_uxn_device_h_l318_c12_9da2_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l318_c12_9da2_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l318_c12_9da2_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l318_c12_9da2_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l318_c12_9da2_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l297_c6_ee4e
BIN_OP_EQ_uxn_device_h_l297_c6_ee4e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_left,
BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_right,
BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_return_output);

-- result_MUX_uxn_device_h_l297_c2_054b
result_MUX_uxn_device_h_l297_c2_054b : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l297_c2_054b_cond,
result_MUX_uxn_device_h_l297_c2_054b_iftrue,
result_MUX_uxn_device_h_l297_c2_054b_iffalse,
result_MUX_uxn_device_h_l297_c2_054b_return_output);

-- BIN_OP_EQ_uxn_device_h_l302_c11_97bf
BIN_OP_EQ_uxn_device_h_l302_c11_97bf : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l302_c11_97bf_left,
BIN_OP_EQ_uxn_device_h_l302_c11_97bf_right,
BIN_OP_EQ_uxn_device_h_l302_c11_97bf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_return_output);

-- result_MUX_uxn_device_h_l302_c7_29da
result_MUX_uxn_device_h_l302_c7_29da : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l302_c7_29da_cond,
result_MUX_uxn_device_h_l302_c7_29da_iftrue,
result_MUX_uxn_device_h_l302_c7_29da_iffalse,
result_MUX_uxn_device_h_l302_c7_29da_return_output);

-- BIN_OP_EQ_uxn_device_h_l307_c11_f689
BIN_OP_EQ_uxn_device_h_l307_c11_f689 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l307_c11_f689_left,
BIN_OP_EQ_uxn_device_h_l307_c11_f689_right,
BIN_OP_EQ_uxn_device_h_l307_c11_f689_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_return_output);

-- result_MUX_uxn_device_h_l307_c7_4a20
result_MUX_uxn_device_h_l307_c7_4a20 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l307_c7_4a20_cond,
result_MUX_uxn_device_h_l307_c7_4a20_iftrue,
result_MUX_uxn_device_h_l307_c7_4a20_iffalse,
result_MUX_uxn_device_h_l307_c7_4a20_return_output);

-- BIN_OP_EQ_uxn_device_h_l312_c11_c0f6
BIN_OP_EQ_uxn_device_h_l312_c11_c0f6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_left,
BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_right,
BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_return_output);

-- result_MUX_uxn_device_h_l312_c7_7197
result_MUX_uxn_device_h_l312_c7_7197 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l312_c7_7197_cond,
result_MUX_uxn_device_h_l312_c7_7197_iftrue,
result_MUX_uxn_device_h_l312_c7_7197_iffalse,
result_MUX_uxn_device_h_l312_c7_7197_return_output);

-- generic_dei_uxn_device_h_l318_c12_9da2
generic_dei_uxn_device_h_l318_c12_9da2 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l318_c12_9da2_CLOCK_ENABLE,
generic_dei_uxn_device_h_l318_c12_9da2_device_address,
generic_dei_uxn_device_h_l318_c12_9da2_phase,
generic_dei_uxn_device_h_l318_c12_9da2_previous_device_ram_read,
generic_dei_uxn_device_h_l318_c12_9da2_return_output);



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
 BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_return_output,
 result_MUX_uxn_device_h_l297_c2_054b_return_output,
 BIN_OP_EQ_uxn_device_h_l302_c11_97bf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_return_output,
 result_MUX_uxn_device_h_l302_c7_29da_return_output,
 BIN_OP_EQ_uxn_device_h_l307_c11_f689_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_return_output,
 result_MUX_uxn_device_h_l307_c7_4a20_return_output,
 BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_return_output,
 result_MUX_uxn_device_h_l312_c7_7197_return_output,
 generic_dei_uxn_device_h_l318_c12_9da2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_41fc_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l297_c2_054b_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l297_c2_054b_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c2_054b_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_29da_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c2_054b_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c2_054b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l298_c3_7ce1 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_97bf_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_97bf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_97bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l302_c7_29da_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l302_c7_29da_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_29da_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_4a20_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_29da_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l303_c3_88bd : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_f689_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_f689_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_f689_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l307_c7_4a20_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l307_c7_4a20_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_4a20_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_7197_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_4a20_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l308_c3_e496 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l312_c7_7197_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l312_c7_7197_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_7197_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_7197_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l313_c3_7c46 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_9da2_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_9da2_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_9da2_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_9da2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_9da2_return_output : device_in_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l308_c3_e496 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_f689_right := to_unsigned(4, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_right := to_unsigned(2, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l313_c3_7c46 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_right := to_unsigned(5, 4);
     VAR_result_device_ram_address_uxn_device_h_l303_c3_88bd := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_97bf_right := to_unsigned(3, 4);
     VAR_result_device_ram_address_uxn_device_h_l298_c3_7ce1 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_iftrue := to_unsigned(0, 1);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l312_c7_7197] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l312_c7_7197_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l313_c3_7c46,
     to_unsigned(240, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l297_c2_054b] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l297_c2_054b_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l298_c3_7ce1,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l307_c7_4a20] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l307_c7_4a20_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l308_c3_e496,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l302_c7_29da] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l302_c7_29da_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l303_c3_88bd,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l302_c7_29da_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l302_c7_29da_return_output;
     VAR_result_MUX_uxn_device_h_l312_c7_7197_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l312_c7_7197_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_4a20_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l307_c7_4a20_return_output;
     VAR_result_MUX_uxn_device_h_l297_c2_054b_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l297_c2_054b_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l318_c12_9da2_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l318_c12_9da2_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l318_c12_9da2_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l296_c16_41fc] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_41fc_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_41fc_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_97bf_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_41fc_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_f689_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_41fc_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_41fc_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_41fc_return_output;
     -- BIN_OP_EQ[uxn_device_h_l297_c6_ee4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_left <= VAR_BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_left;
     BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_right <= VAR_BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_return_output := BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l307_c11_f689] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l307_c11_f689_left <= VAR_BIN_OP_EQ_uxn_device_h_l307_c11_f689_left;
     BIN_OP_EQ_uxn_device_h_l307_c11_f689_right <= VAR_BIN_OP_EQ_uxn_device_h_l307_c11_f689_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_f689_return_output := BIN_OP_EQ_uxn_device_h_l307_c11_f689_return_output;

     -- BIN_OP_EQ[uxn_device_h_l312_c11_c0f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_left <= VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_left;
     BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_right <= VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_return_output := BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l302_c11_97bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l302_c11_97bf_left <= VAR_BIN_OP_EQ_uxn_device_h_l302_c11_97bf_left;
     BIN_OP_EQ_uxn_device_h_l302_c11_97bf_right <= VAR_BIN_OP_EQ_uxn_device_h_l302_c11_97bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_97bf_return_output := BIN_OP_EQ_uxn_device_h_l302_c11_97bf_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_return_output;
     VAR_result_MUX_uxn_device_h_l297_c2_054b_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c6_ee4e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_97bf_return_output;
     VAR_result_MUX_uxn_device_h_l302_c7_29da_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_97bf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_f689_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_4a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_f689_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_return_output;
     VAR_result_MUX_uxn_device_h_l312_c7_7197_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_c0f6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l302_c7_29da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_29da_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l307_c7_4a20] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_4a20_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l312_c7_7197] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_7197_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l317_c1_bb2a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l318_c12_9da2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_bb2a_return_output;
     -- generic_dei[uxn_device_h_l318_c12_9da2] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l318_c12_9da2_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l318_c12_9da2_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l318_c12_9da2_device_address <= VAR_generic_dei_uxn_device_h_l318_c12_9da2_device_address;
     generic_dei_uxn_device_h_l318_c12_9da2_phase <= VAR_generic_dei_uxn_device_h_l318_c12_9da2_phase;
     generic_dei_uxn_device_h_l318_c12_9da2_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l318_c12_9da2_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l318_c12_9da2_return_output := generic_dei_uxn_device_h_l318_c12_9da2_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l312_c7_7197_iffalse := VAR_generic_dei_uxn_device_h_l318_c12_9da2_return_output;
     -- result_MUX[uxn_device_h_l312_c7_7197] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l312_c7_7197_cond <= VAR_result_MUX_uxn_device_h_l312_c7_7197_cond;
     result_MUX_uxn_device_h_l312_c7_7197_iftrue <= VAR_result_MUX_uxn_device_h_l312_c7_7197_iftrue;
     result_MUX_uxn_device_h_l312_c7_7197_iffalse <= VAR_result_MUX_uxn_device_h_l312_c7_7197_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l312_c7_7197_return_output := result_MUX_uxn_device_h_l312_c7_7197_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l307_c7_4a20_iffalse := VAR_result_MUX_uxn_device_h_l312_c7_7197_return_output;
     -- result_MUX[uxn_device_h_l307_c7_4a20] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l307_c7_4a20_cond <= VAR_result_MUX_uxn_device_h_l307_c7_4a20_cond;
     result_MUX_uxn_device_h_l307_c7_4a20_iftrue <= VAR_result_MUX_uxn_device_h_l307_c7_4a20_iftrue;
     result_MUX_uxn_device_h_l307_c7_4a20_iffalse <= VAR_result_MUX_uxn_device_h_l307_c7_4a20_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l307_c7_4a20_return_output := result_MUX_uxn_device_h_l307_c7_4a20_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l302_c7_29da_iffalse := VAR_result_MUX_uxn_device_h_l307_c7_4a20_return_output;
     -- result_MUX[uxn_device_h_l302_c7_29da] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l302_c7_29da_cond <= VAR_result_MUX_uxn_device_h_l302_c7_29da_cond;
     result_MUX_uxn_device_h_l302_c7_29da_iftrue <= VAR_result_MUX_uxn_device_h_l302_c7_29da_iftrue;
     result_MUX_uxn_device_h_l302_c7_29da_iffalse <= VAR_result_MUX_uxn_device_h_l302_c7_29da_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l302_c7_29da_return_output := result_MUX_uxn_device_h_l302_c7_29da_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l297_c2_054b_iffalse := VAR_result_MUX_uxn_device_h_l302_c7_29da_return_output;
     -- result_MUX[uxn_device_h_l297_c2_054b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l297_c2_054b_cond <= VAR_result_MUX_uxn_device_h_l297_c2_054b_cond;
     result_MUX_uxn_device_h_l297_c2_054b_iftrue <= VAR_result_MUX_uxn_device_h_l297_c2_054b_iftrue;
     result_MUX_uxn_device_h_l297_c2_054b_iffalse <= VAR_result_MUX_uxn_device_h_l297_c2_054b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l297_c2_054b_return_output := result_MUX_uxn_device_h_l297_c2_054b_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l297_c2_054b_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l297_c2_054b_return_output;
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
