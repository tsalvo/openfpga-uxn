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
-- BIN_OP_EQ[uxn_device_h_l490_c6_82b5]
signal BIN_OP_EQ_uxn_device_h_l490_c6_82b5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l490_c6_82b5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l490_c6_82b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l495_c7_00bb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l490_c2_5e05]
signal result_MUX_uxn_device_h_l490_c2_5e05_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l490_c2_5e05_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l490_c2_5e05_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l490_c2_5e05_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l495_c11_ed36]
signal BIN_OP_EQ_uxn_device_h_l495_c11_ed36_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l495_c11_ed36_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l495_c11_ed36_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l500_c7_1b5c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l495_c7_00bb]
signal result_MUX_uxn_device_h_l495_c7_00bb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l495_c7_00bb_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l495_c7_00bb_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l495_c7_00bb_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l500_c11_26e2]
signal BIN_OP_EQ_uxn_device_h_l500_c11_26e2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l500_c11_26e2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l500_c11_26e2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l505_c7_f8f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l500_c7_1b5c]
signal result_MUX_uxn_device_h_l500_c7_1b5c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l500_c7_1b5c_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l500_c7_1b5c_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l500_c7_1b5c_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l505_c11_72aa]
signal BIN_OP_EQ_uxn_device_h_l505_c11_72aa_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l505_c11_72aa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l505_c11_72aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l510_c1_bdce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l505_c7_f8f0]
signal result_MUX_uxn_device_h_l505_c7_f8f0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l505_c7_f8f0_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l505_c7_f8f0_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l505_c7_f8f0_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l511_c12_f8a2]
signal generic_dei_uxn_device_h_l511_c12_f8a2_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l511_c12_f8a2_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l511_c12_f8a2_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l511_c12_f8a2_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l511_c12_f8a2_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l490_c6_82b5
BIN_OP_EQ_uxn_device_h_l490_c6_82b5 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l490_c6_82b5_left,
BIN_OP_EQ_uxn_device_h_l490_c6_82b5_right,
BIN_OP_EQ_uxn_device_h_l490_c6_82b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_return_output);

-- result_MUX_uxn_device_h_l490_c2_5e05
result_MUX_uxn_device_h_l490_c2_5e05 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l490_c2_5e05_cond,
result_MUX_uxn_device_h_l490_c2_5e05_iftrue,
result_MUX_uxn_device_h_l490_c2_5e05_iffalse,
result_MUX_uxn_device_h_l490_c2_5e05_return_output);

-- BIN_OP_EQ_uxn_device_h_l495_c11_ed36
BIN_OP_EQ_uxn_device_h_l495_c11_ed36 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l495_c11_ed36_left,
BIN_OP_EQ_uxn_device_h_l495_c11_ed36_right,
BIN_OP_EQ_uxn_device_h_l495_c11_ed36_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_return_output);

-- result_MUX_uxn_device_h_l495_c7_00bb
result_MUX_uxn_device_h_l495_c7_00bb : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l495_c7_00bb_cond,
result_MUX_uxn_device_h_l495_c7_00bb_iftrue,
result_MUX_uxn_device_h_l495_c7_00bb_iffalse,
result_MUX_uxn_device_h_l495_c7_00bb_return_output);

-- BIN_OP_EQ_uxn_device_h_l500_c11_26e2
BIN_OP_EQ_uxn_device_h_l500_c11_26e2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l500_c11_26e2_left,
BIN_OP_EQ_uxn_device_h_l500_c11_26e2_right,
BIN_OP_EQ_uxn_device_h_l500_c11_26e2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_return_output);

-- result_MUX_uxn_device_h_l500_c7_1b5c
result_MUX_uxn_device_h_l500_c7_1b5c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l500_c7_1b5c_cond,
result_MUX_uxn_device_h_l500_c7_1b5c_iftrue,
result_MUX_uxn_device_h_l500_c7_1b5c_iffalse,
result_MUX_uxn_device_h_l500_c7_1b5c_return_output);

-- BIN_OP_EQ_uxn_device_h_l505_c11_72aa
BIN_OP_EQ_uxn_device_h_l505_c11_72aa : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l505_c11_72aa_left,
BIN_OP_EQ_uxn_device_h_l505_c11_72aa_right,
BIN_OP_EQ_uxn_device_h_l505_c11_72aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_return_output);

-- result_MUX_uxn_device_h_l505_c7_f8f0
result_MUX_uxn_device_h_l505_c7_f8f0 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l505_c7_f8f0_cond,
result_MUX_uxn_device_h_l505_c7_f8f0_iftrue,
result_MUX_uxn_device_h_l505_c7_f8f0_iffalse,
result_MUX_uxn_device_h_l505_c7_f8f0_return_output);

-- generic_dei_uxn_device_h_l511_c12_f8a2
generic_dei_uxn_device_h_l511_c12_f8a2 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l511_c12_f8a2_CLOCK_ENABLE,
generic_dei_uxn_device_h_l511_c12_f8a2_device_address,
generic_dei_uxn_device_h_l511_c12_f8a2_phase,
generic_dei_uxn_device_h_l511_c12_f8a2_previous_device_ram_read,
generic_dei_uxn_device_h_l511_c12_f8a2_return_output);



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
 BIN_OP_EQ_uxn_device_h_l490_c6_82b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_return_output,
 result_MUX_uxn_device_h_l490_c2_5e05_return_output,
 BIN_OP_EQ_uxn_device_h_l495_c11_ed36_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_return_output,
 result_MUX_uxn_device_h_l495_c7_00bb_return_output,
 BIN_OP_EQ_uxn_device_h_l500_c11_26e2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_return_output,
 result_MUX_uxn_device_h_l500_c7_1b5c_return_output,
 BIN_OP_EQ_uxn_device_h_l505_c11_72aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_return_output,
 result_MUX_uxn_device_h_l505_c7_f8f0_return_output,
 generic_dei_uxn_device_h_l511_c12_f8a2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l489_c16_509d_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l490_c6_82b5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l490_c6_82b5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l490_c6_82b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l490_c2_5e05_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l490_c2_5e05_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l490_c2_5e05_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l495_c7_00bb_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l490_c2_5e05_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l490_c2_5e05_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l491_c3_9334 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l495_c11_ed36_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l495_c11_ed36_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l495_c11_ed36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l495_c7_00bb_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l495_c7_00bb_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l495_c7_00bb_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l500_c7_1b5c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l495_c7_00bb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l496_c3_21a6 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l500_c11_26e2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l500_c11_26e2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l500_c11_26e2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l500_c7_1b5c_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l500_c7_1b5c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l500_c7_1b5c_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l505_c7_f8f0_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l500_c7_1b5c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l501_c3_352e : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l505_c11_72aa_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l505_c11_72aa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l505_c11_72aa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l505_c7_f8f0_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l505_c7_f8f0_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l505_c7_f8f0_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l505_c7_f8f0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l506_c3_b12e : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l511_c12_f8a2_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l511_c12_f8a2_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l511_c12_f8a2_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l511_c12_f8a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l511_c12_f8a2_return_output : device_in_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l500_c11_26e2_right := to_unsigned(4, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l490_c6_82b5_right := to_unsigned(2, 4);
     VAR_result_device_ram_address_uxn_device_h_l491_c3_9334 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l496_c3_21a6 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l495_c11_ed36_right := to_unsigned(3, 4);
     VAR_result_device_ram_address_uxn_device_h_l506_c3_b12e := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l501_c3_352e := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l505_c11_72aa_right := to_unsigned(5, 4);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l500_c7_1b5c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l500_c7_1b5c_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l501_c3_352e,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l490_c2_5e05] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l490_c2_5e05_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l491_c3_9334,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l495_c7_00bb] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l495_c7_00bb_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l496_c3_21a6,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l505_c7_f8f0] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l505_c7_f8f0_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l506_c3_b12e,
     to_unsigned(240, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l500_c7_1b5c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l500_c7_1b5c_return_output;
     VAR_result_MUX_uxn_device_h_l495_c7_00bb_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l495_c7_00bb_return_output;
     VAR_result_MUX_uxn_device_h_l490_c2_5e05_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l490_c2_5e05_return_output;
     VAR_result_MUX_uxn_device_h_l505_c7_f8f0_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l505_c7_f8f0_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l511_c12_f8a2_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l511_c12_f8a2_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l511_c12_f8a2_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l489_c16_509d] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l489_c16_509d_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l490_c6_82b5_left := VAR_CAST_TO_uint4_t_uxn_device_h_l489_c16_509d_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l495_c11_ed36_left := VAR_CAST_TO_uint4_t_uxn_device_h_l489_c16_509d_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l500_c11_26e2_left := VAR_CAST_TO_uint4_t_uxn_device_h_l489_c16_509d_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l505_c11_72aa_left := VAR_CAST_TO_uint4_t_uxn_device_h_l489_c16_509d_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l489_c16_509d_return_output;
     -- BIN_OP_EQ[uxn_device_h_l505_c11_72aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l505_c11_72aa_left <= VAR_BIN_OP_EQ_uxn_device_h_l505_c11_72aa_left;
     BIN_OP_EQ_uxn_device_h_l505_c11_72aa_right <= VAR_BIN_OP_EQ_uxn_device_h_l505_c11_72aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l505_c11_72aa_return_output := BIN_OP_EQ_uxn_device_h_l505_c11_72aa_return_output;

     -- BIN_OP_EQ[uxn_device_h_l490_c6_82b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l490_c6_82b5_left <= VAR_BIN_OP_EQ_uxn_device_h_l490_c6_82b5_left;
     BIN_OP_EQ_uxn_device_h_l490_c6_82b5_right <= VAR_BIN_OP_EQ_uxn_device_h_l490_c6_82b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l490_c6_82b5_return_output := BIN_OP_EQ_uxn_device_h_l490_c6_82b5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l495_c11_ed36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l495_c11_ed36_left <= VAR_BIN_OP_EQ_uxn_device_h_l495_c11_ed36_left;
     BIN_OP_EQ_uxn_device_h_l495_c11_ed36_right <= VAR_BIN_OP_EQ_uxn_device_h_l495_c11_ed36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l495_c11_ed36_return_output := BIN_OP_EQ_uxn_device_h_l495_c11_ed36_return_output;

     -- BIN_OP_EQ[uxn_device_h_l500_c11_26e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l500_c11_26e2_left <= VAR_BIN_OP_EQ_uxn_device_h_l500_c11_26e2_left;
     BIN_OP_EQ_uxn_device_h_l500_c11_26e2_right <= VAR_BIN_OP_EQ_uxn_device_h_l500_c11_26e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l500_c11_26e2_return_output := BIN_OP_EQ_uxn_device_h_l500_c11_26e2_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l490_c6_82b5_return_output;
     VAR_result_MUX_uxn_device_h_l490_c2_5e05_cond := VAR_BIN_OP_EQ_uxn_device_h_l490_c6_82b5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_cond := VAR_BIN_OP_EQ_uxn_device_h_l495_c11_ed36_return_output;
     VAR_result_MUX_uxn_device_h_l495_c7_00bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l495_c11_ed36_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l500_c11_26e2_return_output;
     VAR_result_MUX_uxn_device_h_l500_c7_1b5c_cond := VAR_BIN_OP_EQ_uxn_device_h_l500_c11_26e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_cond := VAR_BIN_OP_EQ_uxn_device_h_l505_c11_72aa_return_output;
     VAR_result_MUX_uxn_device_h_l505_c7_f8f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l505_c11_72aa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l495_c7_00bb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l495_c7_00bb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l500_c7_1b5c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l500_c7_1b5c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l505_c7_f8f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l505_c7_f8f0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l510_c1_bdce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l511_c12_f8a2_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l510_c1_bdce_return_output;
     -- generic_dei[uxn_device_h_l511_c12_f8a2] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l511_c12_f8a2_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l511_c12_f8a2_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l511_c12_f8a2_device_address <= VAR_generic_dei_uxn_device_h_l511_c12_f8a2_device_address;
     generic_dei_uxn_device_h_l511_c12_f8a2_phase <= VAR_generic_dei_uxn_device_h_l511_c12_f8a2_phase;
     generic_dei_uxn_device_h_l511_c12_f8a2_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l511_c12_f8a2_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l511_c12_f8a2_return_output := generic_dei_uxn_device_h_l511_c12_f8a2_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l505_c7_f8f0_iffalse := VAR_generic_dei_uxn_device_h_l511_c12_f8a2_return_output;
     -- result_MUX[uxn_device_h_l505_c7_f8f0] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l505_c7_f8f0_cond <= VAR_result_MUX_uxn_device_h_l505_c7_f8f0_cond;
     result_MUX_uxn_device_h_l505_c7_f8f0_iftrue <= VAR_result_MUX_uxn_device_h_l505_c7_f8f0_iftrue;
     result_MUX_uxn_device_h_l505_c7_f8f0_iffalse <= VAR_result_MUX_uxn_device_h_l505_c7_f8f0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l505_c7_f8f0_return_output := result_MUX_uxn_device_h_l505_c7_f8f0_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l500_c7_1b5c_iffalse := VAR_result_MUX_uxn_device_h_l505_c7_f8f0_return_output;
     -- result_MUX[uxn_device_h_l500_c7_1b5c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l500_c7_1b5c_cond <= VAR_result_MUX_uxn_device_h_l500_c7_1b5c_cond;
     result_MUX_uxn_device_h_l500_c7_1b5c_iftrue <= VAR_result_MUX_uxn_device_h_l500_c7_1b5c_iftrue;
     result_MUX_uxn_device_h_l500_c7_1b5c_iffalse <= VAR_result_MUX_uxn_device_h_l500_c7_1b5c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l500_c7_1b5c_return_output := result_MUX_uxn_device_h_l500_c7_1b5c_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l495_c7_00bb_iffalse := VAR_result_MUX_uxn_device_h_l500_c7_1b5c_return_output;
     -- result_MUX[uxn_device_h_l495_c7_00bb] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l495_c7_00bb_cond <= VAR_result_MUX_uxn_device_h_l495_c7_00bb_cond;
     result_MUX_uxn_device_h_l495_c7_00bb_iftrue <= VAR_result_MUX_uxn_device_h_l495_c7_00bb_iftrue;
     result_MUX_uxn_device_h_l495_c7_00bb_iffalse <= VAR_result_MUX_uxn_device_h_l495_c7_00bb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l495_c7_00bb_return_output := result_MUX_uxn_device_h_l495_c7_00bb_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l490_c2_5e05_iffalse := VAR_result_MUX_uxn_device_h_l495_c7_00bb_return_output;
     -- result_MUX[uxn_device_h_l490_c2_5e05] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l490_c2_5e05_cond <= VAR_result_MUX_uxn_device_h_l490_c2_5e05_cond;
     result_MUX_uxn_device_h_l490_c2_5e05_iftrue <= VAR_result_MUX_uxn_device_h_l490_c2_5e05_iftrue;
     result_MUX_uxn_device_h_l490_c2_5e05_iffalse <= VAR_result_MUX_uxn_device_h_l490_c2_5e05_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l490_c2_5e05_return_output := result_MUX_uxn_device_h_l490_c2_5e05_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l490_c2_5e05_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l490_c2_5e05_return_output;
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
