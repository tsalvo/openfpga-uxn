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
-- BIN_OP_EQ[uxn_device_h_l297_c6_a4ba]
signal BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l302_c7_64b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l297_c2_fc03]
signal result_MUX_uxn_device_h_l297_c2_fc03_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l297_c2_fc03_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l297_c2_fc03_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l297_c2_fc03_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l302_c11_d6e2]
signal BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l307_c7_58da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l302_c7_64b7]
signal result_MUX_uxn_device_h_l302_c7_64b7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l302_c7_64b7_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l302_c7_64b7_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l302_c7_64b7_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l307_c11_8577]
signal BIN_OP_EQ_uxn_device_h_l307_c11_8577_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c11_8577_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l307_c11_8577_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l312_c7_8025]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l307_c7_58da]
signal result_MUX_uxn_device_h_l307_c7_58da_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l307_c7_58da_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l307_c7_58da_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l307_c7_58da_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l312_c11_9de6]
signal BIN_OP_EQ_uxn_device_h_l312_c11_9de6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c11_9de6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l312_c11_9de6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l317_c1_83aa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l312_c7_8025]
signal result_MUX_uxn_device_h_l312_c7_8025_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l312_c7_8025_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l312_c7_8025_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l312_c7_8025_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l318_c12_3c6b]
signal generic_dei_uxn_device_h_l318_c12_3c6b_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l318_c12_3c6b_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l318_c12_3c6b_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l318_c12_3c6b_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l318_c12_3c6b_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l297_c6_a4ba
BIN_OP_EQ_uxn_device_h_l297_c6_a4ba : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_left,
BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_right,
BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_return_output);

-- result_MUX_uxn_device_h_l297_c2_fc03
result_MUX_uxn_device_h_l297_c2_fc03 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l297_c2_fc03_cond,
result_MUX_uxn_device_h_l297_c2_fc03_iftrue,
result_MUX_uxn_device_h_l297_c2_fc03_iffalse,
result_MUX_uxn_device_h_l297_c2_fc03_return_output);

-- BIN_OP_EQ_uxn_device_h_l302_c11_d6e2
BIN_OP_EQ_uxn_device_h_l302_c11_d6e2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_left,
BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_right,
BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_return_output);

-- result_MUX_uxn_device_h_l302_c7_64b7
result_MUX_uxn_device_h_l302_c7_64b7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l302_c7_64b7_cond,
result_MUX_uxn_device_h_l302_c7_64b7_iftrue,
result_MUX_uxn_device_h_l302_c7_64b7_iffalse,
result_MUX_uxn_device_h_l302_c7_64b7_return_output);

-- BIN_OP_EQ_uxn_device_h_l307_c11_8577
BIN_OP_EQ_uxn_device_h_l307_c11_8577 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l307_c11_8577_left,
BIN_OP_EQ_uxn_device_h_l307_c11_8577_right,
BIN_OP_EQ_uxn_device_h_l307_c11_8577_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_return_output);

-- result_MUX_uxn_device_h_l307_c7_58da
result_MUX_uxn_device_h_l307_c7_58da : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l307_c7_58da_cond,
result_MUX_uxn_device_h_l307_c7_58da_iftrue,
result_MUX_uxn_device_h_l307_c7_58da_iffalse,
result_MUX_uxn_device_h_l307_c7_58da_return_output);

-- BIN_OP_EQ_uxn_device_h_l312_c11_9de6
BIN_OP_EQ_uxn_device_h_l312_c11_9de6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l312_c11_9de6_left,
BIN_OP_EQ_uxn_device_h_l312_c11_9de6_right,
BIN_OP_EQ_uxn_device_h_l312_c11_9de6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_return_output);

-- result_MUX_uxn_device_h_l312_c7_8025
result_MUX_uxn_device_h_l312_c7_8025 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l312_c7_8025_cond,
result_MUX_uxn_device_h_l312_c7_8025_iftrue,
result_MUX_uxn_device_h_l312_c7_8025_iffalse,
result_MUX_uxn_device_h_l312_c7_8025_return_output);

-- generic_dei_uxn_device_h_l318_c12_3c6b
generic_dei_uxn_device_h_l318_c12_3c6b : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l318_c12_3c6b_CLOCK_ENABLE,
generic_dei_uxn_device_h_l318_c12_3c6b_device_address,
generic_dei_uxn_device_h_l318_c12_3c6b_phase,
generic_dei_uxn_device_h_l318_c12_3c6b_previous_device_ram_read,
generic_dei_uxn_device_h_l318_c12_3c6b_return_output);



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
 BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_return_output,
 result_MUX_uxn_device_h_l297_c2_fc03_return_output,
 BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_return_output,
 result_MUX_uxn_device_h_l302_c7_64b7_return_output,
 BIN_OP_EQ_uxn_device_h_l307_c11_8577_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_return_output,
 result_MUX_uxn_device_h_l307_c7_58da_return_output,
 BIN_OP_EQ_uxn_device_h_l312_c11_9de6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_return_output,
 result_MUX_uxn_device_h_l312_c7_8025_return_output,
 generic_dei_uxn_device_h_l318_c12_3c6b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_94e4_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l297_c2_fc03_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l297_c2_fc03_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c2_fc03_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_64b7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c2_fc03_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l297_c2_fc03_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l298_c3_dbab : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l302_c7_64b7_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l302_c7_64b7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_64b7_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_58da_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l302_c7_64b7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l303_c3_403c : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_8577_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_8577_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l307_c11_8577_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l307_c7_58da_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l307_c7_58da_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_58da_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_8025_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l307_c7_58da_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l308_c3_75cd : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_9de6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_9de6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l312_c11_9de6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l312_c7_8025_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l312_c7_8025_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_8025_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l312_c7_8025_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l313_c3_0ada : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_3c6b_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_3c6b_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_3c6b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_3c6b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l318_c12_3c6b_return_output : device_in_result_t;
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
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_8577_right := to_unsigned(4, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l298_c3_dbab := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_9de6_right := to_unsigned(5, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_right := to_unsigned(3, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l303_c3_403c := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_right := to_unsigned(2, 4);
     VAR_result_device_ram_address_uxn_device_h_l313_c3_0ada := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l308_c3_75cd := resize(to_unsigned(0, 1), 8);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l302_c7_64b7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l302_c7_64b7_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l303_c3_403c,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l312_c7_8025] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l312_c7_8025_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l313_c3_0ada,
     to_unsigned(240, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l297_c2_fc03] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l297_c2_fc03_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l298_c3_dbab,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l307_c7_58da] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l307_c7_58da_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l308_c3_75cd,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l307_c7_58da_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l307_c7_58da_return_output;
     VAR_result_MUX_uxn_device_h_l312_c7_8025_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l312_c7_8025_return_output;
     VAR_result_MUX_uxn_device_h_l297_c2_fc03_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l297_c2_fc03_return_output;
     VAR_result_MUX_uxn_device_h_l302_c7_64b7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l302_c7_64b7_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l318_c12_3c6b_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l318_c12_3c6b_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l318_c12_3c6b_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l296_c16_94e4] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_94e4_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_94e4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_94e4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_8577_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_94e4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_9de6_left := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_94e4_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l296_c16_94e4_return_output;
     -- BIN_OP_EQ[uxn_device_h_l297_c6_a4ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_left <= VAR_BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_left;
     BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_right <= VAR_BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_return_output := BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_return_output;

     -- BIN_OP_EQ[uxn_device_h_l302_c11_d6e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_left <= VAR_BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_left;
     BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_right <= VAR_BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_return_output := BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l307_c11_8577] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l307_c11_8577_left <= VAR_BIN_OP_EQ_uxn_device_h_l307_c11_8577_left;
     BIN_OP_EQ_uxn_device_h_l307_c11_8577_right <= VAR_BIN_OP_EQ_uxn_device_h_l307_c11_8577_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l307_c11_8577_return_output := BIN_OP_EQ_uxn_device_h_l307_c11_8577_return_output;

     -- BIN_OP_EQ[uxn_device_h_l312_c11_9de6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l312_c11_9de6_left <= VAR_BIN_OP_EQ_uxn_device_h_l312_c11_9de6_left;
     BIN_OP_EQ_uxn_device_h_l312_c11_9de6_right <= VAR_BIN_OP_EQ_uxn_device_h_l312_c11_9de6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l312_c11_9de6_return_output := BIN_OP_EQ_uxn_device_h_l312_c11_9de6_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_return_output;
     VAR_result_MUX_uxn_device_h_l297_c2_fc03_cond := VAR_BIN_OP_EQ_uxn_device_h_l297_c6_a4ba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_return_output;
     VAR_result_MUX_uxn_device_h_l302_c7_64b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l302_c11_d6e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_8577_return_output;
     VAR_result_MUX_uxn_device_h_l307_c7_58da_cond := VAR_BIN_OP_EQ_uxn_device_h_l307_c11_8577_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_9de6_return_output;
     VAR_result_MUX_uxn_device_h_l312_c7_8025_cond := VAR_BIN_OP_EQ_uxn_device_h_l312_c11_9de6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l302_c7_64b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l302_c7_64b7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l307_c7_58da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l307_c7_58da_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l312_c7_8025] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l312_c7_8025_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l317_c1_83aa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l318_c12_3c6b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l317_c1_83aa_return_output;
     -- generic_dei[uxn_device_h_l318_c12_3c6b] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l318_c12_3c6b_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l318_c12_3c6b_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l318_c12_3c6b_device_address <= VAR_generic_dei_uxn_device_h_l318_c12_3c6b_device_address;
     generic_dei_uxn_device_h_l318_c12_3c6b_phase <= VAR_generic_dei_uxn_device_h_l318_c12_3c6b_phase;
     generic_dei_uxn_device_h_l318_c12_3c6b_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l318_c12_3c6b_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l318_c12_3c6b_return_output := generic_dei_uxn_device_h_l318_c12_3c6b_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l312_c7_8025_iffalse := VAR_generic_dei_uxn_device_h_l318_c12_3c6b_return_output;
     -- result_MUX[uxn_device_h_l312_c7_8025] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l312_c7_8025_cond <= VAR_result_MUX_uxn_device_h_l312_c7_8025_cond;
     result_MUX_uxn_device_h_l312_c7_8025_iftrue <= VAR_result_MUX_uxn_device_h_l312_c7_8025_iftrue;
     result_MUX_uxn_device_h_l312_c7_8025_iffalse <= VAR_result_MUX_uxn_device_h_l312_c7_8025_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l312_c7_8025_return_output := result_MUX_uxn_device_h_l312_c7_8025_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l307_c7_58da_iffalse := VAR_result_MUX_uxn_device_h_l312_c7_8025_return_output;
     -- result_MUX[uxn_device_h_l307_c7_58da] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l307_c7_58da_cond <= VAR_result_MUX_uxn_device_h_l307_c7_58da_cond;
     result_MUX_uxn_device_h_l307_c7_58da_iftrue <= VAR_result_MUX_uxn_device_h_l307_c7_58da_iftrue;
     result_MUX_uxn_device_h_l307_c7_58da_iffalse <= VAR_result_MUX_uxn_device_h_l307_c7_58da_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l307_c7_58da_return_output := result_MUX_uxn_device_h_l307_c7_58da_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l302_c7_64b7_iffalse := VAR_result_MUX_uxn_device_h_l307_c7_58da_return_output;
     -- result_MUX[uxn_device_h_l302_c7_64b7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l302_c7_64b7_cond <= VAR_result_MUX_uxn_device_h_l302_c7_64b7_cond;
     result_MUX_uxn_device_h_l302_c7_64b7_iftrue <= VAR_result_MUX_uxn_device_h_l302_c7_64b7_iftrue;
     result_MUX_uxn_device_h_l302_c7_64b7_iffalse <= VAR_result_MUX_uxn_device_h_l302_c7_64b7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l302_c7_64b7_return_output := result_MUX_uxn_device_h_l302_c7_64b7_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l297_c2_fc03_iffalse := VAR_result_MUX_uxn_device_h_l302_c7_64b7_return_output;
     -- result_MUX[uxn_device_h_l297_c2_fc03] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l297_c2_fc03_cond <= VAR_result_MUX_uxn_device_h_l297_c2_fc03_cond;
     result_MUX_uxn_device_h_l297_c2_fc03_iftrue <= VAR_result_MUX_uxn_device_h_l297_c2_fc03_iftrue;
     result_MUX_uxn_device_h_l297_c2_fc03_iffalse <= VAR_result_MUX_uxn_device_h_l297_c2_fc03_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l297_c2_fc03_return_output := result_MUX_uxn_device_h_l297_c2_fc03_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l297_c2_fc03_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l297_c2_fc03_return_output;
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
