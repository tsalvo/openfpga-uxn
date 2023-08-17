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
-- Submodules: 10
entity opc_rot_0CLK_2b6aba52 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_rot_0CLK_2b6aba52;
architecture arch of opc_rot_0CLK_2b6aba52 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l179_c7_7282]
signal t_register_uxn_opcodes_h_l179_c7_7282_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l179_c7_7282_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l179_c7_7282_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_h_l180_c7_01ad]
signal n_register_uxn_opcodes_h_l180_c7_01ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l180_c7_01ad_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_h_l180_c7_01ad_return_output : unsigned(7 downto 0);

-- l_register[uxn_opcodes_h_l181_c7_e247]
signal l_register_uxn_opcodes_h_l181_c7_e247_CLOCK_ENABLE : unsigned(0 downto 0);
signal l_register_uxn_opcodes_h_l181_c7_e247_stack_index : unsigned(0 downto 0);
signal l_register_uxn_opcodes_h_l181_c7_e247_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l182_c9_768a]
signal set_uxn_opcodes_h_l182_c9_768a_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l182_c9_768a_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l182_c9_768a_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l182_c9_768a_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l182_c9_768a_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l182_c9_768a_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l182_c9_768a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l183_c6_6417]
signal BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l184_c1_d986]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l183_c2_9570]
signal result_MUX_uxn_opcodes_h_l183_c2_9570_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l183_c2_9570_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l183_c2_9570_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l183_c2_9570_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_h_l185_c3_6adb]
signal put_stack_uxn_opcodes_h_l185_c3_6adb_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l185_c3_6adb_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l185_c3_6adb_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l185_c3_6adb_value : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l186_c3_ba5c]
signal put_stack_uxn_opcodes_h_l186_c3_ba5c_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l186_c3_ba5c_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l186_c3_ba5c_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l186_c3_ba5c_value : unsigned(7 downto 0);

-- put_stack[uxn_opcodes_h_l187_c3_aec5]
signal put_stack_uxn_opcodes_h_l187_c3_aec5_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l187_c3_aec5_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_h_l187_c3_aec5_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_h_l187_c3_aec5_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l179_c7_7282
t_register_uxn_opcodes_h_l179_c7_7282 : entity work.t_register_0CLK_31d26cd6 port map (
clk,
t_register_uxn_opcodes_h_l179_c7_7282_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l179_c7_7282_stack_index,
t_register_uxn_opcodes_h_l179_c7_7282_return_output);

-- n_register_uxn_opcodes_h_l180_c7_01ad
n_register_uxn_opcodes_h_l180_c7_01ad : entity work.n_register_0CLK_31d26cd6 port map (
clk,
n_register_uxn_opcodes_h_l180_c7_01ad_CLOCK_ENABLE,
n_register_uxn_opcodes_h_l180_c7_01ad_stack_index,
n_register_uxn_opcodes_h_l180_c7_01ad_return_output);

-- l_register_uxn_opcodes_h_l181_c7_e247
l_register_uxn_opcodes_h_l181_c7_e247 : entity work.l_register_0CLK_31d26cd6 port map (
clk,
l_register_uxn_opcodes_h_l181_c7_e247_CLOCK_ENABLE,
l_register_uxn_opcodes_h_l181_c7_e247_stack_index,
l_register_uxn_opcodes_h_l181_c7_e247_return_output);

-- set_uxn_opcodes_h_l182_c9_768a
set_uxn_opcodes_h_l182_c9_768a : entity work.set_0CLK_95f06e5a port map (
clk,
set_uxn_opcodes_h_l182_c9_768a_CLOCK_ENABLE,
set_uxn_opcodes_h_l182_c9_768a_stack_index,
set_uxn_opcodes_h_l182_c9_768a_ins,
set_uxn_opcodes_h_l182_c9_768a_k,
set_uxn_opcodes_h_l182_c9_768a_mul,
set_uxn_opcodes_h_l182_c9_768a_add,
set_uxn_opcodes_h_l182_c9_768a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l183_c6_6417
BIN_OP_GT_uxn_opcodes_h_l183_c6_6417 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_left,
BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_right,
BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_return_output);

-- result_MUX_uxn_opcodes_h_l183_c2_9570
result_MUX_uxn_opcodes_h_l183_c2_9570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l183_c2_9570_cond,
result_MUX_uxn_opcodes_h_l183_c2_9570_iftrue,
result_MUX_uxn_opcodes_h_l183_c2_9570_iffalse,
result_MUX_uxn_opcodes_h_l183_c2_9570_return_output);

-- put_stack_uxn_opcodes_h_l185_c3_6adb
put_stack_uxn_opcodes_h_l185_c3_6adb : entity work.put_stack_0CLK_12466044 port map (
clk,
put_stack_uxn_opcodes_h_l185_c3_6adb_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l185_c3_6adb_stack_index,
put_stack_uxn_opcodes_h_l185_c3_6adb_offset,
put_stack_uxn_opcodes_h_l185_c3_6adb_value);

-- put_stack_uxn_opcodes_h_l186_c3_ba5c
put_stack_uxn_opcodes_h_l186_c3_ba5c : entity work.put_stack_0CLK_12466044 port map (
clk,
put_stack_uxn_opcodes_h_l186_c3_ba5c_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l186_c3_ba5c_stack_index,
put_stack_uxn_opcodes_h_l186_c3_ba5c_offset,
put_stack_uxn_opcodes_h_l186_c3_ba5c_value);

-- put_stack_uxn_opcodes_h_l187_c3_aec5
put_stack_uxn_opcodes_h_l187_c3_aec5 : entity work.put_stack_0CLK_12466044 port map (
clk,
put_stack_uxn_opcodes_h_l187_c3_aec5_CLOCK_ENABLE,
put_stack_uxn_opcodes_h_l187_c3_aec5_stack_index,
put_stack_uxn_opcodes_h_l187_c3_aec5_offset,
put_stack_uxn_opcodes_h_l187_c3_aec5_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 l8,
 n8,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l179_c7_7282_return_output,
 n_register_uxn_opcodes_h_l180_c7_01ad_return_output,
 l_register_uxn_opcodes_h_l181_c7_e247_return_output,
 set_uxn_opcodes_h_l182_c9_768a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_return_output,
 result_MUX_uxn_opcodes_h_l183_c2_9570_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l179_c7_7282_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l179_c7_7282_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l179_c7_7282_return_output : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l180_c7_01ad_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l180_c7_01ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_h_l180_c7_01ad_return_output : unsigned(7 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l181_c7_e247_stack_index : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l181_c7_e247_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_h_l181_c7_e247_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_768a_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_768a_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_768a_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_768a_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_768a_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_768a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l182_c9_768a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l185_c3_6adb_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l185_c3_6adb_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l185_c3_6adb_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l185_c3_6adb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l186_c3_ba5c_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l186_c3_ba5c_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l186_c3_ba5c_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l186_c3_ba5c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l187_c3_aec5_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l187_c3_aec5_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l187_c3_aec5_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_h_l187_c3_aec5_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_l8 := l8;
  REG_VAR_n8 := n8;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_put_stack_uxn_opcodes_h_l186_c3_ba5c_offset := resize(to_unsigned(1, 1), 8);
     VAR_put_stack_uxn_opcodes_h_l185_c3_6adb_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l182_c9_768a_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_set_uxn_opcodes_h_l182_c9_768a_mul := resize(to_unsigned(3, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_iffalse := to_unsigned(0, 1);
     VAR_put_stack_uxn_opcodes_h_l187_c3_aec5_offset := resize(to_unsigned(2, 2), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_k := k;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_iffalse := VAR_CLOCK_ENABLE;
     VAR_l_register_uxn_opcodes_h_l181_c7_e247_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_n_register_uxn_opcodes_h_l180_c7_01ad_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l182_c9_768a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l179_c7_7282_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l182_c9_768a_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l182_c9_768a_k := VAR_k;
     VAR_l_register_uxn_opcodes_h_l181_c7_e247_stack_index := VAR_stack_index;
     VAR_n_register_uxn_opcodes_h_l180_c7_01ad_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l185_c3_6adb_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l186_c3_ba5c_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_h_l187_c3_aec5_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l182_c9_768a_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l179_c7_7282_stack_index := VAR_stack_index;
     -- l_register[uxn_opcodes_h_l181_c7_e247] LATENCY=0
     -- Clock enable
     l_register_uxn_opcodes_h_l181_c7_e247_CLOCK_ENABLE <= VAR_l_register_uxn_opcodes_h_l181_c7_e247_CLOCK_ENABLE;
     -- Inputs
     l_register_uxn_opcodes_h_l181_c7_e247_stack_index <= VAR_l_register_uxn_opcodes_h_l181_c7_e247_stack_index;
     -- Outputs
     VAR_l_register_uxn_opcodes_h_l181_c7_e247_return_output := l_register_uxn_opcodes_h_l181_c7_e247_return_output;

     -- n_register[uxn_opcodes_h_l180_c7_01ad] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_h_l180_c7_01ad_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_h_l180_c7_01ad_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_h_l180_c7_01ad_stack_index <= VAR_n_register_uxn_opcodes_h_l180_c7_01ad_stack_index;
     -- Outputs
     VAR_n_register_uxn_opcodes_h_l180_c7_01ad_return_output := n_register_uxn_opcodes_h_l180_c7_01ad_return_output;

     -- t_register[uxn_opcodes_h_l179_c7_7282] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l179_c7_7282_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l179_c7_7282_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l179_c7_7282_stack_index <= VAR_t_register_uxn_opcodes_h_l179_c7_7282_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l179_c7_7282_return_output := t_register_uxn_opcodes_h_l179_c7_7282_return_output;

     -- set[uxn_opcodes_h_l182_c9_768a] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l182_c9_768a_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l182_c9_768a_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l182_c9_768a_stack_index <= VAR_set_uxn_opcodes_h_l182_c9_768a_stack_index;
     set_uxn_opcodes_h_l182_c9_768a_ins <= VAR_set_uxn_opcodes_h_l182_c9_768a_ins;
     set_uxn_opcodes_h_l182_c9_768a_k <= VAR_set_uxn_opcodes_h_l182_c9_768a_k;
     set_uxn_opcodes_h_l182_c9_768a_mul <= VAR_set_uxn_opcodes_h_l182_c9_768a_mul;
     set_uxn_opcodes_h_l182_c9_768a_add <= VAR_set_uxn_opcodes_h_l182_c9_768a_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l182_c9_768a_return_output := set_uxn_opcodes_h_l182_c9_768a_return_output;

     -- Submodule level 1
     REG_VAR_l8 := VAR_l_register_uxn_opcodes_h_l181_c7_e247_return_output;
     VAR_put_stack_uxn_opcodes_h_l185_c3_6adb_value := VAR_l_register_uxn_opcodes_h_l181_c7_e247_return_output;
     REG_VAR_n8 := VAR_n_register_uxn_opcodes_h_l180_c7_01ad_return_output;
     VAR_put_stack_uxn_opcodes_h_l187_c3_aec5_value := VAR_n_register_uxn_opcodes_h_l180_c7_01ad_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_left := VAR_set_uxn_opcodes_h_l182_c9_768a_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l182_c9_768a_return_output;
     VAR_put_stack_uxn_opcodes_h_l186_c3_ba5c_value := VAR_t_register_uxn_opcodes_h_l179_c7_7282_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l179_c7_7282_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l183_c6_6417] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_left;
     BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_return_output := BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_return_output;
     VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l183_c6_6417_return_output;
     -- result_MUX[uxn_opcodes_h_l183_c2_9570] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l183_c2_9570_cond <= VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_cond;
     result_MUX_uxn_opcodes_h_l183_c2_9570_iftrue <= VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_iftrue;
     result_MUX_uxn_opcodes_h_l183_c2_9570_iffalse <= VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_return_output := result_MUX_uxn_opcodes_h_l183_c2_9570_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l184_c1_d986] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_return_output;

     -- Submodule level 3
     VAR_put_stack_uxn_opcodes_h_l185_c3_6adb_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_return_output;
     VAR_put_stack_uxn_opcodes_h_l186_c3_ba5c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_return_output;
     VAR_put_stack_uxn_opcodes_h_l187_c3_aec5_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l184_c1_d986_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l183_c2_9570_return_output;
     -- put_stack[uxn_opcodes_h_l185_c3_6adb] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l185_c3_6adb_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l185_c3_6adb_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l185_c3_6adb_stack_index <= VAR_put_stack_uxn_opcodes_h_l185_c3_6adb_stack_index;
     put_stack_uxn_opcodes_h_l185_c3_6adb_offset <= VAR_put_stack_uxn_opcodes_h_l185_c3_6adb_offset;
     put_stack_uxn_opcodes_h_l185_c3_6adb_value <= VAR_put_stack_uxn_opcodes_h_l185_c3_6adb_value;
     -- Outputs

     -- put_stack[uxn_opcodes_h_l186_c3_ba5c] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l186_c3_ba5c_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l186_c3_ba5c_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l186_c3_ba5c_stack_index <= VAR_put_stack_uxn_opcodes_h_l186_c3_ba5c_stack_index;
     put_stack_uxn_opcodes_h_l186_c3_ba5c_offset <= VAR_put_stack_uxn_opcodes_h_l186_c3_ba5c_offset;
     put_stack_uxn_opcodes_h_l186_c3_ba5c_value <= VAR_put_stack_uxn_opcodes_h_l186_c3_ba5c_value;
     -- Outputs

     -- put_stack[uxn_opcodes_h_l187_c3_aec5] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_h_l187_c3_aec5_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_h_l187_c3_aec5_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_h_l187_c3_aec5_stack_index <= VAR_put_stack_uxn_opcodes_h_l187_c3_aec5_stack_index;
     put_stack_uxn_opcodes_h_l187_c3_aec5_offset <= VAR_put_stack_uxn_opcodes_h_l187_c3_aec5_offset;
     put_stack_uxn_opcodes_h_l187_c3_aec5_value <= VAR_put_stack_uxn_opcodes_h_l187_c3_aec5_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     l8 <= REG_COMB_l8;
     n8 <= REG_COMB_n8;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
