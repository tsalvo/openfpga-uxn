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
-- Submodules: 11
entity opc_str2_0CLK_ba9e7521 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_str2_0CLK_ba9e7521;
architecture arch of opc_str2_0CLK_ba9e7521 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l621_c7_23af]
signal t_register_uxn_opcodes_h_l621_c7_23af_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l621_c7_23af_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l621_c7_23af_return_output : unsigned(7 downto 0);

-- h2_register[uxn_opcodes_h_l622_c8_6ca7]
signal h2_register_uxn_opcodes_h_l622_c8_6ca7_CLOCK_ENABLE : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_h_l622_c8_6ca7_stack_index : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_h_l622_c8_6ca7_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l623_c9_1126]
signal set_uxn_opcodes_h_l623_c9_1126_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l623_c9_1126_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l623_c9_1126_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l623_c9_1126_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l623_c9_1126_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l623_c9_1126_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l623_c9_1126_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l624_c6_4baa]
signal BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l625_c1_32c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l624_c2_e94a]
signal t16_MUX_uxn_opcodes_h_l624_c2_e94a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c2_e94a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c2_e94a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c2_e94a_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_h_l624_c2_e94a]
signal result_MUX_uxn_opcodes_h_l624_c2_e94a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l624_c2_e94a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l624_c2_e94a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l624_c2_e94a_return_output : unsigned(0 downto 0);

-- pc_get[uxn_opcodes_h_l626_c9_ce32]
signal pc_get_uxn_opcodes_h_l626_c9_ce32_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l626_c9_ce32_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l626_c9_710c]
signal BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_return_output : signed(17 downto 0);

-- poke2_ram[uxn_opcodes_h_l627_c3_7b8c]
signal poke2_ram_uxn_opcodes_h_l627_c3_7b8c_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke2_ram_uxn_opcodes_h_l627_c3_7b8c_address : unsigned(15 downto 0);
signal poke2_ram_uxn_opcodes_h_l627_c3_7b8c_value : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l621_c7_23af
t_register_uxn_opcodes_h_l621_c7_23af : entity work.t_register_0CLK_0e5af5c0 port map (
clk,
t_register_uxn_opcodes_h_l621_c7_23af_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l621_c7_23af_stack_index,
t_register_uxn_opcodes_h_l621_c7_23af_return_output);

-- h2_register_uxn_opcodes_h_l622_c8_6ca7
h2_register_uxn_opcodes_h_l622_c8_6ca7 : entity work.h2_register_0CLK_efc3e079 port map (
clk,
h2_register_uxn_opcodes_h_l622_c8_6ca7_CLOCK_ENABLE,
h2_register_uxn_opcodes_h_l622_c8_6ca7_stack_index,
h2_register_uxn_opcodes_h_l622_c8_6ca7_return_output);

-- set_uxn_opcodes_h_l623_c9_1126
set_uxn_opcodes_h_l623_c9_1126 : entity work.set_0CLK_082cb698 port map (
clk,
set_uxn_opcodes_h_l623_c9_1126_CLOCK_ENABLE,
set_uxn_opcodes_h_l623_c9_1126_stack_index,
set_uxn_opcodes_h_l623_c9_1126_ins,
set_uxn_opcodes_h_l623_c9_1126_k,
set_uxn_opcodes_h_l623_c9_1126_mul,
set_uxn_opcodes_h_l623_c9_1126_add,
set_uxn_opcodes_h_l623_c9_1126_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa
BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_left,
BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_right,
BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_return_output);

-- t16_MUX_uxn_opcodes_h_l624_c2_e94a
t16_MUX_uxn_opcodes_h_l624_c2_e94a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l624_c2_e94a_cond,
t16_MUX_uxn_opcodes_h_l624_c2_e94a_iftrue,
t16_MUX_uxn_opcodes_h_l624_c2_e94a_iffalse,
t16_MUX_uxn_opcodes_h_l624_c2_e94a_return_output);

-- result_MUX_uxn_opcodes_h_l624_c2_e94a
result_MUX_uxn_opcodes_h_l624_c2_e94a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l624_c2_e94a_cond,
result_MUX_uxn_opcodes_h_l624_c2_e94a_iftrue,
result_MUX_uxn_opcodes_h_l624_c2_e94a_iffalse,
result_MUX_uxn_opcodes_h_l624_c2_e94a_return_output);

-- pc_get_uxn_opcodes_h_l626_c9_ce32
pc_get_uxn_opcodes_h_l626_c9_ce32 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l626_c9_ce32_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l626_c9_ce32_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c
BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_left,
BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_right,
BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_return_output);

-- poke2_ram_uxn_opcodes_h_l627_c3_7b8c
poke2_ram_uxn_opcodes_h_l627_c3_7b8c : entity work.poke2_ram_0CLK_380ecc95 port map (
clk,
poke2_ram_uxn_opcodes_h_l627_c3_7b8c_CLOCK_ENABLE,
poke2_ram_uxn_opcodes_h_l627_c3_7b8c_address,
poke2_ram_uxn_opcodes_h_l627_c3_7b8c_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 n16,
 t16,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l621_c7_23af_return_output,
 h2_register_uxn_opcodes_h_l622_c8_6ca7_return_output,
 set_uxn_opcodes_h_l623_c9_1126_return_output,
 BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_return_output,
 t16_MUX_uxn_opcodes_h_l624_c2_e94a_return_output,
 result_MUX_uxn_opcodes_h_l624_c2_e94a_return_output,
 pc_get_uxn_opcodes_h_l626_c9_ce32_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l621_c7_23af_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l621_c7_23af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l621_c7_23af_return_output : unsigned(7 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l622_c8_6ca7_stack_index : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l622_c8_6ca7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_h_l622_c8_6ca7_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1126_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1126_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1126_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1126_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1126_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1126_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l623_c9_1126_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_e94a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_e94a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_uxn_opcodes_h_l626_c3_ff80 : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_e94a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_e94a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_left : signed(16 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l626_c9_ce32_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l626_c9_ce32_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l626_c21_c1a2_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_return_output : signed(17 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l627_c3_7b8c_address : unsigned(15 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l627_c3_7b8c_value : unsigned(15 downto 0);
 variable VAR_poke2_ram_uxn_opcodes_h_l627_c3_7b8c_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16 := n16;
  REG_VAR_t16 := t16;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l623_c9_1126_mul := resize(to_unsigned(3, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l623_c9_1126_add := resize(to_signed(-3, 3), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_iffalse := VAR_CLOCK_ENABLE;
     VAR_h2_register_uxn_opcodes_h_l622_c8_6ca7_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l623_c9_1126_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l621_c7_23af_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l623_c9_1126_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l623_c9_1126_k := VAR_k;
     VAR_h2_register_uxn_opcodes_h_l622_c8_6ca7_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l623_c9_1126_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l621_c7_23af_stack_index := VAR_stack_index;
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_e94a_iftrue := t16;
     -- h2_register[uxn_opcodes_h_l622_c8_6ca7] LATENCY=0
     -- Clock enable
     h2_register_uxn_opcodes_h_l622_c8_6ca7_CLOCK_ENABLE <= VAR_h2_register_uxn_opcodes_h_l622_c8_6ca7_CLOCK_ENABLE;
     -- Inputs
     h2_register_uxn_opcodes_h_l622_c8_6ca7_stack_index <= VAR_h2_register_uxn_opcodes_h_l622_c8_6ca7_stack_index;
     -- Outputs
     VAR_h2_register_uxn_opcodes_h_l622_c8_6ca7_return_output := h2_register_uxn_opcodes_h_l622_c8_6ca7_return_output;

     -- t_register[uxn_opcodes_h_l621_c7_23af] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l621_c7_23af_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l621_c7_23af_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l621_c7_23af_stack_index <= VAR_t_register_uxn_opcodes_h_l621_c7_23af_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l621_c7_23af_return_output := t_register_uxn_opcodes_h_l621_c7_23af_return_output;

     -- set[uxn_opcodes_h_l623_c9_1126] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l623_c9_1126_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l623_c9_1126_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l623_c9_1126_stack_index <= VAR_set_uxn_opcodes_h_l623_c9_1126_stack_index;
     set_uxn_opcodes_h_l623_c9_1126_ins <= VAR_set_uxn_opcodes_h_l623_c9_1126_ins;
     set_uxn_opcodes_h_l623_c9_1126_k <= VAR_set_uxn_opcodes_h_l623_c9_1126_k;
     set_uxn_opcodes_h_l623_c9_1126_mul <= VAR_set_uxn_opcodes_h_l623_c9_1126_mul;
     set_uxn_opcodes_h_l623_c9_1126_add <= VAR_set_uxn_opcodes_h_l623_c9_1126_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l623_c9_1126_return_output := set_uxn_opcodes_h_l623_c9_1126_return_output;

     -- Submodule level 1
     REG_VAR_n16 := VAR_h2_register_uxn_opcodes_h_l622_c8_6ca7_return_output;
     VAR_poke2_ram_uxn_opcodes_h_l627_c3_7b8c_value := VAR_h2_register_uxn_opcodes_h_l622_c8_6ca7_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_left := VAR_set_uxn_opcodes_h_l623_c9_1126_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l623_c9_1126_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l621_c7_23af_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l624_c6_4baa] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_left;
     BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_return_output := BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l626_c21_c1a2] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l626_c21_c1a2_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l621_c7_23af_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_return_output;
     VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_e94a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l624_c6_4baa_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l626_c21_c1a2_return_output;
     -- result_MUX[uxn_opcodes_h_l624_c2_e94a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l624_c2_e94a_cond <= VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_cond;
     result_MUX_uxn_opcodes_h_l624_c2_e94a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_iftrue;
     result_MUX_uxn_opcodes_h_l624_c2_e94a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_return_output := result_MUX_uxn_opcodes_h_l624_c2_e94a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l625_c1_32c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_return_output;

     -- Submodule level 3
     VAR_pc_get_uxn_opcodes_h_l626_c9_ce32_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_return_output;
     VAR_poke2_ram_uxn_opcodes_h_l627_c3_7b8c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l625_c1_32c8_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l624_c2_e94a_return_output;
     -- pc_get[uxn_opcodes_h_l626_c9_ce32] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l626_c9_ce32_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l626_c9_ce32_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l626_c9_ce32_return_output := pc_get_uxn_opcodes_h_l626_c9_ce32_return_output;

     -- Submodule level 4
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_left := signed(std_logic_vector(resize(VAR_pc_get_uxn_opcodes_h_l626_c9_ce32_return_output, 17)));
     -- BIN_OP_PLUS[uxn_opcodes_h_l626_c9_710c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_return_output;

     -- Submodule level 5
     VAR_t16_uxn_opcodes_h_l626_c3_ff80 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l626_c9_710c_return_output)),16);
     VAR_poke2_ram_uxn_opcodes_h_l627_c3_7b8c_address := VAR_t16_uxn_opcodes_h_l626_c3_ff80;
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_e94a_iffalse := VAR_t16_uxn_opcodes_h_l626_c3_ff80;
     -- poke2_ram[uxn_opcodes_h_l627_c3_7b8c] LATENCY=0
     -- Clock enable
     poke2_ram_uxn_opcodes_h_l627_c3_7b8c_CLOCK_ENABLE <= VAR_poke2_ram_uxn_opcodes_h_l627_c3_7b8c_CLOCK_ENABLE;
     -- Inputs
     poke2_ram_uxn_opcodes_h_l627_c3_7b8c_address <= VAR_poke2_ram_uxn_opcodes_h_l627_c3_7b8c_address;
     poke2_ram_uxn_opcodes_h_l627_c3_7b8c_value <= VAR_poke2_ram_uxn_opcodes_h_l627_c3_7b8c_value;
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l624_c2_e94a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l624_c2_e94a_cond <= VAR_t16_MUX_uxn_opcodes_h_l624_c2_e94a_cond;
     t16_MUX_uxn_opcodes_h_l624_c2_e94a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l624_c2_e94a_iftrue;
     t16_MUX_uxn_opcodes_h_l624_c2_e94a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l624_c2_e94a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_e94a_return_output := t16_MUX_uxn_opcodes_h_l624_c2_e94a_return_output;

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l624_c2_e94a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n16 <= REG_COMB_n16;
     t16 <= REG_COMB_t16;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
