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
-- Submodules: 8
entity opc_ldz2_0CLK_7c39c135 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_ldz2_0CLK_7c39c135;
architecture arch of opc_ldz2_0CLK_7c39c135 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l528_c7_bade]
signal t_register_uxn_opcodes_h_l528_c7_bade_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l528_c7_bade_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l528_c7_bade_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l530_c9_1551]
signal set_uxn_opcodes_h_l530_c9_1551_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l530_c9_1551_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l530_c9_1551_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l530_c9_1551_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l530_c9_1551_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l530_c9_1551_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l530_c9_1551_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l531_c6_61fd]
signal BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c1_ffb0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l531_c2_ee9d]
signal result_MUX_uxn_opcodes_h_l531_c2_ee9d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l531_c2_ee9d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l531_c2_ee9d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l531_c2_ee9d_return_output : unsigned(0 downto 0);

-- peek2_ram[uxn_opcodes_h_l533_c30_3fe5]
signal peek2_ram_uxn_opcodes_h_l533_c30_3fe5_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_h_l533_c30_3fe5_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_h_l533_c30_3fe5_return_output : unsigned(15 downto 0);

-- put2_stack[uxn_opcodes_h_l533_c3_29f3]
signal put2_stack_uxn_opcodes_h_l533_c3_29f3_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l533_c3_29f3_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l533_c3_29f3_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l533_c3_29f3_value : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l528_c7_bade
t_register_uxn_opcodes_h_l528_c7_bade : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l528_c7_bade_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l528_c7_bade_stack_index,
t_register_uxn_opcodes_h_l528_c7_bade_return_output);

-- set_uxn_opcodes_h_l530_c9_1551
set_uxn_opcodes_h_l530_c9_1551 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l530_c9_1551_CLOCK_ENABLE,
set_uxn_opcodes_h_l530_c9_1551_stack_index,
set_uxn_opcodes_h_l530_c9_1551_ins,
set_uxn_opcodes_h_l530_c9_1551_k,
set_uxn_opcodes_h_l530_c9_1551_mul,
set_uxn_opcodes_h_l530_c9_1551_add,
set_uxn_opcodes_h_l530_c9_1551_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd
BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_left,
BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_right,
BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_return_output);

-- result_MUX_uxn_opcodes_h_l531_c2_ee9d
result_MUX_uxn_opcodes_h_l531_c2_ee9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l531_c2_ee9d_cond,
result_MUX_uxn_opcodes_h_l531_c2_ee9d_iftrue,
result_MUX_uxn_opcodes_h_l531_c2_ee9d_iffalse,
result_MUX_uxn_opcodes_h_l531_c2_ee9d_return_output);

-- peek2_ram_uxn_opcodes_h_l533_c30_3fe5
peek2_ram_uxn_opcodes_h_l533_c30_3fe5 : entity work.peek2_ram_0CLK_ad162598 port map (
clk,
peek2_ram_uxn_opcodes_h_l533_c30_3fe5_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_h_l533_c30_3fe5_address,
peek2_ram_uxn_opcodes_h_l533_c30_3fe5_return_output);

-- put2_stack_uxn_opcodes_h_l533_c3_29f3
put2_stack_uxn_opcodes_h_l533_c3_29f3 : entity work.put2_stack_0CLK_52228af0 port map (
clk,
put2_stack_uxn_opcodes_h_l533_c3_29f3_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l533_c3_29f3_stack_index,
put2_stack_uxn_opcodes_h_l533_c3_29f3_offset,
put2_stack_uxn_opcodes_h_l533_c3_29f3_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t16,
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l528_c7_bade_return_output,
 set_uxn_opcodes_h_l530_c9_1551_return_output,
 BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_return_output,
 result_MUX_uxn_opcodes_h_l531_c2_ee9d_return_output,
 peek2_ram_uxn_opcodes_h_l533_c30_3fe5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l528_c7_bade_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l528_c7_bade_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l528_c7_bade_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l529_c8_1d87_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_1551_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_1551_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_1551_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_1551_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_1551_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_1551_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l530_c9_1551_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l533_c3_29f3_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l533_c3_29f3_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l533_c3_29f3_value : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l533_c30_3fe5_address : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l533_c30_3fe5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l533_c30_3fe5_return_output : unsigned(15 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l533_c3_29f3_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l530_c9_1551_add := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l530_c9_1551_mul := resize(to_unsigned(1, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_iftrue := to_unsigned(0, 1);
     VAR_put2_stack_uxn_opcodes_h_l533_c3_29f3_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l530_c9_1551_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l528_c7_bade_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l530_c9_1551_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l530_c9_1551_k := VAR_k;
     VAR_put2_stack_uxn_opcodes_h_l533_c3_29f3_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l530_c9_1551_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l528_c7_bade_stack_index := VAR_stack_index;
     -- t_register[uxn_opcodes_h_l528_c7_bade] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l528_c7_bade_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l528_c7_bade_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l528_c7_bade_stack_index <= VAR_t_register_uxn_opcodes_h_l528_c7_bade_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l528_c7_bade_return_output := t_register_uxn_opcodes_h_l528_c7_bade_return_output;

     -- set[uxn_opcodes_h_l530_c9_1551] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l530_c9_1551_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l530_c9_1551_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l530_c9_1551_stack_index <= VAR_set_uxn_opcodes_h_l530_c9_1551_stack_index;
     set_uxn_opcodes_h_l530_c9_1551_ins <= VAR_set_uxn_opcodes_h_l530_c9_1551_ins;
     set_uxn_opcodes_h_l530_c9_1551_k <= VAR_set_uxn_opcodes_h_l530_c9_1551_k;
     set_uxn_opcodes_h_l530_c9_1551_mul <= VAR_set_uxn_opcodes_h_l530_c9_1551_mul;
     set_uxn_opcodes_h_l530_c9_1551_add <= VAR_set_uxn_opcodes_h_l530_c9_1551_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l530_c9_1551_return_output := set_uxn_opcodes_h_l530_c9_1551_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_left := VAR_set_uxn_opcodes_h_l530_c9_1551_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l530_c9_1551_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l528_c7_bade_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l531_c6_61fd] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_left;
     BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_return_output := BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l529_c8_1d87] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l529_c8_1d87_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l528_c7_bade_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_return_output;
     VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l531_c6_61fd_return_output;
     VAR_peek2_ram_uxn_opcodes_h_l533_c30_3fe5_address := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l529_c8_1d87_return_output;
     REG_VAR_t16 := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l529_c8_1d87_return_output;
     -- result_MUX[uxn_opcodes_h_l531_c2_ee9d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l531_c2_ee9d_cond <= VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_cond;
     result_MUX_uxn_opcodes_h_l531_c2_ee9d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_iftrue;
     result_MUX_uxn_opcodes_h_l531_c2_ee9d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_return_output := result_MUX_uxn_opcodes_h_l531_c2_ee9d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l532_c1_ffb0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_return_output;

     -- Submodule level 3
     VAR_peek2_ram_uxn_opcodes_h_l533_c30_3fe5_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_return_output;
     VAR_put2_stack_uxn_opcodes_h_l533_c3_29f3_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l532_c1_ffb0_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l531_c2_ee9d_return_output;
     -- peek2_ram[uxn_opcodes_h_l533_c30_3fe5] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_h_l533_c30_3fe5_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_h_l533_c30_3fe5_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_h_l533_c30_3fe5_address <= VAR_peek2_ram_uxn_opcodes_h_l533_c30_3fe5_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_h_l533_c30_3fe5_return_output := peek2_ram_uxn_opcodes_h_l533_c30_3fe5_return_output;

     -- Submodule level 4
     VAR_put2_stack_uxn_opcodes_h_l533_c3_29f3_value := VAR_peek2_ram_uxn_opcodes_h_l533_c30_3fe5_return_output;
     -- put2_stack[uxn_opcodes_h_l533_c3_29f3] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l533_c3_29f3_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l533_c3_29f3_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l533_c3_29f3_stack_index <= VAR_put2_stack_uxn_opcodes_h_l533_c3_29f3_stack_index;
     put2_stack_uxn_opcodes_h_l533_c3_29f3_offset <= VAR_put2_stack_uxn_opcodes_h_l533_c3_29f3_offset;
     put2_stack_uxn_opcodes_h_l533_c3_29f3_value <= VAR_put2_stack_uxn_opcodes_h_l533_c3_29f3_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
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
     t16 <= REG_COMB_t16;
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
