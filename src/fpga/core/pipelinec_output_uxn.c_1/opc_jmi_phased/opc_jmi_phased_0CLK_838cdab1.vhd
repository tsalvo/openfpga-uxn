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
entity opc_jmi_phased_0CLK_838cdab1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(3 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jmi_phased_0CLK_838cdab1;
architecture arch of opc_jmi_phased_0CLK_838cdab1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16a : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16b : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_tmp16a : unsigned(15 downto 0);
signal REG_COMB_tmp16b : unsigned(15 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l55_c6_5552]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l55_c1_2389]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l59_c9_bd38]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output : unsigned(0 downto 0);

-- tmp16a_MUX[uxn_opcodes_phased_h_l55_c2_2055]
signal tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond : unsigned(0 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l55_c2_2055]
signal result_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_opcodes_phased_h_l55_c2_2055]
signal tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l57_c12_dcf0]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_return_output : unsigned(16 downto 0);

-- peek2_ram[uxn_opcodes_phased_h_l58_c12_edd4]
signal peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l59_c13_9747]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l59_c1_2a93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l59_c9_bd38]
signal result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_opcodes_phased_h_l59_c9_bd38]
signal tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output : unsigned(15 downto 0);

-- peek2_ram[uxn_opcodes_phased_h_l60_c12_529f]
signal peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l61_c10_9ba3]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_return_output : unsigned(16 downto 0);

-- pc_set[uxn_opcodes_phased_h_l61_c3_4121]
signal pc_set_uxn_opcodes_phased_h_l61_c3_4121_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_opcodes_phased_h_l61_c3_4121_value : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l62_c13_78c2]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l62_c9_6cd9]
signal result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552
BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output);

-- tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055
tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond,
tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue,
tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse,
tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output);

-- result_MUX_uxn_opcodes_phased_h_l55_c2_2055
result_MUX_uxn_opcodes_phased_h_l55_c2_2055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond,
result_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue,
result_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse,
result_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output);

-- tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055
tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond,
tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue,
tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse,
tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0
BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_return_output);

-- peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4
peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4 : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_address,
peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747
BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_return_output);

-- result_MUX_uxn_opcodes_phased_h_l59_c9_bd38
result_MUX_uxn_opcodes_phased_h_l59_c9_bd38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond,
result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue,
result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse,
result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output);

-- tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38
tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond,
tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue,
tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse,
tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output);

-- peek2_ram_uxn_opcodes_phased_h_l60_c12_529f
peek2_ram_uxn_opcodes_phased_h_l60_c12_529f : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_address,
peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3
BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_return_output);

-- pc_set_uxn_opcodes_phased_h_l61_c3_4121
pc_set_uxn_opcodes_phased_h_l61_c3_4121 : entity work.pc_set_0CLK_de264c78 port map (
pc_set_uxn_opcodes_phased_h_l61_c3_4121_CLOCK_ENABLE,
pc_set_uxn_opcodes_phased_h_l61_c3_4121_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2
BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_return_output);

-- result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9
result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_cond,
result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_iftrue,
result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_iffalse,
result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 sp,
 -- Registers
 tmp16a,
 tmp16b,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output,
 tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output,
 result_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output,
 tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_return_output,
 peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_return_output,
 result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output,
 tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output,
 peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_return_output,
 result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(3 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16a_uxn_opcodes_phased_h_l57_c3_933f : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_return_output : unsigned(16 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_address : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_address : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_return_output : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_opcodes_phased_h_l61_c3_4121_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_return_output : unsigned(16 downto 0);
 variable VAR_pc_set_uxn_opcodes_phased_h_l61_c3_4121_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp16a : unsigned(15 downto 0);
variable REG_VAR_tmp16b : unsigned(15 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16a := tmp16a;
  REG_VAR_tmp16b := tmp16b;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_right := to_unsigned(2, 2);
     VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_sp := sp;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_left := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_iffalse := result;
     VAR_peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_address := tmp16a;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse := tmp16a;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse := tmp16b;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l55_c6_5552] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l57_c12_dcf0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l59_c13_9747] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l62_c13_78c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l55_c6_5552_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l59_c13_9747_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l62_c13_78c2_return_output;
     VAR_tmp16a_uxn_opcodes_phased_h_l57_c3_933f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l57_c12_dcf0_return_output, 16);
     VAR_peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_address := VAR_tmp16a_uxn_opcodes_phased_h_l57_c3_933f;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue := VAR_tmp16a_uxn_opcodes_phased_h_l57_c3_933f;
     -- tmp16a_MUX[uxn_opcodes_phased_h_l55_c2_2055] LATENCY=0
     -- Inputs
     tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond;
     tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue;
     tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse;
     -- Outputs
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output := tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l59_c9_bd38] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l55_c1_2389] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l62_c9_6cd9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_cond;
     result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_iftrue;
     result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_return_output := result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output;
     VAR_peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l55_c1_2389_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l62_c9_6cd9_return_output;
     REG_VAR_tmp16a := VAR_tmp16a_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output;
     -- peek2_ram[uxn_opcodes_phased_h_l58_c12_edd4] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_address <= VAR_peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_return_output := peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l59_c1_2a93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l59_c9_bd38] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond;
     result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue;
     result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output := result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output;

     -- Submodule level 3
     VAR_pc_set_uxn_opcodes_phased_h_l61_c3_4121_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_return_output;
     VAR_peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l59_c1_2a93_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue := VAR_peek2_ram_uxn_opcodes_phased_h_l58_c12_edd4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output;
     -- peek2_ram[uxn_opcodes_phased_h_l60_c12_529f] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_address <= VAR_peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_return_output := peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l55_c2_2055] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond;
     result_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue;
     result_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output := result_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output;

     -- Submodule level 4
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_right := VAR_peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue := VAR_peek2_ram_uxn_opcodes_phased_h_l60_c12_529f_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l61_c10_9ba3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_return_output;

     -- tmp16b_MUX[uxn_opcodes_phased_h_l59_c9_bd38] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_cond;
     tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iftrue;
     tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output := tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output;

     -- Submodule level 5
     VAR_pc_set_uxn_opcodes_phased_h_l61_c3_4121_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l61_c10_9ba3_return_output, 16);
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse := VAR_tmp16b_MUX_uxn_opcodes_phased_h_l59_c9_bd38_return_output;
     -- tmp16b_MUX[uxn_opcodes_phased_h_l55_c2_2055] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_cond;
     tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_iftrue;
     tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output := tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output;

     -- pc_set[uxn_opcodes_phased_h_l61_c3_4121] LATENCY=0
     -- Clock enable
     pc_set_uxn_opcodes_phased_h_l61_c3_4121_CLOCK_ENABLE <= VAR_pc_set_uxn_opcodes_phased_h_l61_c3_4121_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_opcodes_phased_h_l61_c3_4121_value <= VAR_pc_set_uxn_opcodes_phased_h_l61_c3_4121_value;
     -- Outputs

     -- Submodule level 6
     REG_VAR_tmp16b := VAR_tmp16b_MUX_uxn_opcodes_phased_h_l55_c2_2055_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16a <= REG_VAR_tmp16a;
REG_COMB_tmp16b <= REG_VAR_tmp16b;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16a <= REG_COMB_tmp16a;
     tmp16b <= REG_COMB_tmp16b;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
